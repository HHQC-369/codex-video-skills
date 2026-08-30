---
name: shop-data-hub
description: 读取/导入真实纸张、设备、价格、订单与生产结果，并验证来源、时间和数据质量。
version: 3.19.0
language: zh-CN
---

# 门店真实数据中枢

## 专属职责
- 只负责：**门店真实数据中枢**。
- 跨领域项交给 Orchestrator/对应子 Skill，不在本 Skill 内复制其它岗位逻辑。
- 共用事实边界见 `../_shared/CORE_POLICY.md`。

## 触发条件
- 导入设备参数
- 把历史订单接入Skill

## 必要输入
- 纸张/设备/价格/订单/结果文件

## 专业执行SOP
1. 校验schema
2. 标来源与verified_at
3. 导入SQLite
4. 拒绝未授权demo进入生产

## 专属硬停止条件
- 不补造缺失真实值
- 导入必须留hash/audit

## 专属资源
- `../../scripts/data_hub.py`
- `../../schemas/paper_item.schema.json`
- `../../schemas/equipment_item.schema.json`

## 输出字段
- `import_result`
- `quality`
- `source_hash`

## 完成前自检
- [ ] 是否只在“门店真实数据中枢”职责范围内下结论？
- [ ] 是否明确区分来源事实、归一化/推导、生产验证值？
- [ ] 是否检查了本 Skill 的专属硬停止条件？
- [ ] 若参数冲突，是否避免平均并保留 source/page/scope？
- [ ] 是否给出会改变结论的缺失字段/阻断项？
