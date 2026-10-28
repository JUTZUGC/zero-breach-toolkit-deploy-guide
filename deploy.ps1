# Zero Breach Toolkit 一键安装脚本（第三方指南）——按官方文档封装
# 官方文档：https://github.com/interplains/Zero-Breach-Toolkit/blob/main/README.md
# 更新日期：2026-10-28
# 类型：script
$ErrorActionPreference = 'Stop'
Set-Location -Path $PSScriptRoot

if (-not (Get-Command git -ErrorAction SilentlyContinue)) { throw '需要先安装 Git' }
if (-not (Get-Command python -ErrorAction SilentlyContinue)) { throw '需要先安装 Python 3' }

New-Item -ItemType Directory -Force -Path .download | Out-Null
Set-Location -Path .download

curl.exe -L --fail -O https://github.com/interplains/Zero-Breach-Toolkit/releases/download/v0.1.7/zero-breach-toolkit.py
curl.exe -L --fail -O https://github.com/interplains/Zero-Breach-Toolkit/releases/download/v0.1.7/SHA256SUMS.txt
$expected = ((Select-String -Path SHA256SUMS.txt -Pattern 'zero-breach-toolkit.py').Line -split '\s+')[0].ToLower() ; $actual = (Get-FileHash zero-breach-toolkit.py -Algorithm SHA256).Hash.ToLower() ; if ($actual -ne $expected) { throw 'SHA256 校验失败，请重新下载' }
python zero-breach-toolkit.py

Write-Host ''

Write-Host '安装完成：运行 python zero-breach-toolkit.py 打开菜单，先更新指标列表，再选择要检查的设备类型'
Write-Host '若结果异常或需要改配置，请参考官方文档：https://github.com/interplains/Zero-Breach-Toolkit/blob/main/README.md'
