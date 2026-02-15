@echo off
color 0A
echo.
echo ========================================
echo   CYBER MAN - Run on Phone
echo ========================================
echo.
echo Step 1: Checking connected devices...
echo.
flutter devices
echo.
echo ========================================
echo.
echo If your phone is listed above (without "not authorized"):
echo Press any key to start the app on your phone...
echo.
echo If "not authorized" appears:
echo 1. Check your phone screen for popup
echo 2. Tap "OK" and check "Always allow"
echo 3. Run this script again
echo.
pause
echo.
echo ========================================
echo   Starting app on your phone...
echo ========================================
echo.
echo This will:
echo - Build the app for Android
echo - Install it on your phone
echo - Launch automatically
echo - Enable hot reload (press 'r' for updates)
echo.
echo Please wait...
echo.
flutter run
