@echo off
echo Cleaning up Node.js files...

REM Stop any running Node.js processes
taskkill /f /im node.exe 2>nul

REM Remove Node.js files
if exist "node_modules" (
    echo Removing node_modules...
    rmdir /s /q node_modules 2>nul
)

if exist "docuhub.db" (
    echo Removing SQLite database...
    del /f docuhub.db 2>nul
)

if exist "uploads" (
    echo Removing uploads directory...
    rmdir /s /q uploads 2>nul
)

if exist "public" (
    echo Removing public directory (Node.js version)...
    rmdir /s /q public 2>nul
)

echo Cleanup completed!
pause 