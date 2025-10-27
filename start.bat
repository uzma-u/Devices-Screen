@echo off
echo Starting Smart Devices App...
echo.

echo Installing backend dependencies...
call npm install
echo.

echo Seeding database...
node seed.js
echo.

echo Starting backend server...
start cmd /k "npm run dev"

echo Installing frontend dependencies...
cd frontend
call npm install
echo.

echo Starting frontend server...
start cmd /k "npm start"
cd ..

echo.
echo Both servers are starting...
echo Backend: http://localhost:5000
echo Frontend: http://localhost:3000
echo.
pause


