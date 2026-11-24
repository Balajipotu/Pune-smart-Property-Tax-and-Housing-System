@echo off
title Stop PMC Portal Servers
echo ========================================================
echo   Stopping PMC Portal Processes (Ports 8085 and 5173)
echo ========================================================

echo Stopping process on port 8085 (Backend)...
for /f "tokens=5" %%a in ('netstat -aon ^| findstr :8085 ^| findstr LISTENING') do (
    taskkill /F /PID %%a >nul 2>&1
)

echo Stopping process on port 5173 (Frontend)...
for /f "tokens=5" %%a in ('netstat -aon ^| findstr :5173 ^| findstr LISTENING') do (
    taskkill /F /PID %%a >nul 2>&1
)

echo.
echo Stopped all running portal servers.
pause
