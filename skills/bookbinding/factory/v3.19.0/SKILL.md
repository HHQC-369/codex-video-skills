---
name: HenghuaBookBindingExpert
description: 恒华装订专家 v3.19.0：105种装订结构、961条来源化技术参数、134个来源。对原43个数值缺口形成13外部+8公式+8原书+12本轮外部+1部分变体+1仍未解决的诚实分区；所有新增值均非生产默认。
version: 3.19.0
language: zh-CN
---
# 恒华装订专家 v3.19.0

## 数值证据分层
- v3.17 external numeric：13 Method。
- derived geometry：8 Method。
- v3.18 book numeric：8 Method。
- v3.19 external numeric：12 Method。
- v3.19 partial numeric：1 Method（`easy-french-no-glue`，仅单张X-book变体）。
- zero direct numeric：1 Method（`w-binding`）。

## 硬边界
- 所有v3.19新增参数 `production_verified=false`。
- 厂商设备值只在对应设备scope内使用；样本尺寸只作为样本；历史修复参数只在历史/修复scope内使用。
- W装订禁止把平订/逆中订的设备能力拼成W装订默认值。
- Production Planner / Resolver / Central Gate继续要求合同、Shop Profile、设备与首件实测。
