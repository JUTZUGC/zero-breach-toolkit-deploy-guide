#!/usr/bin/env bash
set -euo pipefail
# Zero Breach Toolkit 一键安装脚本（第三方指南）——按官方文档封装
# 官方文档：https://github.com/interplains/Zero-Breach-Toolkit/blob/main/README.md
# 更新日期：2026-10-28
# 类型：script
cd "$(dirname "${BASH_SOURCE[0]}")"

command -v git >/dev/null 2>&1 || { echo "需要先安装 Git"; exit 1; }
command -v python3 >/dev/null 2>&1 || command -v python >/dev/null 2>&1 || { echo "需要先安装 Python 3"; exit 1; }

mkdir -p .download
cd .download

curl -fL -O https://github.com/interplains/Zero-Breach-Toolkit/releases/download/v0.1.7/zero-breach-toolkit.py
curl -fL -O https://github.com/interplains/Zero-Breach-Toolkit/releases/download/v0.1.7/SHA256SUMS.txt
expected=$(grep ' zero-breach-toolkit.py$' SHA256SUMS.txt | awk '{print $1}') ; if command -v sha256sum >/dev/null 2>&1; then echo "$expected  zero-breach-toolkit.py" | sha256sum -c - ; else echo "$expected  zero-breach-toolkit.py" | shasum -a 256 -c - ; fi
PY=$(command -v python3 || command -v python) ; "$PY" zero-breach-toolkit.py

echo ""

echo "安装完成：运行 python zero-breach-toolkit.py 打开菜单，先更新指标列表，再选择要检查的设备类型"
echo "若结果异常或需要改配置，请参考官方文档：https://github.com/interplains/Zero-Breach-Toolkit/blob/main/README.md"
