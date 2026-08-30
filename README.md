# 恒华 Codex Skill Library

版本：1.1.0  
核对日期：2026-08-30

本仓库统一管理原有 6 个视频相关 Skill / Skill 项目，并新增恒华书籍装订专家 Skill。

## 当前 Skill

1. HyperFrames
2. video-use
3. Remotion Agent Skills
4. Generative Media Skills
5. chengfeng-videocut-skills
6. Seedance 2.0 Prompt Writing Skill
7. HenghuaBookBindingExpert v3.19.0

## 仓库结构

- `skills/`：统一入口 Skill，方便 Codex / Agent 理解每个能力的用途、安装方式和调用边界。
- `skills/bookbinding/SKILL.md`：恒华装订专家 GitHub 统一入口。
- `skills/bookbinding/factory/v3.19.0/`：BookBinding Skill Factory L24 v3.19.0 版本入口与发布说明。
- `skills/bookbinding/validation/v1.15.0/`：BookBinding 独立验证中心，可直接验证目录或 ZIP。
- `skills/bookbinding/release-manifest.json`：BookBinding 三个原始交付包的 SHA256、文件数量和验证状态。
- `skills/bookbinding/tools/install-henghua-bookbinding.ps1`：Windows 本地安装脚本。
- `tools/pull-all-upstream.ps1`：Windows PowerShell 一次性拉取 6 个视频 Skill 官方/当前有效 GitHub 仓库的完整源码。
- `tools/pull-all-upstream.cmd`：Windows 双击入口。
- `tools/install-common-skills.ps1`：安装支持 `npx skills add` 的常规 Skill。
- `docs/UPSTREAM_SOURCES.md`：六个视频上游来源仓库与用途说明。
- `manifest.json`：机器可读总清单。

## HenghuaBookBindingExpert v3.19.0

当前稳定版为 **L24 v3.19.0 RemainingNumericEvidenceClosure**：

- 32 个子 Skill
- 105 个装订 Method
- 961 条来源化技术参数
- 134 个来源
- v3.19 新增 31 条外部数值参数、14 个外部来源
- `w-binding` 继续保持零直接数值证据，不伪造参数
- `easy-french-no-glue` 仅 X-book 单张纸变体具有直接数值证据
- 所有 v3.19 新增外部值保持 `production_verified=false`

独立 Validation Center v1.15.0 已对 `HenghuaBookBindingExpert_v3.19.0` 可安装目录验证通过：**41/41 PASS**。

### Windows 本地安装

在本地已有 Expert ZIP 时：

```powershell
powershell -ExecutionPolicy Bypass -File .\skills\bookbinding\tools\install-henghua-bookbinding.ps1 `
  -ExpertZip "D:\path\HenghuaBookBindingExpert_v3.19.0.zip" `
  -FactoryZip "D:\path\Henghua_BookBinding_SkillFactory_L24_v3.19.0_RemainingNumericEvidenceClosure.zip" `
  -ValidationZip "D:\path\Henghua_BookBinding_ValidationCenter_v1.15.0.zip"
```

脚本先校验 SHA256，再把 Expert 安装到 `$HOME\.codex\skills\HenghuaBookBindingExpert`，并将 Factory / Validation Center 归档到 `$HOME\.codex\skill-sources\HenghuaBookBinding`。

### BookBinding 验证

```powershell
.\skills\bookbinding\validation\v1.15.0\one-click-validate.bat "D:\path\HenghuaBookBindingExpert_v3.19.0.zip"
```

## 六个视频 Skill 的 Windows 10 + Codex 用法

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
- 六个视频项目的完整第三方实现仍通过 `tools/pull-all-upstream.ps1` 从各自官方上游获取。
- BookBinding 的生产参数继续受 Production Gate 约束，来源值不得自动晋升为量产默认值。

## 来源

视频项目详见 `docs/UPSTREAM_SOURCES.md`；BookBinding 版本身份与包哈希详见 `skills/bookbinding/release-manifest.json`。
