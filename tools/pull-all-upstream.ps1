$ErrorActionPreference = "Stop"

$Here = Split-Path -Parent $MyInvocation.MyCommand.Path
$BundleRoot = Split-Path -Parent $Here
$Target = Join-Path $BundleRoot "upstream"

Write-Host "=== Codex 6 Video Skills: Pull all upstream repositories ===" -ForegroundColor Cyan

if (-not (Get-Command git -ErrorAction SilentlyContinue)) {
    Write-Host "Git not found." -ForegroundColor Red
    Write-Host "Install Git for Windows first: winget install --id Git.Git -e"
    exit 1
}

New-Item -ItemType Directory -Force -Path $Target | Out-Null

$repos = @(
    @{ Name = "hyperframes"; Url = "https://github.com/heygen-com/hyperframes.git" },
    @{ Name = "video-use"; Url = "https://github.com/browser-use/video-use.git" },
    @{ Name = "remotion-skills"; Url = "https://github.com/remotion-dev/skills.git" },
    @{ Name = "generative-media-skills"; Url = "https://github.com/SamurAIGPT/Generative-Media-Skills.git" },
    @{ Name = "chengfeng-videocut-skills"; Url = "https://github.com/Agentchengfeng/chengfeng-videocut-skills.git" },
    @{ Name = "seedance2-skill"; Url = "https://github.com/dexhunter/seedance2-skill.git" }
)

foreach ($repo in $repos) {
    $dest = Join-Path $Target $repo.Name
    if (Test-Path (Join-Path $dest ".git")) {
        Write-Host "[UPDATE] $($repo.Name)" -ForegroundColor Yellow
        git -C $dest pull --ff-only
    }
    elseif (Test-Path $dest) {
        Write-Host "[SKIP] $dest exists but is not a Git repo. Rename/delete it and rerun." -ForegroundColor Yellow
    }
    else {
        Write-Host "[CLONE] $($repo.Name)" -ForegroundColor Green
        git clone --depth 1 $repo.Url $dest
    }
}

Write-Host ""
Write-Host "Done. Full upstream sources are under:" -ForegroundColor Cyan
Write-Host $Target
