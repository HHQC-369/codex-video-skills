---
name: bookbinding-calculator
description: 只用明确输入执行书芯厚度、封面展开、精装板材、折页等算术/几何计算，并严格区分确定值与工程估算。
version: 3.19.0
language: zh-CN
---

# 装订工程计算

## 专属职责
- 只负责：**装订工程计算**。
- 跨领域项交给 Orchestrator/对应子 Skill，不在本 Skill 内复制其它岗位逻辑。
- 共用事实边界见 `../_shared/CORE_POLICY.md`。

## 触发条件
- 100页纸厚0.1mm书芯多厚
- 封面展开尺寸怎么算

## 必要输入
- 纸厚/张数
- 成品尺寸
- 书脊
- 折帖/爬移输入

## 专业执行SOP
1. 区分确定值/工程估算/设备参数
2. 计算书芯厚度/封面展开/爬移
3. 列假设
4. 给不确定度/验证要求

## 专属硬停止条件
- 没有纸厚不得只用克重猜厚度
- 设备公差不得内置猜值

## 专属资源
- `../../scripts/bookbinding_calculator.py`

## 输出字段
- `results`
- `class`
- `assumptions`
- `vendor_required`

## 完成前自检
- [ ] 是否只在“装订工程计算”职责范围内下结论？
- [ ] 是否明确区分来源事实、归一化/推导、生产验证值？
- [ ] 是否检查了本 Skill 的专属硬停止条件？
- [ ] 若参数冲突，是否避免平均并保留 source/page/scope？
- [ ] 是否给出会改变结论的缺失字段/阻断项？

## v3.3 GitHub 几何计算增强
- 新增 `../../scripts/imposition_calculator.py`：folio页序、push-out、纸厚+线胀书芯厚度、圆背弧几何、壳板/包布/环衬、花头带。
- `deterministic_geometry` 可直接复算数学关系；`engineering_estimate` 必须在输出中保留“实测后替换”提示。
- 保留旧骑马订 creep 近似以兼容历史工单；若提供 `max_nesting_depth + sheet_caliper_mm`，同时输出FI-127来源的几何push-out，不混为同一模型。
### v3.15 四书蒸馏：尺寸链证据
- 标书封面A4/8mm样例再次支持无勒口 `展开宽=2×成品宽+书脊`；样例428mm只用于证据验证。
- 精装A4/20mm/10mm翻书位属于来源样例，不得变成所有精装默认hinge。
### v3.17 公式与外部数值边界
`derived_geometry_present` 只表示存在确定性几何公式，不代表胶温、压力、材料窗口或设备能力已验证。公式结果必须保留输入值、单位和公式ID，不能用外部样例值填缺失输入。

