@echo off
setlocal
if "%~1"=="" (
  echo Usage: one-click-validate.bat ^<source-folder-or-zip^>
  exit /b 2
)
if /I "%~x1"==".zip" (
  python scripts\run_validation.py --target-zip "%~1"
) else (
  python scripts\run_validation.py --target "%~1"
)
exit /b %errorlevel%
