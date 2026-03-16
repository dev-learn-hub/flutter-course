#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Flutter Web 本地预览脚本

用法（在项目根目录，即与 pubspec.yaml 同级）：
  python serve_web.py

会依次：
  1. 执行 flutter build web 生成 build/web
  2. 用 Python 在 build/web 目录启动 HTTP 服务（默认 8080 端口）
  3. 在默认浏览器中打开 http://localhost:8080
"""

import argparse
import os
import subprocess
import sys
import webbrowser
from http.server import HTTPServer, SimpleHTTPRequestHandler


def main():
    parser = argparse.ArgumentParser(description="构建 Flutter Web 并用本地服务器 + 浏览器预览")
    parser.add_argument(
        "--port", "-p",
        type=int,
        default=8080,
        help="本地 HTTP 端口（默认 8080）",
    )
    parser.add_argument(
        "--no-build",
        action="store_true",
        help="跳过 flutter build web，直接启动服务器（需已构建过）",
    )
    args = parser.parse_args()

    script_dir = os.path.dirname(os.path.abspath(__file__))
    project_root = script_dir
    build_web = os.path.join(project_root, "build", "web")

    if not args.no_build:
        print("正在执行: flutter build web ...")
        ret = subprocess.call(
            ["flutter", "build", "web"],
            cwd=project_root,
            shell=(sys.platform == "win32"),
        )
        if ret != 0:
            print("flutter build web 失败，退出码:", ret, file=sys.stderr)
            sys.exit(ret)
        print("flutter build web 完成。")
    else:
        if not os.path.isdir(build_web):
            print("错误: 未找到 build/web，请先执行 flutter build web 或去掉 --no-build。", file=sys.stderr)
            sys.exit(1)

    os.chdir(build_web)
    host = "127.0.0.1"
    url = f"http://{host}:{args.port}"

    print(f"在 {build_web} 启动 HTTP 服务: {url}")
    print("按 Ctrl+C 停止服务。")
    webbrowser.open(url)

    server = HTTPServer((host, args.port), SimpleHTTPRequestHandler)
    try:
        server.serve_forever()
    except KeyboardInterrupt:
        print("\n已停止服务。")
        server.shutdown()


if __name__ == "__main__":
    main()
