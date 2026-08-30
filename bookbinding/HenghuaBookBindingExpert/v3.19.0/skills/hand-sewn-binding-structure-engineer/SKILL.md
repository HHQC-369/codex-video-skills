---
name: hand-sewn-binding-structure-engineer
description: 手缝装帧结构工程师：科普特、扣眼、交叉式、秘密比利时、长针脚、中式线装、骑马手缝等；按连接机理而非外观归类。
version: 3.19.0
language: zh-CN
---

# 手缝结构机理/孔位/线长

## 专属职责
- 只负责：**手缝结构机理/孔位/线长**。
- 跨领域项交给 Orchestrator/对应子 Skill，不在本 Skill 内复制其它岗位逻辑。
- 共用事实边界见 `../_shared/CORE_POLICY.md`。

## 触发条件
- 科普特装订孔位和流程
- 秘密比利时装订怎么走线

## 必要输入
- 书帖数
- 封板/封皮结构
- 孔位/线材
- 目标结构

## 专业执行SOP
1. 按连接机理选canonical method
2. 读取method scope参数
3. 解析孔位/线长
4. 用WF-hand-sewn生成白样工序

## 专属硬停止条件
- 科普特/长针脚/比利时/裸脊不得混成一个结构
- 多个教程参数不得平均

## 专属资源
- `../../knowledge/binding_methods.json`
- `../../knowledge/technical_parameters.json`
- `../../knowledge/thread_materials.json`
- `../../knowledge/process_templates.json`

## 输出字段
- `canonical_method`
- `hole_thread_reference`
- `workflow`
- `sample_required`

## 完成前自检
- [ ] 是否只在“手缝结构机理/孔位/线长”职责范围内下结论？
- [ ] 是否明确区分来源事实、归一化/推导、生产验证值？
- [ ] 是否检查了本 Skill 的专属硬停止条件？
- [ ] 若参数冲突，是否避免平均并保留 source/page/scope？
- [ ] 是否给出会改变结论的缺失字段/阻断项？

## v3.3 GitHub 手缝模板增强
- 可读取FI-127中 sewing stations、kettle inset、support width、Coptic board-hole、longstitch slit、stab孔位字段作为“可参数化输入模板”。
- 默认数字只作为开源工作台示例；具体孔位与线径仍按书高、纸帖、结构和白样确认。


## v3.5 Sewn Board 结构边界
- `sewn-board-binding` 的 guard/flange 是承力结构，必须在锁线阶段参与连接。
- 孔距、guard宽度、线长未在视频中可靠量化时保持 unknown；正式制作前白样。
- 书芯完成并裁切后，再按真实尺寸匹配纸板。

## v3.6 三孔与中式纹样拓扑
- 新增 `three-hole-side-stitch`，仅把视频可确认的3孔、线材对折、中孔区域收结写入结构；孔距/孔径/线长保持unknown。
- 中式纹样使用 `chinese_stab_patterns.json` 的 `physical_hole_count/base_holes/auxiliary_holes/start_hole/path_variants`，不要从“目数”猜孔数。
- 龟甲（一/二/三）是同一canonical method的三条针路variant，不新增3个装订method。

## v3.8 法式勾线/科普特混合针路
- 必须区分 `french-link-stitch-binding` 与历史“真法式装订/仿法式装订”。
- 科普特+法式勾线的交叉款、不交叉款、新中式款属于 `coptic-binding` 的 stitch variant，不新建重复方法。
- 读取 `knowledge/french_link_stitch_patterns.json`；任何 3/2/4.5、3/2/4、3/2/1 cm 等分段只能在对应来源/variant 上下文使用。
- 孔位、线长、线径、起针线尾均需标注 source scope；无上下文时禁止跨教程借值。
- 交叉款 QC：相邻勾线组交叉关系/网格方向连续；不交叉款 QC：各组保持分离，不得误跨组。
### v3.9 科普特 / French Link 共用打孔与针路边界
- 基础科普特来源明确6孔、3m DMC、约5cm线尾，但均为样例值，不能跨开本/帖数直接复用。
- 不交叉混合款来源明确A5、3m DMC、约5cm线尾并从封面最右孔起针，仅限该来源variant。
- 所有科普特/French Link在打孔前先建立共同孔位模板、左右余量QC；纪录片所说“适当拉紧”不得换算为固定张力。
- 上传文件名与视频内部标题冲突时，以内部标题/材料卡/动作证据为准。

### v3.10 交叉纪录片与手缝操作QC
- `法式勾线-交叉款-纪录片`只作为 `coptic-fl-cross-v38` 的视觉互证；详细孔距/线长仍引用第二期来源，纪录片不得制造第二套数字。
- 缝线拉紧优先沿书背/折口方向，避免向纸面外侧横拉导致孔边撕裂；张力仍为定性适度，不换算固定N值。
- 缝合后、书背上胶前可检查并温和闭合过大的锥孔，使纸纤维围绕线迹重新就位；不得压断线或压塌折口。
## v3.11 交叉款连续缝制深度流程
- 前封板+首帖起始 → 封板边缘锚固 → 对应孔站 → 与前一帖链接并跨向相邻勾线组 → 每站回拉 → 新帖落座 → 重复。
- 最后一帖后连接后封板；末帖内完成收线固定，确认后再剪尾。
- 交叉网格必须连续；局部突然变成non-cross属于针路错误，先回查上一帖。

