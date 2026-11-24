@echo off
title PMC Property Tax - Backend (Port 8085)
cd /d "%~dp0backend"

echo ========================================================
echo   PMC Smart Property Tax Portal - Spring Boot Backend
echo ========================================================
echo.

:: Detect or set JAVA_HOME if not already in environment
if not defined JAVA_HOME (
    if exist "C:\Program Files\Microsoft\jdk-21.0.12.101-hotspot" (
        set "JAVA_HOME=C:\Program Files\Microsoft\jdk-21.0.12.101-hotspot"
        set "PATH=%JAVA_HOME%\bin;%PATH%"
    )
)

echo Using JAVA_HOME: %JAVA_HOME%
java -version
if %ERRORLEVEL% NEQ 0 (
    echo [ERROR] Java 21 was not found. Please install Java 21 LTS or set JAVA_HOME.
    pause
    exit /b 1
)

echo.
echo Starting Spring Boot Backend on http://localhost:8085 ...
echo Swagger UI: http://localhost:8085/api/v1/swagger-ui.html
echo Actuator Health: http://localhost:8085/api/v1/actuator/health
echo.

call mvnw.cmd spring-boot:run
pause
