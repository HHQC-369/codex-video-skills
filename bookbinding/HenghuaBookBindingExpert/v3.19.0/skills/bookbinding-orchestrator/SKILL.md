---
name: bookbinding-orchestrator
description: 识别用户任务，调用选择、结构、材料、质量、折页、印刷等子技能，并输出可执行工作单。
version: 3.19.0
language: zh-CN
---

# 多Skill总编排

## 专属职责
- 只负责：**多Skill总编排**。
- 跨领域项交给 Orchestrator/对应子 Skill，不在本 Skill 内复制其它岗位逻辑。
- 共用事实边界见 `../_shared/CORE_POLICY.md`。

## 触发条件
- 帮我从选型到报价完整分析
- 这本书怎么装订并排产

## 必要输入
- 用户任务
- 约束
- 已有数据

## 专业执行SOP
1. 先Router
2. 确定硬约束与所需数据
3. 按依赖顺序调用子Skill
4. 合并证据与阻断项

## 专属硬停止条件
- 子Skill冲突优先硬约束/验证数据
- 不得跳过参数/设备阻断

## 专属资源
- `../../scripts/query_router.py`
- `../../rules/router_v321.json`
- `../../skills/_shared/CORE_POLICY.md`

## 输出字段
- `routing`
- `execution_plan`
- `merged_result`

## 完成前自检
- [ ] 是否只在“多Skill总编排”职责范围内下结论？
- [ ] 是否明确区分来源事实、归一化/推导、生产验证值？
- [ ] 是否检查了本 Skill 的专属硬停止条件？
- [ ] 若参数冲突，是否避免平均并保留 source/page/scope？
- [ ] 是否给出会改变结论的缺失字段/阻断项？
