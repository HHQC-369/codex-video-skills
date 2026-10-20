---
name: dsh-complete-assistant
description: DeepSeek Harness 完整助手配置技能：涵盖免费模型、GitHub 插件、网页搜索、MCP 文件系统、MCP GitHub、MCP 桌面控制等全部已安装功能的使用说明与排查指南。
whenToUse: 用户想了解或使用已安装的 DSH 插件与 MCP 功能，包括模型选择、网页搜索、GitHub 操作、本地文件读写、桌面软件控制等；或需要重新配置、排查已安装插件时使用。
metadata:
  version: "1.0"
  author: user
  created: 2026-10-20
---

# DSH 完整助手技能（dsh-complete-assistant）

本技能汇总了本机 DeepSeek Harness（DSH）桌面端已安装的全部插件与 MCP 功能，供后续使用与排查参考。

## 一、已安装插件清单

| 插件 | 版本 | 来源 | 作用 |
|---|---|---|---|
| `dsh-our-free-model` | 2.5.3 | GitHub Release tarball（vendored） | 免费模型池：DeepSeek V4.1 Flash、Kimi K3、Nemotron 3.5 等，无需 API Key |
| `dsh-plugin-github` | 0.1.2 | npm registry | GitHub 仓库/议题搜索、详情、文件读取工具（`github_search`、`github_get`） |
| `@liustack/modsearch` | 5.10.10 | npm registry | 免费网页搜索与页面抓取（Firecrawl、Keenable 等，无需注册） |
| `@deepseek-ai/dsh-mcp-client` | 0.2.1-rc.2 | npm registry | MCP 客户端桥接，连接外部 MCP server 并注册为原生工具 |

## 二、已配置 MCP Server

所有 MCP server 均通过 `cordis.patch.yml` 挂载，使用 stdio 传输，由 DSH HMR 自动加载。

### 1. 文件系统 MCP（mcp-filesystem）

- **配置位置**：`C:\Users\Administrator\.dsh\profiles\desktop\cordis.patch.yml`
- **serverName**：`filesystem`
- **入口**：`C:\Users\Administrator\.dsh\mcp-servers\node_modules\@modelcontextprotocol\server-filesystem\dist\index.js`
- **允许访问目录**：`C:\Users\Administrator\Desktop`
- **可用工具示例**：
  - `mcp__filesystem__read_text_file`：读取文本文件
  - `mcp__filesystem__write_file`：创建/覆盖文件
  - `mcp__filesystem__list_directory`：列出目录内容
  - `mcp__filesystem__search_files`：递归搜索文件
  - `mcp__filesystem__edit_file`：按行编辑文件
  - `mcp__filesystem__create_directory`：创建目录
  - `mcp__filesystem__move_file`：移动/重命名文件

### 2. GitHub MCP（mcp-github）

- **配置位置**：`C:\Users\Administrator\.dsh\profiles\desktop\cordis.patch.yml`
- **serverName**：`github`
- **入口**：`C:\Users\Administrator\.dsh\mcp-servers\node_modules\@modelcontextprotocol\server-github\dist\index.js`
- **认证**：通过环境变量 `GITHUB_TOKEN`（已设置为用户级环境变量）
- **可用工具示例**：
  - `mcp__github__search_repositories`：搜索 GitHub 仓库
  - `mcp__github__create_or_update_file`：创建或更新仓库文件
  - `mcp__github__create_repository`：创建新仓库

### 3. 桌面控制 MCP（mcp-desktop）

- **配置位置**：`C:\Users\Administrator\.dsh\profiles\desktop\cordis.patch.yml`
- **serverName**：`desktop`
- **入口**：`C:\Users\Administrator\.dsh\mcp-servers\desktop-mcp-server.py`
- **依赖**：Python + `pyautogui`、`pywinauto`、`mcp`（已安装）
- **可用工具示例**：
  - `mcp__desktop__open_app(app_name)`：打开应用（word、excel、notepad、chrome、calc 等）
  - `mcp__desktop__click(x, y)`：屏幕坐标点击
  - `mcp__desktop__type_text(text)`：输入文本
  - `mcp__desktop__press_hotkey(keys)`：按快捷键（如 ctrl,v）
  - `mcp__desktop__screenshot()`：截屏保存到桌面

## 三、配置文件路径

