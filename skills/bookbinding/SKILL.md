---
name: HenghuaBookBindingExpert
description: 恒华装订专家 GitHub 入口。当前稳定版 v3.19.0，覆盖105种装订结构、961条来源化技术参数、134个来源，并配套 Validation Center v1.15.0。用于装订方式推荐、参数查询、工艺规划、报价/生产前校验与后续证据补强。
version: 3.19.0
language: zh-CN
---
# 恒华装订专家 GitHub 入口

当前稳定版：**v3.19.0 RemainingNumericEvidenceClosure**。

## 调用原则
- 先读取 `factory/v3.19.0/SKILL.md` 与 `release-manifest.json`。
- 涉及生产值时，不把外部参考值直接当量产默认值；必须遵守 `production_verified=false` 与 Production Gate。
- `w-binding` 保持零直接数值证据，不从相邻装订方法拼接默认参数。
- `easy-french-no-glue` 只有 X-book 单张纸变体有直接数值证据，其余变体保持未解决。
- 发布或升级后运行 `validation/v1.15.0/one-click-validate.bat`。

## 目录
- `factory/v3.19.0/`：版本说明与工厂入口。
- `validation/v1.15.0/`：独立验证中心。
- `release-manifest.json`：三个原始交付包的 SHA256、文件数和验证状态。
- `tools/install-henghua-bookbinding.ps1`：Windows 本地安装/归档脚本。
