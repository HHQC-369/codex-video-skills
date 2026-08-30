# HenghuaBookBindingExpert v3.19.0 — GitHub Source View

这里保存恒华书籍装订专家 v3.19.0 的可读、可版本化 Skill 源定义，便于后续从 GitHub 调取、比较和优化。

## Contents
- `skills/`：32 个正式子 Skill + `_shared/CORE_POLICY.md`。
- `RELEASE_INFO.md`：本版能力与验证摘要。
- GitHub 实际调用入口：`/skills/bookbinding/SKILL.md`。
- Factory 入口：`/skills/bookbinding/factory/v3.19.0/`。
- Validation Center：`/skills/bookbinding/validation/v1.15.0/`。
- 安装脚本：`/skills/bookbinding/tools/install-henghua-bookbinding.ps1`。

## Version policy
历史版本不覆盖。后续升级创建 `v3.20.0/`、`v3.21.0/` 等新目录，并更新 `bookbinding/CURRENT_VERSION.md` 与仓库 `manifest.json`。

## Evidence boundary
外部网站、图书、视频、GitHub、厂商样本和设备规格均保留来源作用域；只有真实 Shop Profile、设备校验和 ERP 合格工单经过审核后，参数才能晋升为 `shop_verified -> equipment_verified -> production_verified`。
