@echo off
color 0A
echo.
echo ========================================
echo   CYBER MAN - Install APK on Phone
echo ========================================
echo.
echo APK Location:
echo build\app\outputs\flutter-apk\app-release.apk
echo.
echo ========================================
echo   OPTION 1: Install via USB (Automatic)
echo ========================================
echo.
echo Checking if phone is connected...
echo.

cd build\app\outputs\flutter-apk

if exist app-release.apk (
    echo ✓ APK found!
    echo.
    echo Installing on your phone...
    echo.
    flutter install
    echo.
    if %ERRORLEVEL% EQU 0 (
        echo ========================================
        echo   ✓ SUCCESS! App installed on phone!
        echo ========================================
        echo.
        echo Open the app on your phone to see:
        echo - Modern cybersecurity portfolio
        echo - Data Analytics ^& SQL skills
        echo - 6 interactive sections
        echo - Animated effects
        echo.
    ) else (
        echo ========================================
        echo   ⚠ Automatic install failed
        echo ========================================
        echo.
        echo OPTION 2: Manual Installation
        echo.
        echo 1. Copy this file to your phone:
        echo    app-release.apk
        echo.
        echo 2. Open it on your phone
        echo 3. Tap "Install"
        echo 4. Enable "Unknown Sources" if asked
        echo.
        echo The APK is in this folder:
        start .
    )
) else (
    echo ✗ APK not found!
    echo.
    echo Building APK now...
    cd ..\..\..\..
    flutter build apk --release
)

echo.
echo ========================================
pause
