@echo off
echo ========================================
echo Smart Devices App - Android Setup
echo ========================================
echo.

echo [1/3] Checking IP Address...
ipconfig | findstr /i "IPv4"
echo.
echo Write down your IPv4 Address (e.g., 192.168.1.100)
echo.
pause

echo [2/3] Seeding database...
call node seed.js
echo.

echo [3/3] Starting servers...
echo.
echo Backend will run on port 5000
echo Frontend will run on port 3000
echo.
echo On your Android device:
echo 1. Connect to same WiFi network
echo 2. Open Chrome browser
echo 3. Go to: http://YOUR-IP-ADDRESS:3000
echo.
echo Press any key to start...
pause

start "Backend Server" cmd /k "npm run dev"

cd frontend
start "Frontend Server" cmd /k "npm run start-mobile"

echo.
echo Servers are starting!
echo Check the new windows for server status
echo.
pause

