---
name: folding-imposition-booklets
description: 处理单折/三折/Z折/风琴折、一张纸8页/32面、三刀/五刀小册及页序检查。
version: 3.19.0
language: zh-CN
---

# 折页/拼版/单张成册

## 专属职责
- 只负责：**折页/拼版/单张成册**。
- 跨领域项交给 Orchestrator/对应子 Skill，不在本 Skill 内复制其它岗位逻辑。
- 共用事实边界见 `../_shared/CORE_POLICY.md`。

## 触发条件
- 一张纸8页怎么折
- 风琴折页序怎么排

## 必要输入
- 成品尺寸
- 页数
- 折型
- 印刷正反方向

## 专业执行SOP
1. 确定折型与页序
2. 先白纸折样
3. 计算/校验拼版逻辑
4. 检查裁切开口与方向

## 专属硬停止条件
- 未知印刷机拼版边距不得猜
- 复杂折页必须白样验证页序

## 专属资源
- `../../knowledge/folding_patterns.json`
- `../../knowledge/hybrid_binding_recipes.json`

## 输出字段
- `fold_sequence`
- `imposition_notes`
- `proof_checks`

## 完成前自检
- [ ] 是否只在“折页/拼版/单张成册”职责范围内下结论？
- [ ] 是否明确区分来源事实、归一化/推导、生产验证值？
- [ ] 是否检查了本 Skill 的专属硬停止条件？
- [ ] 若参数冲突，是否避免平均并保留 source/page/scope？
- [ ] 是否给出会改变结论的缺失字段/阻断项？

## v3.3 GitHub 拼版参数增强
- 使用 `../../knowledge/imposition_geometry.json` 校验 folio / quarto / octavo / sextodecimo 的折序、页数/印张与页序。
- 需要可计算页序时，优先调用 `../../scripts/imposition_calculator.py`，不要把一个仓库的固定lookup当作所有印机通用排版。
- 双面印刷必须先输出校准张；长边/短边翻转不可凭经验猜。
- push-out/creep 必须使用纸张实测caliper与白样标定后的retained fraction；裁前必须检查 `fore_trim >= pushout`。
- 风琴折胶口、十字标等GitHub默认只作为软件实现参考，生产值必须由实际结构/材料确认。

## v3.6 锁线拼版视频案例
- 视频明确案例：128P=16P×8；136P=16P×7+12P×2。
- 这证明“不同每帖页数组合”可以作为总页数匹配策略，但不是设备通用标准；正式生产必须结合纸厚、折帖能力、锁线设备与爬移/膨胀验证。
### v3.15 四书蒸馏：装订拼版
- 骑马订页数必须先满足4的倍数；封面和内页都必须检查裁切出血。
- PDF“拓宽/扩画布”不得移动原始页面内容。
- `2-1-4-3`反面映射只属于特定左右对开4面示例；实际生产必须先确认打印机翻转方式。
- 拼版软件UI步骤属于来源示例，核心验收是页码对、正反方向、装订边、折手和输出尺寸。

