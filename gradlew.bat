@rem Gradle startup script for Windows
@echo off
where gradle >nul 2>nul
if %ERRORLEVEL% equ 0 (
    gradle %*
) else (
    echo Gradle CLI not found on PATH.
    exit /b 1
)
