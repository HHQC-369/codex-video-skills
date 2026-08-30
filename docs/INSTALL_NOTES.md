# 安装与依赖提示

## HyperFrames
- 推荐：`npx skills add heygen-com/hyperframes`
- 主路由：`/hyperframes`
- 要求：Node.js 22+、FFmpeg
- 上游还提供 `npx hyperframes skills update` 用于安装/更新核心技能集。

## video-use
- 上游明确建议：先读 `install.md`，再读 `SKILL.md`
- 核心依赖：Python、FFmpeg/FFprobe、ElevenLabs Scribe API Key
- 部分动画槽会用 HyperFrames / Remotion / Manim

## Remotion
- 推荐：`npx skills add remotion-dev/skills`
- 包含 `remotion-best-practices` 及多个细分技能。

## Generative Media Skills
- Clone 后按 README 使用。
- Core/Library 架构；大量工作流调用 `muapi-cli`
- 需要 MuAPI 的任务可能产生 API 费用。

## chengfeng-videocut-skills
- 当前为 Codex Marketplace Plugin 架构。
- Windows 10/11 正式支持由上游 Runtime 提供。
- 不建议仅复制某个 SKILL.md；应按上游 README 安装 Marketplace + Plugin + Runtime。

## Seedance 2
- 推荐：`npx skills add dexhunter/seedance2-skill`
- 上游包含英文 `SKILL.md` 和中文 `zh/SKILL.md`。
