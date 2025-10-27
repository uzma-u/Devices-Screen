@echo off
echo ========================================
echo Fixing Mobile Access Configuration
echo ========================================
echo.

cd frontend

echo Creating .env file...
echo HOST=0.0.0.0 > .env
echo DANGEROUSLY_DISABLE_HOST_CHECK=true >> .env

echo.
echo Configuration fixed!
echo.
echo Now run:
echo   cd backend
echo   npm run dev
echo.
echo Then in another terminal:
echo   cd frontend
echo   npm start
echo.
echo The app will be accessible at: http://YOUR-IP:3000
echo.
pause

