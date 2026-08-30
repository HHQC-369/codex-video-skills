# Codex 六大视频 Skill 整合仓库

版本：1.0.0  
核对日期：2026-08-30

本仓库统一整理以下 6 个视频相关 Skill / Skill 项目：

1. HyperFrames
2. video-use
3. Remotion Agent Skills
4. Generative Media Skills
5. chengfeng-videocut-skills
6. Seedance 2.0 Prompt Writing Skill

## 仓库结构

- `skills/`：6 个统一入口 Skill，方便 Codex / Agent 理解每个能力的用途、安装方式和调用边界。
- `tools/pull-all-upstream.ps1`：Windows PowerShell 一次性拉取 6 个官方/当前有效 GitHub 仓库的完整源码。
- `tools/pull-all-upstream.cmd`：Windows 双击入口。
- `tools/install-common-skills.ps1`：安装支持 `npx skills add` 的常规 Skill。
- `docs/UPSTREAM_SOURCES.md`：六个上游来源仓库与用途说明。
- `manifest.json`：机器可读清单。

## Windows 10 + Codex 推荐用法

### 拉取六个完整上游源码

双击：

`tools\pull-all-upstream.cmd`

或者在 PowerShell 执行：

```powershell
powershell -ExecutionPolicy Bypass -File .\tools\pull-all-upstream.ps1
```

完成后生成：

```text
upstream/
  hyperframes/
  video-use/
  remotion-skills/
  generative-media-skills/
  chengfeng-videocut-skills/
  seedance2-skill/
```

### 安装标准 Agent Skills

```powershell
powershell -ExecutionPolicy Bypass -File .\tools\install-common-skills.ps1
```

## 重要说明

- `video-use` 上游要求先读 `install.md`，并涉及 FFmpeg、Python 和 ElevenLabs API Key。
- `Generative-Media-Skills` 是大型多媒体 Skill 库，核心依赖 `muapi-cli`，部分生成服务需要 API Key / 额度。
- `chengfeng-videocut-skills` 当前采用 Codex Marketplace Plugin 架构，应按上游 README 的 Marketplace 安装流程执行。
- HyperFrames 当前要求 Node.js 22+ 和 FFmpeg。
- 本仓库中的 `skills/*/SKILL.md` 是统一入口/路由说明；完整第三方实现通过 `tools/pull-all-upstream.ps1` 从各自官方上游获取。

## 来源

详见 `docs/UPSTREAM_SOURCES.md`。
