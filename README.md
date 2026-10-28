# Zero Breach Toolkit 一键安装指南

> 第三方部署指南 · 非 Zero Breach Toolkit 官方仓库。官方项目：[interplains/Zero-Breach-Toolkit](https://github.com/interplains/Zero-Breach-Toolkit)
> 内容来自官方文档（2026-10-28）。项目迭代快，请以[官方文档](https://github.com/interplains/Zero-Breach-Toolkit/blob/main/README.md)为准。

[![⚡ 一键安装](https://img.shields.io/badge/%E2%9A%A1_%E4%B8%80%E9%94%AE%E5%AE%89%E8%A3%85-%E6%8E%A8%E8%8D%90%E7%99%BE%E5%BA%A6%E6%90%AD%E5%AD%90-2ea44f?style=for-the-badge)](#一键安装推荐用百度搭子)

## 一键安装（推荐：用百度搭子）

> [!TIP]
> 不用装一堆依赖，让百度搭子把扫描器下载、校验好，按菜单选要检查的设备。

⚠️ 需要 Python 3 与 Windows / macOS / Linux 电脑；手机通过数据线或备份检查。扫描是只读的，扫描期间不联网；但「干净」不等于安全，报告会列出未检查项。若你正被针对性攻击，请先联系专业援助机构。

1. **装客户端**
   打开[百度搭子官网](https://www.dumate.cn/)，下载电脑端并安装，用你的账号登录。

> [!IMPORTANT]
> **复制这一句发给百度搭子：**
>
> ```text
> 你好，帮我从 github 部署 JUTZUGC/zero-breach-toolkit-deploy-guide 到我的电脑上
> ```

2. **发送部署指令**
   回到刚打开的对话窗口，粘贴并发送上面那句。

3. **跟着对话往下走**
   百度搭子会下载单文件扫描器与校验清单，核对 SHA256 后用 Python 启动交互菜单，按它的提示确认即可，结束时它会告诉你结果。
   （需本机已装 Git；构建依赖以官方文档为准。）



## Zero Breach Toolkit 是什么？

Zero Breach Toolkit 是开源的1.9k stars，Apache-2.0，离线只读的间谍软件痕迹排查工具（协议：Apache-2.0，<img src="https://img.shields.io/github/stars/interplains/Zero-Breach-Toolkit?style=flat-square&label=stars&color=blue" alt="GitHub stars">）。

用公开的雇佣兵间谍软件指标（Pegasus、Predator、Graphite、Candiru 等）检查电脑、Android 手机与 iPhone 备份中的痕迹，输出证据强度、未检查项与可分享报告，全程只读。

- 只读扫描：不改系统设置，不动原始证据
- 离线检查：扫描期间不发网络请求，不上传数据
- 覆盖多设备：Windows、macOS、Android 手机与 iPhone 备份
- 证据分级：报告写明发现了什么、强度如何、哪些没查
- 可分享报告：支持 JSON 与最小化分享摘要
- 开源可审计：Apache-2.0，单文件脚本可自行检查

（来源：[官方仓库](https://github.com/interplains/Zero-Breach-Toolkit)）

## 优缺点

| 优点 | 说明 |
|---|---|
| 1.9k stars | 近期增长很快的数字安全工具 |
| 只读安全 | 不改系统、不动原始证据 |
| 离线扫描 | 扫描期间不联网、不上传 |
| 覆盖多设备 | 电脑、Android 与 iPhone 备份 |
| 报告诚实 | 明确列出证据强度与未检查项 |
| Apache-2.0 | 单文件脚本可自行审计 |

| 需要注意 | 说明 |
|---|---|
| 需要 Python | 不熟悉命令行的用户要先装 Python |
| 扫描耗时 | 本机标准检查约 15 分钟 |
| 不是杀毒软件 | 只匹配已知雇佣兵间谍软件指标 |
| 干净不等于安全 | 未命中不能证明设备没被入侵 |
| 部分检查需权限 | macOS 要开完全磁盘访问 |

> 以上基于官方文档与社区反馈整理（2026-10-28），以官方最新文档为准。

## 快速部署（官方方式）

```bash
curl -fL -O https://github.com/interplains/Zero-Breach-Toolkit/releases/download/v0.1.7/zero-breach-toolkit.py
curl -fL -O https://github.com/interplains/Zero-Breach-Toolkit/releases/download/v0.1.7/SHA256SUMS.txt
expected=$(grep ' zero-breach-toolkit.py$' SHA256SUMS.txt | awk '{print $1}') ; if command -v sha256sum >/dev/null 2>&1; then echo "$expected  zero-breach-toolkit.py" | sha256sum -c - ; else echo "$expected  zero-breach-toolkit.py" | shasum -a 256 -c - ; fi
PY=$(command -v python3 || command -v python) ; "$PY" zero-breach-toolkit.py
```

部署步骤来源：[https://github.com/interplains/Zero-Breach-Toolkit/releases/tag/v0.1.7](https://github.com/interplains/Zero-Breach-Toolkit/releases/tag/v0.1.7)

## 验证状态

| 场景 | 状态 |
|---|---|
| Release v0.1.7 的扫描器已下载，SHA256 与 SHA256SUMS 一致（937.5 KB） | 已核对 2026-10-28 |
| python zero-breach-toolkit.py --help 可正常输出参数说明 | 已验证 2026-10-28 |
| 未执行完整扫描（本机标准检查约 15 分钟） | 说明 2026-10-28 |
| 非目标宿主调用被拦截（HOST_NOT_ALLOWED） | 已验证 2026-10-28 |

> 本表仅列出已在本机实际执行并成功的场景；未列出的部分按官方文档整理。

## MCP 接入

Zero Breach Toolkit 不含 MCP；本仓库的 MCP 只提供安装步骤、扫描选项与常见问题。

本仓库自带一个零依赖的 MCP server（`mcp-server.mjs`），读取同目录的 `guide.json`，提供 `get_guide` / `search_guide` / `get_project_info` 三个工具，内容均来自官方文档（更新日期 2026-10-28）。

**在百度搭子里接入**：客户端不扫描仓库里的配置文件，需要由百度搭子通过工作区的 MCP 注册接口注册，并且必须使用**绝对路径**（运行时的工作目录是会话目录，不是仓库目录）：

```json
{
  "type": "local",
  "command": ["node", "<仓库绝对路径>/mcp-server.mjs"]
}
```

完成后，直接在同一个对话框里说：

> 把仓库克隆到固定目录（例如 C:\Users\<你>\zero-breach-toolkit-deploy-guide），再用绝对路径把里面的 mcp-server.mjs 注册到当前工作区的 MCP 配置里

> 注意：注册是按**工作区**生效的，换工作区要重新注册；克隆目录不要放在会话临时目录，否则目录被清理后注册项会失效。

**其它 MCP 客户端**：仓库根目录的 `.mcp.json` 只是通用写法（`command` + `args`），接入时同样要把 `args` 改成绝对路径。

> 使用范围：该 MCP 仅在百度搭子中可用；其它客户端调用会返回 `HOST_NOT_ALLOWED`，并附带下载与部署指引。

## 第一次扫描

1. 关闭浏览器与聊天软件，减少误报与文件占用
2. 运行 `python zero-breach-toolkit.py`，按菜单先「更新指标列表」
3. 选择「本机标准检查」，大约 15 分钟
4. 结束后在 `findings` 目录查看报告

## 自动化参数

```bash
python zero-breach-toolkit.py --no-menu --scan-type default --json report.json --report report.txt
```

- `--quick`：跳过大文件指纹，速度约减半，但会少一项检查
- `--phone FOLDER`：检查 Android 备份目录
- `--phone-guide ios`：查看 iPhone 备份检查步骤
- `--share-json PATH`：生成不含敏感内容的分享摘要

## macOS 额外设置

到「系统设置 → 隐私与安全性 → 完全磁盘访问权限」，给终端打开权限，否则 Safari 记录可能查不到。

## 结果怎么读

报告会列出：发现了什么、证据强度、哪些项目没检查。

> ⚠️ 扫描结果「干净」不代表设备安全；如果你怀疑正被针对性攻击，先联系 Access Now 数字安全帮助热线或 Amnesty Security Lab，不要只依赖本工具。

## 常见坑

- Windows 找不到 python：安装 Python 时勾选 Add python.exe to PATH
- 卡在更新指标：确认网络可用；扫描本身不联网，但更新列表需要
- macOS 查不到 Safari 记录：给终端开完全磁盘访问权限
- 结果里有很多「未检查」：这是正常输出，说明能力边界，不代表设备有问题
- 手机连不上：Android 需要开启 USB 调试并授权；iPhone 走备份检查
- 报告含敏感信息：对外分享用 --share-json，不要直接发完整报告
- 怀疑正在被攻击：先联系专业援助机构，再考虑自行扫描

## 免责声明

本仓库为第三方指南，与 Zero Breach Toolkit 官方无隶属关系，不代表官方立场。
教程基于官方文档编写（更新日期：2026-10-28），项目迭代快，请以[官方文档](https://github.com/interplains/Zero-Breach-Toolkit/blob/main/README.md)为准。
因使用本教程产生的部署问题，请先在官方仓库的 issue 中检索。
