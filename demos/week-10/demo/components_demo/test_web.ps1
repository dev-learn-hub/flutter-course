# Web 端测试：启动服务、HTTP 校验、浏览器截图校验、停止服务（无人工干预）
# 用法: powershell -ExecutionPolicy Bypass -File test_web.ps1
# 依赖: Python + pip install selenium（用于 capture_web_screenshot.py 无头浏览器截图）

$ErrorActionPreference = "Stop"
$Root = $PSScriptRoot
$Port = 8080
$Url = "http://127.0.0.1:$Port"
$WebScreenshot = Join-Path $Root "web_screenshot.png"

# 1) 启动 HTTP 服务（新窗口，不打开浏览器）
$serverJob = Start-Process -FilePath "cmd.exe" -ArgumentList "/c", "cd /d `"$Root`" && serve_web.bat --no-build --no-browser" -PassThru -WindowStyle Hidden
Start-Sleep -Seconds 5

try {
    # 2) HTTP 校验
    $r = Invoke-WebRequest -Uri $Url -UseBasicParsing -TimeoutSec 10
    if ($r.StatusCode -ne 200) { throw "HTTP $($r.StatusCode)" }
    if ($r.Content.Length -lt 100) { throw "Content too short" }
    Write-Host "OK: HTTP 200, content length $($r.Content.Length)"

    # 3) 浏览器截图并校验（Selenium 无头 Edge/Chrome）
    $captureScript = Join-Path $Root "capture_web_screenshot.py"
    if (-not (Test-Path $captureScript)) { throw "capture_web_screenshot.py not found" }
    $proc = Start-Process -FilePath "python" -ArgumentList "`"$captureScript`"", "`"$Url`"", "`"$WebScreenshot`"" -Wait -PassThru -NoNewWindow
    if ($proc.ExitCode -ne 0) { throw "Web screenshot capture/verify failed (exit $($proc.ExitCode))" }
    Write-Host "Web screenshot saved and verified: $WebScreenshot"
} finally {
    # 4) 停止服务
    if ($serverJob -and !$serverJob.HasExited) {
        $serverJob | Stop-Process -Force -ErrorAction SilentlyContinue
        Write-Host "Server stopped."
    }
    Get-Process -Name python -ErrorAction SilentlyContinue | Where-Object { $_.Path -notlike "*flutter*" } | Stop-Process -Force -ErrorAction SilentlyContinue
}

Write-Host "Web test finished."
