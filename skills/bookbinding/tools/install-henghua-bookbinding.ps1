param(
  [Parameter(Mandatory=$true)][string]$ExpertZip,
  [string]$FactoryZip,
  [string]$ValidationZip,
  [string]$SkillHome = "$HOME\.codex\skills",
  [string]$SourceHome = "$HOME\.codex\skill-sources\HenghuaBookBinding"
)

$ErrorActionPreference = 'Stop'

function Assert-Hash([string]$Path,[string]$Expected) {
  if (-not (Test-Path -LiteralPath $Path)) { throw "File not found: $Path" }
  $actual = (Get-FileHash -Algorithm SHA256 -LiteralPath $Path).Hash.ToLowerInvariant()
  if ($actual -ne $Expected.ToLowerInvariant()) { throw "SHA256 mismatch: $Path`nExpected: $Expected`nActual:   $actual" }
}

$expertHash = '9481e76a7c53d7165eee19007afd628d58b68ca6c788ac29fe344577d6651b00'
$factoryHash = '40558bf425df1d179d39592705354633ef781d29b5758b746313b3780595f1bf'
$validatorHash = 'e3019ab560ad9637327203b709a13f9e2bd3128997af9d8c7a758e7560ca28c1'

Assert-Hash $ExpertZip $expertHash
New-Item -ItemType Directory -Force -Path $SkillHome | Out-Null
$tmp = Join-Path $env:TEMP ('hhbb-' + [guid]::NewGuid().ToString('N'))
New-Item -ItemType Directory -Force -Path $tmp | Out-Null
try {
  Expand-Archive -LiteralPath $ExpertZip -DestinationPath $tmp -Force
  $src = Join-Path $tmp 'HenghuaBookBindingExpert'
  if (-not (Test-Path $src)) { throw 'HenghuaBookBindingExpert folder missing in Expert ZIP.' }
  $dst = Join-Path $SkillHome 'HenghuaBookBindingExpert'
  if (Test-Path $dst) { Remove-Item -Recurse -Force $dst }
  Copy-Item -Recurse -Force $src $dst
  Write-Host "Installed: $dst"
} finally {
  if (Test-Path $tmp) { Remove-Item -Recurse -Force $tmp }
}

New-Item -ItemType Directory -Force -Path $SourceHome | Out-Null
if ($FactoryZip) {
  Assert-Hash $FactoryZip $factoryHash
  $fd = Join-Path $SourceHome 'factory-v3.19.0'
  if (Test-Path $fd) { Remove-Item -Recurse -Force $fd }
  Expand-Archive -LiteralPath $FactoryZip -DestinationPath $fd -Force
  Write-Host "Factory archived: $fd"
}
if ($ValidationZip) {
  Assert-Hash $ValidationZip $validatorHash
  $vd = Join-Path $SourceHome 'validation-v1.15.0'
  if (Test-Path $vd) { Remove-Item -Recurse -Force $vd }
  Expand-Archive -LiteralPath $ValidationZip -DestinationPath $vd -Force
  Write-Host "Validation Center archived: $vd"
}

Write-Host 'Henghua BookBinding v3.19.0 install complete.'
