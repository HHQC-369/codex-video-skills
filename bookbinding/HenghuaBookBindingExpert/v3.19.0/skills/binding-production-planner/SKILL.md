---
name: binding-production-planner
description: 把已确认的装订结构转换为可执行生产工序和质量关卡；负责人、设备、工时由门店数据补全。
version: 3.19.0
language: zh-CN
---

# 工单工序规划

## 专属职责
- 只负责：**工单工序规划**。
- 跨领域项交给 Orchestrator/对应子 Skill，不在本 Skill 内复制其它岗位逻辑。
- 共用事实边界见 `../_shared/CORE_POLICY.md`。

## 触发条件
- 科普特装订生产流程
- PUR胶装工单怎么排

## 必要输入
- method_id
- 数量
- 门店设备/人员
- 交期

## 专业执行SOP
1. 匹配family流程模板
2. 生成工序与质量关
3. 补材料/设备/risk清单
4. 要求门店填owner/equipment/time

## 专属硬停止条件
- 无workflow不得伪造工序
- hand_sewn必须白样/首件

## 专属资源
- `../../knowledge/process_templates.json`
- `../../scripts/production_planner.py`

## 输出字段
- `workflow`
- `steps`
- `quality_gates`
- `unfilled_shop_fields`

## 完成前自检
- [ ] 是否只在“工单工序规划”职责范围内下结论？
- [ ] 是否明确区分来源事实、归一化/推导、生产验证值？
- [ ] 是否检查了本 Skill 的专属硬停止条件？
- [ ] 若参数冲突，是否避免平均并保留 source/page/scope？
- [ ] 是否给出会改变结论的缺失字段/阻断项？


## v3.5 专用生产流
- `springback-binding` → `WF-springback-ledger`。
- `sewn-board-binding` → `WF-sewn-board`。
- 两者均 `requires_sampling=true`，不得回退到通用精装/手缝流程隐藏关键承力节点。

## v3.7 圆背专用生产流
- `round-spine-case` 在非常规带子穿壳场景可选 `WF-roundback-nonstandard-tape-case`；仅明确匹配该来源结构时使用。
- 扒圆/起脊技术演示可引用 `WF-rounding-backing-technique-v37`，但锤击力、压制时间、胶种保持未填门店字段。
- Springback Part1 已并入 `WF-springback-ledger` 的书芯准备/扁带锁线/扒圆起脊前段，Part2/3负责后续弹性书背与覆盖。
- 圆背/非常规圆背继续强制白样与首件；任何来源样例尺寸不能自动变成批量工单默认值。

## v3.8 手缝variant调度
当 `method_id=coptic-binding` 且提供 `workflow_variant` 时，可调度 `french-link-hybrid`、`french-link-crossed`、`french-link-noncross`、`coptic-new-chinese`、`paperbag-upcycle`；默认科普特仍走 `WF-hand-sewn`。新 `french-link-stitch-binding` 默认走 `WF-french-link-basic`。
### v3.9 科普特生产前置
科普特/French Link订单在进入缝制前必须完成：分组折帖 → 共同孔位模板 → 齐叠夹持 → 铅笔标孔 → 左右余量QC → 垂直预打孔 → 封板孔位转移 → 白样。

### v3.10 工坊前置质量关
- 手缝订单增加：纸纹候选检查 → 页/帖数量复核 → 孔位/工具确认 → 线材处理 → 缝线方向/张力QC → 缝孔闭合检查 → 再进入书背胶合。
- 替代压书方案只能作为临时工装选择，必须记录压板平整/载荷稳定性；没有门店实测时不得写压力与压制时长。
## v3.11 手缝生产前检查
- 开始批量前必须记录纸纹确认方式和纸样追溯信息。
- French-link crossed工单增加逐帖落座、网格连续、后封板连接、末帖内收线与剪尾QC。
### v3.12 工业设备参数选择
- 平装、骑马订、锁线、精装压书和Wire-O任务优先读取 `external_profiles_v312.json`。
- 没有精确机器型号时只能展示候选设备能力，不把某台机器的上限/温度/压力写入工单默认值。
- 有设备型号后仍要求本店设备状态/耗材/纸张首件验证。
## v3.16 长尾Method规划
新增20个Method-specific Workflow。若只有结构证据而没有数值证据，允许reference planning，但production模式仍受Contract/Production Readiness Gate阻断。
### v3.17 数值证据调用
Planner读取Method Contract时同时显示 `numeric_evidence_status`。外部数值证据只能在匹配 source/equipment/product/standard 上下文下作为参考；只有显式公式的Method要求用户提供公式输入；22个未解决Method生产模式禁止补猜数值。

