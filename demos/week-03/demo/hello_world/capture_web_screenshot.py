#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Web 端截图并校验：用 Selenium 驱动 Edge/Chrome 打开指定 URL，截屏保存，并做简单有效性校验（非空白/非全黑）。
供 test_web.ps1 调用；校验失败则 exit 1。
依赖：pip install selenium（Selenium 4 会自动管理驱动；本机需已安装 Edge 或 Chrome）
"""
import sys
import os

def verify_image(path):
    """与 verify_screenshot.py 相同的校验逻辑：非黑屏、非空白。"""
    if not os.path.isfile(path):
        return False, "file not found"
    try:
        from PIL import Image
    except ImportError:
        size = os.path.getsize(path)
        if size < 1000:
            return False, "size too small: %d" % size
        return True, "ok (no PIL, size=%d)" % size
    try:
        img = Image.open(path).convert("L")
        w, h = img.size
        if w < 10 or h < 10:
            return False, "image too small %dx%d" % (w, h)
        try:
            pixels = list(img.get_flattened_data())
        except AttributeError:
            pixels = list(img.getdata())
        mean = sum(pixels) / len(pixels)
        variance = sum((x - mean) ** 2 for x in pixels) / len(pixels)
        if mean < 15:
            return False, "too dark (black?) mean=%.1f" % mean
        if variance < 50:
            return False, "too uniform (blank?) variance=%.1f" % variance
        return True, "mean=%.1f variance=%.1f" % (mean, variance)
    except Exception as e:
        return False, str(e)

def main():
    if len(sys.argv) < 3:
        print("Usage: capture_web_screenshot.py <url> <output.png>", file=sys.stderr)
        return 1
    url = sys.argv[1]
    out_path = os.path.abspath(sys.argv[2])

    try:
        from selenium import webdriver
    except ImportError:
        print("Selenium not installed. Run: pip install selenium", file=sys.stderr)
        return 1

    # 优先 Edge，失败则尝试 Chrome（Selenium 4 自动管理驱动）
    opts_edge = None
    opts_chrome = None
    try:
        from selenium.webdriver.edge.options import Options as EdgeOptions
        opts_edge = EdgeOptions()
        opts_edge.add_argument("--headless")
        opts_edge.add_argument("--disable-gpu")
        opts_edge.add_argument("--no-sandbox")
        opts_edge.add_argument("--window-size=1280,720")
    except Exception:
        pass
    try:
        from selenium.webdriver.chrome.options import Options as ChromeOptions
        opts_chrome = ChromeOptions()
        opts_chrome.add_argument("--headless=new")
        opts_chrome.add_argument("--disable-gpu")
        opts_chrome.add_argument("--no-sandbox")
        opts_chrome.add_argument("--window-size=1280,720")
        opts_chrome.add_argument("--disable-dev-shm-usage")
        opts_chrome.add_argument("--force-color-profile=srgb")
    except Exception:
        pass

    driver = None
    try:
        if opts_edge is not None:
            try:
                driver = webdriver.Edge(options=opts_edge)
            except Exception:
                driver = None
        if driver is None and opts_chrome is not None:
            try:
                driver = webdriver.Chrome(options=opts_chrome)
            except Exception:
                pass
        if driver is None:
            raise RuntimeError("Neither Edge nor Chrome WebDriver available. Install Edge or Chrome and ensure Selenium can find the driver.")
        driver.set_page_load_timeout(15)
        driver.get(url)
        # Flutter Web 需等待渲染（canvas 或 body 稳定）
        import time
        time.sleep(4)
        try:
            driver.execute_script("return document.readyState") == "complete"
        except Exception:
            pass
        time.sleep(1)
        driver.save_screenshot(out_path)
    except Exception as e:
        print("Selenium/Edge failed:", e, file=sys.stderr)
        return 1
    finally:
        if driver:
            try:
                driver.quit()
            except Exception:
                pass

    if not os.path.isfile(out_path):
        print("Screenshot not saved:", out_path, file=sys.stderr)
        return 1

    ok, msg = verify_image(out_path)
    if not ok:
        print("Screenshot verify failed:", msg, file=sys.stderr)
        return 1
    print("OK: saved", out_path, msg)
    return 0

if __name__ == "__main__":
    sys.exit(main())
