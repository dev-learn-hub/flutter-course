#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
校验 Android 截屏是否有效：非黑屏、非空白，说明应用已正确显示。
用于 run_android.bat 在截屏后自动校验；校验失败则 exit 1，便于修改代码直到正确。
"""
import sys
import os

def main():
    if len(sys.argv) < 2:
        print("Usage: verify_screenshot.py <path_to_screenshot.png>", file=sys.stderr)
        return 1
    path = sys.argv[1]
    if not os.path.isfile(path):
        print("File not found:", path, file=sys.stderr)
        return 1
    try:
        from PIL import Image
    except ImportError:
        # 无 PIL：只做存在性与大小检查
        size = os.path.getsize(path)
        if size < 1000:
            print("Screenshot too small (likely invalid):", size, "bytes", file=sys.stderr)
            return 1
        print("OK (no PIL, size check only):", size, "bytes")
        return 0
    try:
        img = Image.open(path)
        img = img.convert("L")  # 灰度
        w, h = img.size
        if w < 10 or h < 10:
            print("Screenshot too small:", w, "x", h, file=sys.stderr)
            return 1
        try:
            pixels = list(img.get_flattened_data())
        except AttributeError:
            pixels = list(img.getdata())
        mean = sum(pixels) / len(pixels)
        variance = sum((x - mean) ** 2 for x in pixels) / len(pixels)
        # 黑屏或几乎全黑：均值很低
        if mean < 15:
            print("Screenshot too dark (likely black screen), mean=", mean, file=sys.stderr)
            return 1
        # 完全均匀（白屏或单色）可认为无效
        if variance < 50:
            print("Screenshot too uniform (likely blank), variance=", variance, file=sys.stderr)
            return 1
        print("OK: mean={:.1f} variance={:.1f}".format(mean, variance))
        return 0
    except Exception as e:
        print("Verify failed:", e, file=sys.stderr)
        return 1

if __name__ == "__main__":
    sys.exit(main())
