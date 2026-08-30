---
name: binding-quality-troubleshooter
description: 根据掉页、裂胶、难平摊、书槽拉扯、爬移、线圈卡页、翘曲等症状生成排查树。
version: 3.19.0
language: zh-CN
---

# 装订故障树诊断

## 专属职责
- 只负责：**装订故障树诊断**。
- 跨领域项交给 Orchestrator/对应子 Skill，不在本 Skill 内复制其它岗位逻辑。
- 共用事实边界见 `../_shared/CORE_POLICY.md`。

## 触发条件
- 胶装掉页怎么排查
- 书脊开裂是什么原因

## 必要输入
- 症状
- 发生时间
- 位置分布
- 材料/设备/参数记录

## 专业执行SOP
1. 定位fault tree
2. 先问高区分度问题
3. 按原因树缩小
4. 给验证动作而非武断结论

## 专属硬停止条件
- 无证据不得归因单一原因
- 修复建议不得擅改设备危险参数

## 专属资源
- `../../knowledge/fault_trees.json`
- `../../scripts/diagnose_binding.py`

## 输出字段
- `fault`
- `likely_causes`
- `checks`
- `next_questions`

## 完成前自检
- [ ] 是否只在“装订故障树诊断”职责范围内下结论？
- [ ] 是否明确区分来源事实、归一化/推导、生产验证值？
- [ ] 是否检查了本 Skill 的专属硬停止条件？
- [ ] 若参数冲突，是否避免平均并保留 source/page/scope？
- [ ] 是否给出会改变结论的缺失字段/阻断项？
## v3.16 长尾Method诊断
新增25棵Method级Fault Tree，候选原因来自已有Method风险/结构证据；没有shop evidence时不得把候选原因表述为已确认根因。
## v3.18 数值诊断上下文
压纹式装订5–6mm压合线、毛边式8页折叠单元、180°开合等可作为诊断参照，但只有source scope匹配时才可引用，不能据此确认设备或门店量产能力。

