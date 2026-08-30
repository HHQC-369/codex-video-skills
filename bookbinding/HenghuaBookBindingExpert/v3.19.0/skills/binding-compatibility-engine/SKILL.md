---
name: binding-compatibility-engine
description: 检查纸张/表面类别、胶种与真实设备画像；没有可靠参数时输出验证要求而不是猜测。
version: 3.19.0
language: zh-CN
---

# 材料/设备兼容性判定

## 专属职责
- 只负责：**材料/设备兼容性判定**。
- 跨领域项交给 Orchestrator/对应子 Skill，不在本 Skill 内复制其它岗位逻辑。
- 共用事实边界见 `../_shared/CORE_POLICY.md`。

## 触发条件
- 157g铜版纸和PUR是否兼容
- 这台设备能否做这个书厚

## 必要输入
- 纸张/材料
- 胶种或连接件
- 候选工艺
- 真实设备画像

## 专业执行SOP
1. 先分离材料兼容与设备能力
2. 读取compatibility_matrix与adhesives
3. 把未知设备参数标成未验证
4. 给出blocked/verify/candidate而非绝对可做

## 专属硬停止条件
- 无真实设备极限不得声称量产可做
- 未知胶粘兼容不得用经验替代实测

## 专属资源
- `../../knowledge/compatibility_matrix.json`
- `../../knowledge/adhesives.json`
- `../../scripts/compatibility_check.py`

## 输出字段
- `兼容结论`
- `证据`
- `需验证项`

## 完成前自检
- [ ] 是否只在“材料/设备兼容性判定”职责范围内下结论？
- [ ] 是否明确区分来源事实、归一化/推导、生产验证值？
- [ ] 是否检查了本 Skill 的专属硬停止条件？
- [ ] 若参数冲突，是否避免平均并保留 source/page/scope？
- [ ] 是否给出会改变结论的缺失字段/阻断项？
