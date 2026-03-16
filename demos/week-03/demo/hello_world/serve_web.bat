@echo off
rem Flutter Web 本地预览：先 build web，再用 Python 起 HTTP 服务并打开浏览器。
rem 用法: serve_web.bat [--no-build] [--no-browser] [--port 端口]
chcp 65001 >nul
setlocal

set "ROOT=%~dp0"
set "ROOT=%ROOT:~0,-1%"
set "BUILD_WEB=%ROOT%\build\web"
set "PORT=8080"
set "NO_BROWSER=0"

if "%1"=="--no-build" set "SKIP_BUILD=1" & goto :check_args
if "%1"=="-n" set "SKIP_BUILD=1" & goto :check_args
if "%1"=="--no-browser" set "NO_BROWSER=1" & goto :check_args
if "%1"=="-b" set "NO_BROWSER=1" & goto :check_args
if "%1"=="--port" set "PORT=%2" & goto :build
if "%1"=="-p" set "PORT=%2" & goto :build
goto :build

:check_args
if "%2"=="--no-browser" set "NO_BROWSER=1"
if "%2"=="-b" set "NO_BROWSER=1"
if "%2"=="--no-build" set "SKIP_BUILD=1"
if "%2"=="-n" set "SKIP_BUILD=1"
if "%2"=="--port" set "PORT=%3"
if "%2"=="-p" set "PORT=%3"
if defined SKIP_BUILD goto :serve
goto :build

:build

echo 正在执行: flutter build web ...
cd /d "%ROOT%"
call flutter build web
if errorlevel 1 (
    echo flutter build web 失败。
    exit /b 1
)
echo flutter build web 完成。

:serve
if not exist "%BUILD_WEB%" (
    echo 错误: 未找到 build\web，请先执行 flutter build web。
    exit /b 1
)

echo 在 build\web 启动 HTTP 服务: http://127.0.0.1:%PORT%
echo 按 Ctrl+C 停止服务。
if "%NO_BROWSER%"=="0" start "" "http://127.0.0.1:%PORT%"

cd /d "%BUILD_WEB%"
python -m http.server %PORT%
exit /b 0
