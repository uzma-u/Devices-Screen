@echo off
echo ==========================================
echo Renaming frontend to "device frontend"
echo ==========================================
echo.
echo Please make sure to stop the frontend server first (Ctrl+C)
echo.
pause

echo Stopping any running processes...
taskkill /F /IM node.exe 2>nul

echo.
echo Renaming folder...
Move-Item -Path "frontend" -Destination "device frontend"

if (Test-Path "device frontend") {
    echo.
    echo SUCCESS! Folder renamed to "device frontend"
    echo.
    echo You can now start the server with:
    echo   cd "device frontend"
    echo   npm start
} else {
    echo.
    echo ERROR: Could not rename folder
}

echo.
pause

