---
name: layflat-binding-expert
description: 专门解决180°/360°摊平、跨页图、扫描与展示需求。
version: 3.19.0
language: zh-CN
---

# 180/360开合专门选型

## 专属职责
- 只负责：**180/360开合专门选型**。
- 跨领域项交给 Orchestrator/对应子 Skill，不在本 Skill 内复制其它岗位逻辑。
- 共用事实边界见 `../_shared/CORE_POLICY.md`。

## 触发条件
- 必须180度平摊选什么
- 要360度翻转怎么装

## 必要输入
- 要求角度
- 跨页/扫描目的
- 书芯/材料
- 预算

## 专业执行SOP
1. 明确180与360不是一回事
2. 按canonical layflat评分
3. 淘汰违反硬约束者
4. 比较开合/耐用/成本取舍

## 专属硬停止条件
- excellent必须按强平摊能力评分
- 360要求不得用普通180结构替代

## 专属资源
- `../../rules/rules_v321.json`
- `../../scripts/rule_engine.py`

## 输出字段
- `angle_requirement`
- `candidates`
- `tradeoffs`

## 完成前自检
- [ ] 是否只在“180/360开合专门选型”职责范围内下结论？
- [ ] 是否明确区分来源事实、归一化/推导、生产验证值？
- [ ] 是否检查了本 Skill 的专属硬停止条件？
- [ ] 若参数冲突，是否避免平均并保留 source/page/scope？
- [ ] 是否给出会改变结论的缺失字段/阻断项？
