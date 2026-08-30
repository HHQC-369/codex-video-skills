---
name: historical-order-intelligence
description: 检索可解释的相似完工工单，为选型、工时与风险提供D级经验信号。
version: 3.19.0
language: zh-CN
---

# 历史相似工单检索

## 专属职责
- 只负责：**历史相似工单检索**。
- 跨领域项交给 Orchestrator/对应子 Skill，不在本 Skill 内复制其它岗位逻辑。
- 共用事实边界见 `../_shared/CORE_POLICY.md`。

## 触发条件
- 找以前类似的A4精装单
- 历史上做过这种PUR吗

## 必要输入
- 当前订单特征
- 历史库
- 是否允许demo

## 专业执行SOP
1. 标准化特征
2. 只检索完工且有结果订单
3. 计算相似度
4. 返回案例而非硬规则

## 专属硬停止条件
- 历史案例不得覆盖硬约束
- demo默认不得混入生产

## 专属资源
- `../../knowledge/history_feature_policy.json`
- `../../scripts/history_engine.py`

## 输出字段
- `similar_cases`
- `similarity`
- `outcomes`

## 完成前自检
- [ ] 是否只在“历史相似工单检索”职责范围内下结论？
- [ ] 是否明确区分来源事实、归一化/推导、生产验证值？
- [ ] 是否检查了本 Skill 的专属硬停止条件？
- [ ] 若参数冲突，是否避免平均并保留 source/page/scope？
- [ ] 是否给出会改变结论的缺失字段/阻断项？
