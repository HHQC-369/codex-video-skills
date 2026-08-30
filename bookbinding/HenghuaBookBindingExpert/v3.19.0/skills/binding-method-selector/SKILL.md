---
name: binding-method-selector
description: 根据页数、克重、厚度、开本、摊平、耐用、预算、数量、外观、可增删页等约束，排序推荐装订方案。
version: 3.19.0
language: zh-CN
---

# 装订结构总选型

## 专属职责
- 只负责：**装订结构总选型**。
- 跨领域项交给 Orchestrator/对应子 Skill，不在本 Skill 内复制其它岗位逻辑。
- 共用事实边界见 `../_shared/CORE_POLICY.md`。

## 触发条件
- A4 128页要180度平摊怎么装订
- 需要可增删页的方案

## 必要输入
- 尺寸/页数
- 材料
- 开合
- 可拆性
- 耐用
- 预算/交期
- 设备限制

## 专业执行SOP
1. 先应用硬约束
2. 再按7维评分
3. 列首选与备选
4. 对未知设备/参数建立阻断项

## 专属硬停止条件
- 被硬约束淘汰的方案不得被历史经验救回
- 不得把相似外观当相同结构

## 专属资源
- `../../knowledge/binding_methods.json`
- `../../rules/rules_v321.json`
- `../../scripts/rule_engine.py`

## 输出字段
- `primary`
- `alternatives`
- `score_breakdown`
- `blockers`

## 完成前自检
- [ ] 是否只在“装订结构总选型”职责范围内下结论？
- [ ] 是否明确区分来源事实、归一化/推导、生产验证值？
- [ ] 是否检查了本 Skill 的专属硬停止条件？
- [ ] 若参数冲突，是否避免平均并保留 source/page/scope？
- [ ] 是否给出会改变结论的缺失字段/阻断项？

## v3.8 方法消歧
- `French Link Stitch / 法式勾线` → `french-link-stitch-binding`（独立针法型装订）。
- `科普特+法式勾线` → `coptic-binding` + 对应 stitch variant。
- “真法式装订/仿法式装订”不得因“法式”二字误归到 French Link Stitch。
### v3.12 工业方法选择补强
当用户提供设备型号（BQ-500/BQ-280PUR/DBM-700/Hohner EXACT/aster/PräDeka/PräForm/RENZ）时，方法选择同时返回该设备适配的装订family和“设备专用参数，不是通用工艺值”的边界。

