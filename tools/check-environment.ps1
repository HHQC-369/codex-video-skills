$tools = @("git","node","npx","ffmpeg","ffprobe","python","codex")
Write-Host "=== Environment check ===" -ForegroundColor Cyan
foreach ($t in $tools) {
    $cmd = Get-Command $t -ErrorAction SilentlyContinue
    if ($cmd) {
        Write-Host ("[OK]   {0,-10} {1}" -f $t, $cmd.Source) -ForegroundColor Green
    } else {
        Write-Host ("[MISS] {0}" -f $t) -ForegroundColor Yellow
    }
}
