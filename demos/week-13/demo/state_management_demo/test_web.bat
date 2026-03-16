@echo off
rem Web 端自动化测试：启动服务、HTTP 校验、浏览器截图校验、停止服务（无人工干预）
chcp 65001 >nul
cd /d "%~dp0"
powershell -ExecutionPolicy Bypass -File "%~dp0test_web.ps1"
exit /b %errorlevel%
