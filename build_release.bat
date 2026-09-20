@echo off
echo ========================================================
echo Building Ejari Cash Release (Optimized for Size)
echo ========================================================
echo.

echo Cleaning project...
call flutter clean

echo Getting dependencies...
call flutter pub get

echo.
echo Building Android App Bundle (AAB)...
echo Using --obfuscate and --split-debug-info to reduce size and improve security.
call flutter build appbundle --release --obfuscate --split-debug-info=./build/app/outputs/symbols

echo.
echo Build process complete!
echo The App Bundle can be found at: build\app\outputs\bundle\release\app-release.aab
pause
