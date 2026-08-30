---
name: binding-quote-engine
description: 只对ERP/供应商/人工确认的真实成本数据进行结构化数量与价格计算，缺单价时阻断而不是猜价。
version: 3.19.0
language: zh-CN
---

# 结构化报价计算接口

## 专属职责
- 只负责：**结构化报价计算接口**。
- 跨领域项交给 Orchestrator/对应子 Skill，不在本 Skill 内复制其它岗位逻辑。
- 共用事实边界见 `../_shared/CORE_POLICY.md`。

## 触发条件
- 1000本PUR怎么报价
- 这个精装成本怎么算

## 必要输入
- 工艺BOM
- 数量
- 真实单价
- 损耗/外协规则

## 专业执行SOP
1. 确认工艺与数量驱动项
2. 只取真实pricebook
3. 缺价即阻断
4. 汇总成本并标来源

## 专属硬停止条件
- 任何缺失unit_cost不得猜
- AI不直接决定最低保护价

## 专属资源
- `../../scripts/quote_engine.py`
- `../../scripts/quote_from_pricebook.py`
- `../../scripts/price_resolver.py`

## 输出字段
- `quote_status`
- `line_items`
- `subtotal`
- `missing_prices`

## 完成前自检
- [ ] 是否只在“结构化报价计算接口”职责范围内下结论？
- [ ] 是否明确区分来源事实、归一化/推导、生产验证值？
- [ ] 是否检查了本 Skill 的专属硬停止条件？
- [ ] 若参数冲突，是否避免平均并保留 source/page/scope？
- [ ] 是否给出会改变结论的缺失字段/阻断项？
