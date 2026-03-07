@echo off
title Laravel Server Launcher
color 0A

echo.
echo  ==========================================
echo       Laravel Development Server
echo  ==========================================
echo.

:: Start PHP-CGI
echo  [1/2] Starting PHP-CGI on port 9000...
start "" php-cgi -b 127.0.0.1:9000
echo        Done!

:: Start Nginx
echo  [2/2] Starting Nginx...
cd C:\nginx
start "" nginx
echo        Done!

echo.
echo  ==========================================
echo   Servers started successfully!
echo   Opening http://localhost in 10 seconds...
echo  ==========================================
echo.

:: Countdown Timer
for /L %%i in (10,-1,1) do (
    echo   Opening browser in %%i seconds...
    timeout /t 1 /nobreak >nul
)

:: Open browser
start http://localhost

echo.
echo   Browser opened! Happy coding!
echo.
pause
