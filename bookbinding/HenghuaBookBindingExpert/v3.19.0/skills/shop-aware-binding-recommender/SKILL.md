---
name: shop-aware-binding-recommender
description: 在P1硬约束基础上有限引入门店历史和成功率，生成可解释的本店推荐。
version: 3.19.0
language: zh-CN
---

# 门店自适应推荐

## 专属职责
- 只负责：**门店自适应推荐**。
- 跨领域项交给 Orchestrator/对应子 Skill，不在本 Skill 内复制其它岗位逻辑。
- 共用事实边界见 `../_shared/CORE_POLICY.md`。

## 触发条件
- 结合本店历史推荐装订
- 根据实际成功率优化排序

## 必要输入
- 订单约束
- 基础规则结果
- 门店历史/设备

## 专业执行SOP
1. 先跑基础硬约束
2. 再叠加有资格的结果信号
3. 限制经验调整幅度
4. 输出基础分与调整分

## 专属硬停止条件
- 经验不得救回硬约束淘汰项
- 未达最小样本不调整

## 专属资源
- `../../scripts/adaptive_recommender.py`
- `../../calibration/adaptive_policy.json`

## 输出字段
- `base_score`
- `empirical_adjustment`
- `final_rank`

## 完成前自检
- [ ] 是否只在“门店自适应推荐”职责范围内下结论？
- [ ] 是否明确区分来源事实、归一化/推导、生产验证值？
- [ ] 是否检查了本 Skill 的专属硬停止条件？
- [ ] 若参数冲突，是否避免平均并保留 source/page/scope？
- [ ] 是否给出会改变结论的缺失字段/阻断项？
### v3.17 外部证据优先级
外部数值来源只用于候选范围与风险提示。推荐生产方案时，`production_verified > equipment_verified > shop_verified > scoped external reference > generic structural evidence`；没有恒华真实数据时继续要求白样/首件。

