---
name: HenghuaBookBindingExpert
description: 恒华装订专家 v3.19.0 最新完整版 GitHub 唯一入口：覆盖105种装订结构、961条来源化技术参数、134个来源、32个专业子Skill，并配套 Validation Center v1.15.0、Production Gate、数值证据分层与后续版本化优化机制。
version: 3.19.0
language: zh-CN
---

# 恒华装订专家 v3.19.0 — 唯一正式入口

当前稳定版：**L24 v3.19.0 RemainingNumericEvidenceClosure**。

## 完整能力
- 32 个专业子 Skill。
- 105 个装订 Method。
- 961 条来源化技术参数。
- 134 个来源。
- Validation Center：v1.15.0。
- Production Planner / Resolver / Central Production Gate 全链路保留。

## 数值证据分层
原43个数值缺口当前分区：
- v3.17 external numeric：13 Method。
- derived geometry：8 Method。
- v3.18 book numeric：8 Method。
- v3.19 external numeric：12 Method。
- v3.19 partial numeric：1 Method（`easy-french-no-glue`，仅单张 X-book 变体）。
- zero direct numeric：1 Method（`w-binding`）。

## 硬边界
- 所有 v3.19 新增外部参数保持 `production_verified=false`。
- 厂商设备值只能在对应 `equipment_model` scope 内使用。
- 图书、视频、网站、历史样本、GitHub 和机构资料均属于来源化 reference evidence，不自动成为恒华门店量产默认值。
- `w-binding` 禁止借用平订、逆中订或其它组成工艺的设备能力拼成默认参数。
- `easy-french-no-glue` 只能把已有直接数值用于 X-book 单张纸变体，不能扩展到其余变体。
- 生产值必须继续经过 `shop_verified -> equipment_verified -> production_verified`。
- 参数冲突不得平均，必须保留 source / locator / scope / context。

## GitHub 目录
- `bookbinding/HenghuaBookBindingExpert/v3.19.0/skills/`：32 个最新完整专业子 Skill。
- `bookbinding/HenghuaBookBindingExpert/v3.19.0/skills/_shared/CORE_POLICY.md`：共享事实与生产边界。
- `factory/v3.19.0/`：Factory 的 README / FACTORY / INSTALL 文档；不再保留第二份重复 SKILL 入口。
- `validation/v1.15.0/`：独立验证中心。
- `release-manifest.json`：发布包 SHA256、文件数与验证状态。
- `tools/install-henghua-bookbinding.ps1`：Windows 本地安装脚本。

## 调用顺序
1. 从本文件识别任务与全局硬边界。
2. 根据任务调用 `bookbinding/HenghuaBookBindingExpert/v3.19.0/skills/` 下对应专业子 Skill。
3. 技术参数读取必须保留来源作用域和验证级别。
4. 涉及生产模式时执行 Contract、Shop Profile、设备验证、首件与 Production Gate。
5. 发布或升级后执行 `validation/v1.15.0/one-click-validate.bat`。

## 版本规则
- v3.19.0 作为当前正式基线，不覆盖历史提交。
- 下一次优化创建新的版本目录，例如 `v3.20.0/`。
- 新版本通过验证后再更新 `bookbinding/CURRENT_VERSION.md`、本入口和仓库 `manifest.json`。
