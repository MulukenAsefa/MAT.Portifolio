@echo off
color 0A
echo.
echo ========================================
echo   CYBER MAN - Phone Connection Check
echo ========================================
echo.
echo Checking for connected devices...
echo.
flutter devices
echo.
echo ========================================
echo.
echo If you see "Device RZ8T90T4DMV is not authorized":
echo.
echo 1. CHECK YOUR PHONE SCREEN for authorization popup
echo 2. TAP "OK" or "ALLOW"
echo 3. CHECK "Always allow from this computer"
echo.
echo If no popup appears:
echo - Tap USB notification on phone
echo - Select "File Transfer" mode
echo - Or check USB_DEBUG_GUIDE.md for more help
echo.
echo ========================================
echo.
pause
