@echo off
title PMC Property Tax - Frontend (Port 5173)
cd /d "%~dp0frontend"

echo ========================================================
echo   PMC Smart Property Tax Portal - React Vite Frontend
echo ========================================================
echo.

where npm >nul 2>&1
if %ERRORLEVEL% NEQ 0 (
    echo [ERROR] Node.js / npm is not installed or not in PATH.
    pause
    exit /b 1
)

echo Starting Vite React Dev Server on http://localhost:5173 ...
echo.

call npm run dev
pause