| 文件 | 路径 | 说明 |
|---|---|---|
| Profile 依赖清单 | `C:\Users\Administrator\.dsh\profiles\desktop\package.json` | 记录所有已安装插件及其版本 |
| Bundle 注册 | `C:\Users\Administrator\.dsh\profiles\desktop\package.json` → `dsh.profile.bundles` | 插件加载顺序 |
| 用户补丁层 | `C:\Users\Administrator\.dsh\profiles\desktop\cordis.patch.yml` | MCP server 挂载配置 |
| 插件运行时数据 | `C:\Users\Administrator\.dsh\our-free-model\` | our-free-model 的 catalog、settings 等 |
| 安装前备份 | `C:\Users\Administrator\.dsh\backups\` | 每次安装前自动备份 |
| MCP server 目录 | `C:\Users\Administrator\.dsh\mcp-servers\` | 存放 filesystem、github、desktop server |

## 四、在 DSH 中的使用示例

打开 DSH 桌面应用，新建对话，直接发送自然语言即可：

### 免费模型对话

```
帮我用免费模型总结一下最近的 AI 新闻
```

模型会自动选择 `our-free-model` 分组下的模型（如 `opencode/deepseek-v4.1-flash-free`）。

### GitHub 操作

```
帮我查看 vercel/next.js 仓库的最新 Issue
```

模型会调用 `github_search` 或 `mcp__github__*` 工具。

### 网页搜索

```
今天人工智能领域有什么重要新闻？
```

模型会通过 modsearch 自动联网搜索并返回带来源的答案。

### 本地文件操作

```
帮我看看桌面上都有什么文件
帮我把这个笔记保存到桌面的 test.txt
```

模型会调用 `mcp__filesystem__*` 工具读写 `C:\Users\Administrator\Desktop` 下的文件。

### 桌面软件控制

```
帮我打开记事本，输入“你好，这是 DeepSeek 控制的”
帮我截一张当前屏幕的图
帮我打开计算器
```

模型会调用 `mcp__desktop__*` 工具操作本地软件。

## 五、环境变量设置

GitHub MCP 需要 `GITHUB_TOKEN`。已设置为用户级环境变量。如需更换或重新设置：

### PowerShell（当前会话生效）

```powershell
$env:GITHUB_TOKEN = "ghp_xxxxxxxxxxxx"
```

### 用户级持久化（重启后生效）

```powershell
[System.Environment]::SetEnvironmentVariable("GITHUB_TOKEN", "ghp_xxxxxxxxxxxx", "User")
```

### 图形界面

控制面板 → 系统 → 高级系统设置 → 环境变量 → 用户变量 → 新建 `GITHUB_TOKEN`。

设置后**必须重启 DSH 应用**。

## 六、故障排查

### 1. DSH 未识别 MCP 工具

**可能原因**：`cordis.patch.yml` 配置语法错误，或未重启 DSH。

**检查方法**：
```powershell
# 检查配置文件中是否包含 mcp 插件
Select-String -Path "C:\Users\Administrator\.dsh\profiles\desktop\cordis.patch.yml" -Pattern 'mcp-'
# 检查 bundles 列表
(Get-Content -Raw "C:\Users\Administrator\.dsh\profiles\desktop\package.json" | ConvertFrom-Json).dsh.profile.bundles
```

**解决**：确认 `cordis.patch.yml` 中有正确的 `mcp-filesystem`、`mcp-github`、`mcp-desktop` 条目，然后重启 DSH。

### 2. GitHub MCP 报错 401/权限不足

**可能原因**：`GITHUB_TOKEN` 未设置或已过期。

**解决**：
1. 到 [GitHub Personal Access Tokens](https://github.com/settings/tokens/new) 生成新 token（勾选 `repo` 权限）
2. 设置为用户环境变量 `GITHUB_TOKEN`
3. 重启 DSH

### 3. 桌面控制脚本无法启动

**可能原因**：Python 或依赖库未安装。

**检查方法**：
```powershell
python --version
pip list | Select-String -Pattern 'pyautogui|pywinauto|mcp'
```

**解决**：
```powershell
pip install pyautogui pywinauto mcp pillow
```

### 4. 插件安装失败

**可能原因**：网络无法访问 npm registry 或 GitHub。

**解决**：使用已备份的 vendor tarball 离线安装，或通过 DSH 桌面 CLI：
```powershell
$env:ELECTRON_RUN_AS_NODE="1"
& "C:\Users\Administrator\AppData\Local\Programs\DeepSeek Harness\DeepSeek Harness.exe" "C:\Users\Administrator\AppData\Local\Programs\DeepSeek Harness\resources\app.asar\dsh\node_modules\@deepseek-ai\dsh-desktop-host\lib\cli.js" plugin --profile desktop add <tarball路径>
```

## 七、备份与恢复

每次插件安装前会自动备份到：
```
C:\Users\Administrator\.dsh\backups\<日期>-<插件名>-install\
```

包含：`package.json`、`pnpm-lock.yaml`、`cordis.patch.yml`。

如需回滚，将备份文件覆盖回 profile 目录并重启 DSH 即可。

## 八、后续扩展

如需添加新的 MCP server，按以下步骤：

1. 安装 server 包到 `C:\Users\Administrator\.dsh\mcp-servers\node_modules\`
2. 在 `cordis.patch.yml` 追加 `insert` 条目（参考现有 `mcp-*` 格式）
3. 重启 DSH
4. 在对话中测试新工具

---

**技能适用场景**：任何需要在 DSH 中使用已安装的免费模型、GitHub 搜索、网页搜索、本地文件操作或桌面控制功能的场景。