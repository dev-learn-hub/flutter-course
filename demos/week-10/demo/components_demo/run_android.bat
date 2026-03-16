@echo off
chcp 65001 >nul
setlocal enabledelayedexpansion

rem 在 Android 设备/模拟器上运行应用，等待启动后截屏；若无设备则先启动模拟器。
set "ROOT=%~dp0"
set "ROOT=%ROOT:~0,-1%"
cd /d "%ROOT%"

set "ADB=%LOCALAPPDATA%\Android\Sdk\platform-tools\adb.exe"
if not exist "%ADB%" set "ADB=adb"

flutter devices 2>nul | findstr /i "emulator android" >nul
if not errorlevel 1 goto :run_app

echo.
echo [No Android device] Trying to start an emulator...
echo.
set "EMU_ID="
for /f "skip=4 tokens=1 delims= " %%a in ('flutter emulators 2^>nul') do (
    if not "%%a"=="" (set "EMU_ID=%%a" & goto :do_launch)
)
echo No Android emulator found. Create one in Android Studio Device Manager.
exit /b 1

:do_launch
echo Starting emulator: !EMU_ID!
start "Android Emulator" cmd /c "flutter emulators --launch !EMU_ID!"
echo Waiting for emulator in adb...
set /a count=0
:wait_adb
ping -n 4 127.0.0.1 >nul
set /a count+=1
"%ADB%" devices 2>nul | findstr /r "emulator.*device" >nul
if not errorlevel 1 goto :wait_boot
if !count! geq 30 (echo Timeout: emulator did not appear. & exit /b 1)
goto :wait_adb

:wait_boot
echo Waiting for Android to fully boot...
set /a count=0
:boot_loop
ping -n 4 127.0.0.1 >nul
set "BOOT="
for /f "delims=" %%i in ('"%ADB%" shell getprop sys.boot_completed 2^>nul') do set "BOOT=%%i"
echo !BOOT! | findstr /x "1" >nul
if not errorlevel 1 goto :run_app
set /a count+=1
if !count! geq 40 (echo Timeout: emulator did not finish booting. & exit /b 1)
goto :boot_loop

:run_app
echo Emulator ready. Waiting 5s...
ping -n 6 127.0.0.1 >nul

set "PKG=com.example.components_demo"
echo Starting app in new window...
start "Flutter" cmd /k "cd /d ""%ROOT%"" && flutter run -d android"

echo Waiting for package %PKG% to be installed...
set /a count=0
:wait_install
ping -n 6 127.0.0.1 >nul
"%ADB%" shell pm list packages 2>nul | findstr /i "%PKG%" >nul
if not errorlevel 1 goto :do_am_start
set /a count+=1
if !count! geq 24 (echo WARN: Package not seen after 2 min, trying am start anyway... & goto :do_am_start)
goto :wait_install

:do_am_start
echo Bringing app to foreground...
"%ADB%" shell am start -n %PKG%/.MainActivity -a android.intent.action.MAIN -c android.intent.category.LAUNCHER 2>nul
echo Waiting 6s for UI to render...
ping -n 7 127.0.0.1 >nul

set "SCREEN_PNG=%ROOT%\flutter_emulator_screenshot.png"
echo Taking screenshot...
"%ADB%" shell screencap -p /sdcard/flutter_demo_screen.png 2>nul
if errorlevel 1 (echo Screenshot failed. Check adb and device. & goto :end)
"%ADB%" pull /sdcard/flutter_demo_screen.png "%SCREEN_PNG%" 2>nul
"%ADB%" shell rm /sdcard/flutter_demo_screen.png 2>nul
if not exist "%SCREEN_PNG%" (echo Screenshot pull failed. & exit /b 1)
echo Screenshot saved: flutter_emulator_screenshot.png

python "%ROOT%\verify_screenshot.py" "%SCREEN_PNG%"
if errorlevel 1 (echo Screenshot verification failed. Fix app or wait time and retry. & exit /b 1)
echo Screenshot verification passed.
echo Screenshot file: %SCREEN_PNG%
taskkill /IM "Microsoft.Photos.exe" /F 2>nul
taskkill /IM "Photos.exe" /F 2>nul
echo App is running in the "Flutter" window. Close that window to stop.

:end
echo Batch finished. App runs in "Flutter" window; close it to stop.
exit /b 0
