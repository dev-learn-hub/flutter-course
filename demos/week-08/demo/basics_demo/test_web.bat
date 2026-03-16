@echo off
rem Web 端自动化测试：启动服务、打开浏览器、校验页面、关闭浏览器、停止服务（无人工干预）
chcp 65001 >nul
cd /d "%~dp0"
powershell -ExecutionPolicy Bypass -File "%~dp0test_web.ps1"
exit /b %errorlevel%
