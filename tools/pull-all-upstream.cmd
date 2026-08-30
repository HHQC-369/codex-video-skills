@echo off
setlocal
powershell -NoProfile -ExecutionPolicy Bypass -File "%~dp0pull-all-upstream.ps1"
echo.
pause
