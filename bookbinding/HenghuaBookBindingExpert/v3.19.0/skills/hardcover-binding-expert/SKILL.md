---
name: hardcover-binding-expert
description: 处理精装、封壳、书槽、环衬、飘口、柔背/圆背/平脊/瑞士装等结构选择与生产检查。
version: 3.19.0
language: zh-CN
---

# 精装结构/封壳/开合

## 专属职责
- 只负责：**精装结构/封壳/开合**。
- 跨领域项交给 Orchestrator/对应子 Skill，不在本 Skill 内复制其它岗位逻辑。
- 共用事实边界见 `../_shared/CORE_POLICY.md`。

## 触发条件
- 3mm灰板精装壳板间隙
- 蝴蝶装相册结构

## 必要输入
- 书芯厚度
- 板材/包面
- 开合要求
- 精装变体

## 专业执行SOP
1. 区分平背/圆背/柔背/瑞士/蝴蝶等
2. 计算需确认的壳芯关系
3. 调用case参数冲突解析
4. 检查书槽/环衬/压合

## 专属硬停止条件
- 壳板间隙冲突不得平均
- 精装总类不得替代具体变体参数

## 专属资源
- `../../knowledge/book_structure.json`
- `../../knowledge/parameter_conflicts.json`
- `../../scripts/technical_parameter_resolver.py`

## 输出字段
- `hardcover_variant`
- `case_requirements`
- `risks`
- `sampling`

## 完成前自检
- [ ] 是否只在“精装结构/封壳/开合”职责范围内下结论？
- [ ] 是否明确区分来源事实、归一化/推导、生产验证值？
- [ ] 是否检查了本 Skill 的专属硬停止条件？
- [ ] 若参数冲突，是否避免平均并保留 source/page/scope？
- [ ] 是否给出会改变结论的缺失字段/阻断项？

## v3.3 GitHub 壳板几何增强
- 可引用FI-127公式：`boardH=pageH+2*square`、`boardW=pageW+square-joint`、`clothW=2*boardW+inlayW+2*joint+2*turnIn`。
- 这些属于bench arithmetic；board/square/joint/turn-in不得使用GitHub默认直接量产，必须用门店白样/设备/材料验证值覆盖。
- 圆背时中径应按弧长而非平弦计算；书肩目标应与灰板厚度匹配。


## v3.5 Springback / Sewn Board 专项
- `springback-binding`：先成形并稳定弹性书背，再按实际书芯/书背匹配纸板；former直径、材料厚度、压制时长必须实测/白样。
- `sewn-board-binding`：纸板通过已参与锁线的 attachment guard/flange 连接，不得按普通 case-in 精装解释。
- 布脊/皮脊仅是 Sewn Board 覆盖变体。

## v3.6 快速数码硬壳精装视频系列
- `quickprint-hardcase` 是生产workflow variant，不是新的装订机理。
- 视频样例出现A4、10mm样例书脊、10mm壳板间隔、30mm包边、约200gsm首尾补强纸、10mm折口和10mm双面胶；全部保留在 `video_hardcase_quickprint_reference` scope，禁止作为所有精装默认。
- 3mm灰板/3mm切角与既有参数重复，仅追加视频互证，不复制参数。
- 全幅胶材贴衬后必须检查并清除外露/多余胶，防止边缘粘连和局部堆厚。

## v3.7 圆背/非常规圆背参数边界
- `round-spine-case` 的经典起脊书肩与 `pdf_nonstandard_roundback_reference` 的约45°扇形必须视为不同 conflict variants；**禁止平均、禁止互相覆盖**。
- 非常规PDF里的 3mm灰板→4mm起脊定位、20mm包边、a/b/c尺寸链均只在该来源结构/复刻上下文中可选。
- 圆背壳尺寸应在扒圆/起脊完成后按实际书背弧长、书芯高度与书口侧尺寸复核，不能只靠平背公式提前切死。
- 支撑带穿壳槽结构与普通 case-in 精装不同，预检时必须确认布带通道、转折区和环衬贴合。
### v3.12 工业精装设备参考
Schmedt PräDeka/PräForm参数仅用于匹配对应设备的板厚、书壳范围、压力与压制时间。传统手工精装和其他设备不得直接套用。
### v3.15 四书蒸馏：精装本地标准证据
- 新增精装封面材料/灰板来源表、8–10mm joint本地参考、45°角部预切和A4制壳样例。
- 这些值与已有视频/厂商资料可能冲突，必须按source scope保留，禁止平均成“统一精装标准”。
- 蝴蝶装新增纸张页数参考、三边对齐±1mm来源QC和书厚分档书壳误差参考。
## v3.16 Method Gap Closure
Hardcover长尾Method现在全部至少有一个来源化结构参数；结构证据不等于数值工艺窗口。对仍处于 `numeric_evidence_unresolved` 的Method，生产计划必须等待真实材料/设备/白样数值。
## v3.18 原书数值补证
对折装订、平摊精装、单张纸包折封面精装、观音装订新增《装订图鉴》明确数值。日文kg纸张基重保持原单位，禁止无基础尺寸时自动换算gsm；所有数值仍为source-scoped reference。

