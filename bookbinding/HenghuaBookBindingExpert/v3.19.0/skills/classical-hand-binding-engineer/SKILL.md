---
name: classical-hand-binding-engineer
description: 古典手工装帧工程专家：工具、锁线、扒圆起脊、布面/皮面/纸面、环衬与保存性胶粘。
version: 3.19.0
language: zh-CN
---

# 欧洲古典手工装帧

## 专属职责
- 只负责：**欧洲古典手工装帧**。
- 跨领域项交给 Orchestrator/对应子 Skill，不在本 Skill 内复制其它岗位逻辑。
- 共用事实边界见 `../_shared/CORE_POLICY.md`。

## 触发条件
- 半皮面古典装帧怎么做
- 扒圆起脊流程

## 必要输入
- 书帖/书芯
- 布/皮/纸面
- 锁线/扒圆起脊
- 保存性目标

## 专业执行SOP
1. 识别古典流程scope
2. 按材料选择对应workflow
3. 引用来源参数
4. 把现代生产要求另列验证

## 专属硬停止条件
- 古典尺寸不得视为现代量产标准
- 保存性胶料与现代高速生产胶料不得混用

## 专属资源
- `../../knowledge/covering_styles.json`
- `../../knowledge/manual_tools.json`
- `../../knowledge/process_templates.json`

## 输出字段
- `classical_workflow`
- `materials`
- `source_parameters`
- `conservation_notes`

## 完成前自检
- [ ] 是否只在“欧洲古典手工装帧”职责范围内下结论？
- [ ] 是否明确区分来源事实、归一化/推导、生产验证值？
- [ ] 是否检查了本 Skill 的专属硬停止条件？
- [ ] 若参数冲突，是否避免平均并保留 source/page/scope？
- [ ] 是否给出会改变结论的缺失字段/阻断项？


## v3.4 视频增强：皮面重装与金箔
- 皮革覆盖顺序补充：模板预裁→包边/角/书槽区削薄→上胶/糊→趁湿包覆→凸脊/书槽塑形→包边转角→板内填平。
- 金饰顺序补充：图案转印/盲压定位→GLAIR处理→铺金箔→图纹压印→去除多余金箔→复核连续性。
- 视频只确认 `GLAIR` 被使用，未给配方、浓度和工具温度；这些必须保留为未知，禁止经验补值。
- 专属资源：`../../knowledge/video_technical_parameters.json`、`../../knowledge/video_workflows.json`。


## v3.5 Springback 手工工艺边界
- Springback 书背组件使用圆柱 former 成形；视频结尾展示多规格 former，因此禁止给单一“标准直径”。
- 皮革包覆中的局部削薄、书帽塑形、内板填平可作为工序证据；厚度/胶种/定型时间需独立验证。

## v3.7 扒圆/起脊与来源冲突
- 新增来源同时支持“渐进、左右交替、保持天头地脚平整”的扒圆/起脊动作序列；锤击力度仍为人工技能变量，不生成数值。
- 传统古典来源的书肩目标与非常规教程约45°扇形不可合并为一个标准角度；输出时必须携带 `source_id/scope`。
- Springback Visitors Book 第1部补齐书帖准备、扁带锁线、书芯扒圆/起脊；与第2/3部共同形成同一 series，不新增重复 method。
- 视频里可见的带子数量、锯槽间距、板厚若无清晰量尺证据，只能作为样本观察或进入 quarantine。

