$ErrorActionPreference = "Stop"

Write-Host "=== Install common Agent Skills ===" -ForegroundColor Cyan

if (-not (Get-Command node -ErrorAction SilentlyContinue)) {
    Write-Host "Node.js not found. Install Node.js first." -ForegroundColor Red
    Write-Host "Windows: winget install OpenJS.NodeJS.LTS"
    exit 1
}

if (-not (Get-Command npx -ErrorAction SilentlyContinue)) {
    Write-Host "npx not found. Reinstall/repair Node.js." -ForegroundColor Red
    exit 1
}

Write-Host ""
Write-Host "[1/3] HyperFrames" -ForegroundColor Green
npx --yes skills add heygen-com/hyperframes

Write-Host ""
Write-Host "[2/3] Remotion Agent Skills" -ForegroundColor Green
npx --yes skills add remotion-dev/skills

Write-Host ""
Write-Host "[3/3] Seedance 2" -ForegroundColor Green
npx --yes skills add dexhunter/seedance2-skill

Write-Host ""
Write-Host "Common skills installation finished." -ForegroundColor Cyan
Write-Host "video-use, Generative Media, and chengfeng-videocut require their own upstream setup."
Write-Host "Run pull-all-upstream.ps1 and read README.md / docs\INSTALL_NOTES.md."
