---
name: protective-packaging-envelope
description: 处理书籍函套、册页保护套与14类信封的用途匹配、基础尺寸采集和风险检查。
version: 3.19.0
language: zh-CN
---

# 函套/信封/书套保护包装

## 专属职责
- 只负责：**函套/信封/书套保护包装**。
- 跨领域项交给 Orchestrator/对应子 Skill，不在本 Skill 内复制其它岗位逻辑。
- 共用事实边界见 `../_shared/CORE_POLICY.md`。

## 触发条件
- 给精装书做函套
- 书籍运输保护包装

## 必要输入
- 成书尺寸
- 保护等级
- 取放/运输要求

## 专业执行SOP
1. 选函套/信封/书套类别
2. 检查内装尺寸关系
3. 规划材料与折叠
4. 要求实物装入测试

## 专属硬停止条件
- 未实测成品不得定死包装内尺寸
- 包装结构不得混同装订结构

## 专属资源
- `../../knowledge/envelope_types.json`
- `../../knowledge/enclosure_structures.json`

## 输出字段
- `package_type`
- `fit_checks`
- `materials`

## 完成前自检
- [ ] 是否只在“函套/信封/书套保护包装”职责范围内下结论？
- [ ] 是否明确区分来源事实、归一化/推导、生产验证值？
- [ ] 是否检查了本 Skill 的专属硬停止条件？
- [ ] 若参数冲突，是否避免平均并保留 source/page/scope？
- [ ] 是否给出会改变结论的缺失字段/阻断项？
