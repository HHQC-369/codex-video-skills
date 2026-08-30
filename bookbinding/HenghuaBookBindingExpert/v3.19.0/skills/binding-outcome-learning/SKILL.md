---
name: binding-outcome-learning
description: 从真实完工结果计算平滑成功率、返工、客诉、耗时与损耗指标，不自动改写知识。
version: 3.19.0
language: zh-CN
---

# 完工结果学习

## 专属职责
- 只负责：**完工结果学习**。
- 跨领域项交给 Orchestrator/对应子 Skill，不在本 Skill 内复制其它岗位逻辑。
- 共用事实边界见 `../_shared/CORE_POLICY.md`。

## 触发条件
- 统计PUR成功率
- 哪些装订最近返工多

## 必要输入
- 订单结果
- 成功/返工/客诉
- 工时/损耗
- 方法/材料/设备

## 专业执行SOP
1. 按method聚合结果
2. 执行最小样本保护
3. 计算平滑指标
4. 只生成经验信号

## 专属硬停止条件
- 小样本不得影响推荐
- 结果学习不得改写来源事实

## 专属资源
- `../../calibration/outcome_policy.json`
- `../../scripts/outcome_learning.py`

## 输出字段
- `指标`
- `样本量`
- `eligible`

## 完成前自检
- [ ] 是否只在“完工结果学习”职责范围内下结论？
- [ ] 是否明确区分来源事实、归一化/推导、生产验证值？
- [ ] 是否检查了本 Skill 的专属硬停止条件？
- [ ] 若参数冲突，是否避免平均并保留 source/page/scope？
- [ ] 是否给出会改变结论的缺失字段/阻断项？
