---
name: binding-evaluator
description: 运行P5回归场景，检查硬约束、工程计算、路由、兼容验证、报价防幻觉和特殊工艺打样规则。
version: 3.19.0
language: zh-CN
---

# 发布与回归质量门禁

## 专属职责
- 只负责：**发布与回归质量门禁**。
- 跨领域项交给 Orchestrator/对应子 Skill，不在本 Skill 内复制其它岗位逻辑。
- 共用事实边界见 `../_shared/CORE_POLICY.md`。

## 触发条件
- 验证这版Skill能不能发布
- 全量回归检查

## 必要输入
- 待发布版本
- 测试报告
- 规则/知识/安装包

## 专业执行SOP
1. 执行所有有效唯一Eval
2. 检查关键硬约束
3. 检查installable parity
4. 输出可发布/阻断

## 专属硬停止条件
- 重复测试不得重复计数
- 关键失败不得被总通过率掩盖

## 专属资源
- `../../scripts/release_gate.py`
- `../../scripts/run_skill_evals.py`
- `../../scripts/check_installable_parity.py`

## 输出字段
- `有效覆盖数`
- `失败项`
- `release gate`

## 完成前自检
- [ ] 是否只在“发布与回归质量门禁”职责范围内下结论？
- [ ] 是否明确区分来源事实、归一化/推导、生产验证值？
- [ ] 是否检查了本 Skill 的专属硬停止条件？
- [ ] 若参数冲突，是否避免平均并保留 source/page/scope？
- [ ] 是否给出会改变结论的缺失字段/阻断项？
