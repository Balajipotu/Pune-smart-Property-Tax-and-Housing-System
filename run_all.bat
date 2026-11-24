@echo off
title PMC Smart Property Tax Portal - Launcher
cd /d "%~dp0"

echo =========================================================================
echo   Pune Municipal Corporation (PMC) Smart Property Tax Portal Launcher
echo =========================================================================
echo.
echo 1. Launching Backend (Spring Boot 3 on Port 8085)...
start "PMC Backend (Port 8085)" cmd /k ""%~dp0start_backend.bat""

echo 2. Waiting 3 seconds before launching Frontend...
timeout /t 3 /nobreak >nul

echo 3. Launching Frontend (React + Vite on Port 5173)...
start "PMC Frontend (Port 5173)" cmd /k ""%~dp0start_frontend.bat""

echo 4. Waiting 4 seconds, then opening application in your default browser...
timeout /t 4 /nobreak >nul
start http://localhost:5173

echo.
echo =========================================================================
echo  Application launched successfully!
echo   - Frontend:   http://localhost:5173
echo   - Backend:    http://localhost:8085/api/v1
echo   - Swagger UI: http://localhost:8085/api/v1/swagger-ui.html
echo.
echo  Keep the opened command prompt windows running while using the portal.
echo =========================================================================
pause
