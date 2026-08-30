---
name: book-restoration-rebinding-engineer
description: 旧书修复与重新装订专家：拆解、页序保护、纸张修补、重新锁线、扒圆起脊、纸板/皮面重装与修复记录。
version: 3.19.0
language: zh-CN
---

# 旧书修复与重新装订

## 专属职责
- 负责旧书拆解、书帖/页片修复、重缝、书芯整形、重做书壳及修复过程证据管理。
- 保存性材料选择仍需与 `materials-adhesives` / `binding-material-behavior-engineer` 联动。
- 古典皮面覆盖与金箔装饰调用 `classical-hand-binding-engineer`。
- 共用事实边界见 `../_shared/CORE_POLICY.md`。

## 触发条件
- 旧书重新装订/旧书修复
- 拆开原书后重新锁线和做皮壳
- 原书掉页、书脊损坏但希望保留正文

## 必要输入
- 原书照片/结构与损坏位置
- 是否要求保存原书壳/题签/环衬/书口痕迹
- 纸张脆化、涂布、油墨水敏性等基本状态
- 修复目标：功能恢复 / 美观重装 / 收藏保存

## 专业执行SOP
1. 先记录原始结构、页序、书帖、缺损与需要保留的历史信息。
2. 评估纸张和油墨是否允许湿处理/热处理；不明确就阻断。
3. 受控拆壳、拆贴衬、清理旧书脊材料，始终保持页序/书帖身份。
4. 局部修补破损、折口和断裂双页；修补完成后再复帖/配帖。
5. 根据原结构和修复目标选择重缝方式；视频证据支持在缝书架上用多条扁平支撑重缝，但支撑数量不得泛化。
6. 重缝后压实书芯，再进行扒圆/起脊；书肩对称和书芯最终厚度必须实测。
7. 如需手缝花头带，在书芯整形后进行；芯线/线材规格必须另行确认。
8. 最终书芯定型后再裁/匹配纸板，之后进入支撑连接、书脊加固、包面和贴衬。
9. 若采用皮面金饰，转交古典皮面子流程；不得猜削皮厚度、GLAIR配方或工具温度。
10. 输出修复记录：拆解前后、替换材料、不可逆动作、未解决缺损、白样/首件结果。

## 专属硬停止条件
- 纸张/油墨耐湿性未知时，不得直接建议水洗、湿揭或大面积水基胶处理。
- 视频未提供的修补纸克重、胶浓度、皮革厚度、板厚、烫金温度不得补数字。
- 收藏级修复必须优先可逆性、相容性和最小干预，不得把“重装得更漂亮”自动等同于“保存性更好”。
- 拆解过程中发现页序/书帖身份无法确认时先停止并建立页序清单。

## 专属资源
- `../../knowledge/video_workflows.json`
- `../../knowledge/video_technical_parameters.json`
- `../../knowledge/technical_parameters.json`
- `../../knowledge/adhesives.json`
- `../../knowledge/grain_direction_rules.json`

## 输出字段
- `condition_before`
- `retain_original_elements`
- `disassembly_plan`
- `paper_repair_plan`
- `resewing_plan`
- `spine_shaping_plan`
- `case_rebuild_plan`
- `conservation_risks`
- `unknown_parameters`
- `recordkeeping`

## 完成前自检
- [ ] 是否记录原书结构和需要保留的原始信息？
- [ ] 是否区分“视频观察”与“材料/设备验证值”？
- [ ] 是否在湿处理、胶粘、削皮、金饰前检查材料相容性？
- [ ] 是否保持页序/书帖身份并避免不可逆误拆？
- [ ] 是否在最终书芯定型后才确定纸板/书壳尺寸？
- [ ] 是否列出所有未观察到而会改变结论的参数？
