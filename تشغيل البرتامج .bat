@echo off
title Laravel Server Launcher
color 0A

echo.
echo  ==========================================
echo       Laravel Development Server
echo  ==========================================
echo.

:: Run php artisan serve in background and capture output
echo  [1/1] Starting Laravel development server...
start "" cmd /k "php artisan serve"

echo.
echo  ==========================================
echo   Server starting on http://127.0.0.1:8000
echo   Opening browser in 3 seconds...
echo  ==========================================
echo.

:: Wait for server to boot up
timeout /t 3 /nobreak >nul

:: Open browser
start http://127.0.0.1:8000

echo.
echo   Browser opened! Happy coding!
echo.
pause
