# Henghua BookBinding Skills

本目录用于长期维护恒华书籍装订 Skill。

## Current
- `HenghuaBookBindingExpert/v3.19.0/`
- Release: L24 v3.19.0 RemainingNumericEvidenceClosure
- Skills: 32
- Methods: 105
- Technical parameters: 961
- Sources: 134
- Validation Center: v1.15.0

## Versioning
后续优化请新增版本目录（如 `v3.20.0/`），不要覆盖历史版本。`CURRENT_VERSION.md` 指向当前正式版本。

## Production boundary
仓库中的外部/书本/厂商参数默认属于 reference evidence；只有真实 Shop Profile、设备校验和 ERP 合格工单完成审核后，才能逐级晋升为 `shop_verified -> equipment_verified -> production_verified`。
