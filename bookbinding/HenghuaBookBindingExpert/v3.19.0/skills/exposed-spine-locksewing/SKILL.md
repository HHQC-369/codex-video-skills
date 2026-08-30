---
name: exposed-spine-locksewing
description: 解释并规划锁线、裸脊、纱布加固、缝线线迹及其质量检查。
version: 3.19.0
language: zh-CN
---

# 裸脊/外露书脊锁线

## 专属职责
- 只负责：**裸脊/外露书脊锁线**。
- 跨领域项交给 Orchestrator/对应子 Skill，不在本 Skill 内复制其它岗位逻辑。
- 共用事实边界见 `../_shared/CORE_POLICY.md`。

## 触发条件
- 裸脊锁线怎么做
- 外露书脊线迹怎么选

## 必要输入
- 书帖
- 线材
- 孔位
- 开合与外观要求

## 专业执行SOP
1. 确认是裸脊而非广义锁线书芯
2. 读取裸脊方法与线材
3. 规划孔位/走线
4. 检查外露书背磨损与线张力

## 专属硬停止条件
- “锁线装订”不得自动等同裸脊
- 无孔位来源不得编孔距

## 专属资源
- `../../knowledge/binding_methods.json`
- `../../knowledge/thread_materials.json`

## 输出字段
- `structure`
- `sewing_plan`
- `risks`
- `sampling`

## 完成前自检
- [ ] 是否只在“裸脊/外露书脊锁线”职责范围内下结论？
- [ ] 是否明确区分来源事实、归一化/推导、生产验证值？
- [ ] 是否检查了本 Skill 的专属硬停止条件？
- [ ] 若参数冲突，是否避免平均并保留 source/page/scope？
- [ ] 是否给出会改变结论的缺失字段/阻断项？
