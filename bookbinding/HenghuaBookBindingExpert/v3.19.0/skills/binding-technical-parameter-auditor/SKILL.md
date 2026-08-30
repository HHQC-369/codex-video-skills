---
name: binding-technical-parameter-auditor
description: 装帧技术参数审计：检查来源、重复合并、参数作用域、工业化误用和冲突。
version: 3.19.0
language: zh-CN
---

# 参数来源/作用域/冲突审计

## 专属职责
- 只负责：**参数来源/作用域/冲突审计**。
- 跨领域项交给 Orchestrator/对应子 Skill，不在本 Skill 内复制其它岗位逻辑。
- 共用事实边界见 `../_shared/CORE_POLICY.md`。

## 触发条件
- 3mm灰板壳板间隙用哪个参数
- 检查这个参数来源页

## 必要输入
- 参数名/ID
- method/scope
- 生产用途

## 专业执行SOP
1. 检索来源与页码
2. 读取applicability
3. 进入conflict group
4. 只在上下文唯一时选择参考variant

## 专属硬停止条件
- 冲突值禁止平均
- source_supported不得冒充production_verified

## 专属资源
- `../../knowledge/technical_parameters.json`
- `../../knowledge/parameter_conflicts.json`
- `../../scripts/technical_parameter_resolver.py`

## 输出字段
- `candidates`
- `conflict_status`
- `source/page`
- `release_blocker`

## 完成前自检
- [ ] 是否只在“参数来源/作用域/冲突审计”职责范围内下结论？
- [ ] 是否明确区分来源事实、归一化/推导、生产验证值？
- [ ] 是否检查了本 Skill 的专属硬停止条件？
- [ ] 若参数冲突，是否避免平均并保留 source/page/scope？
- [ ] 是否给出会改变结论的缺失字段/阻断项？

## v3.3 GitHub 证据审计增强
- GitHub字段必须带 `repository/ref/source_locator`（通过source registry关联），禁止只保留裸数值。
- `github_implementation_default` / `github_bench_default` 永远不能自动升级为 `production_verified`。
- 开发中示例或硬编码经验常数进入 `github_parameter_quarantine.json`，不得混入生产参数解析器。


## v3.4 视频证据审计增强
- 视频数值必须同时带 `source_id + source_locator(timestamp) + scope`。
- 画面上的某一本书/某一个龙鳞样本尺寸默认 `sample-specific`，不得自动升级为通用 method 参数。
- 只能从画面可靠确认“使用了某材料/工具”时，不得进一步推断品牌、克重、浓度、温度或厚度。
- 无法可靠辨认的画面数字进入 `video_observation_quarantine.json`，不能进入 resolver。

## v3.7 PDF + 圆背视频证据审计
- PDF明确声明其方法“非常规/部分自创”，因此该PDF所有尺寸与45°角度默认属于 `pdf_nonstandard_roundback_reference`，不得提升为圆背通用标准。
- `roundback_shoulder_or_flare_angle` 同时保留经典约90°与非常规约45°来源变体；解析器必须返回 context-required 或精确命中，**永远不取均值**。
- 公式类参数（如 board thickness + 1mm、a/b/c派生尺寸）必须保留输入定义与来源页，不得只保留算出的裸数值。
- 三个新视频仅补充动作顺序/QC；不可从画面估算胶种、板厚、压机时间、锤击力或精确swell百分比。

## v3.8 参数边界
法式勾线视频参数均为教程作用域。禁止把 0.75/1.5 英寸、3/2/4.5 cm、3/2/4 cm、3/2/1 cm、3m 线长或 0.65mm 线宽升级为通用生产默认值。尤其禁止从交叉款向不交叉款借用分段和线材规格。
### v3.9 视频参数审计
- “36 sheets, 2 thick sheets”这类关系未明确的材料卡必须原样保留，禁止自动推导总量。
- A5、6孔、3m线、5cm线尾只在对应source/variant作用域生效。
- 文件名“交叉式”等描述不能覆盖视频内部正式标题和实际针路证据。
## v3.11 二次视频蒸馏审计
- SHA256完全相同的重复上传只登记为 `merged_duplicate`，不得增加source数量。
- “湿条变形”“适度拉紧”“替代压书”都属于定性实践，禁止生成卷曲角度、张力N值或压强。
- 纪录片只负责流程/QC；交叉款孔距和数值布局仍以明确字幕教程的source scope为准。
### v3.12 外部权威参数治理
- 参数来源优先级拆分：行业规范字段 > 厂商设备规格 > 胶黏剂产品TDS > GitHub实现 > 视频/教程。优先级表示证据类型，不表示可自动成为本门店生产默认值。
- `equipment_specific` 必须携带精确 `equipment_model`；`product_specific` 必须携带精确 `adhesive_product`。
- CIP4字段用于检查工单数据结构是否缺字段，不给出通用数值。
- GitHub代码若自带“broken/experimental”警告，必须进入 quarantine。
### v3.15 四书来源治理
- 2021/2022行业手册属于版本演进，同一事实只建一个canonical参数，旧版只做互证。
- 企业内部《各类精装装订标准》的数值统一标记为source-local reference；设备型号、胶产品或单位含糊时进入Quarantine。
- 任何来源表格不得因标题含“标准”就自动晋升为`production_verified`。
## v3.16 证据分层
必须区分 `direct structural evidence` 与 `numeric production evidence`。v3.16实现105/105结构直接证据覆盖，但43个原缺口Method仍登记 `numeric_evidence_unresolved`，不得据此宣称数值参数100%完整。
### v3.17 数值证据分层审计
- 区分 `external_numeric_evidence_added / derived_geometry_present / unresolved_after_v317_research`，不得把三者合并为“已解决”。
- 外部标准/馆藏规范、厂商设备能力、产品TDS、工作坊样例必须保留各自 scope；`production_verified=false` 时生产端继续阻断。
- 样例尺寸、产品规格和机构内部规范不得升级成跨设备/跨材料的恒华默认值。
## v3.18 原书单位保真
对于日本资料的纸张“kg”基重与原书印刷尺寸，优先保持原始单位/原始印刷值；若与通行标准存在疑点，标记source-printed anomaly，不得静默修正。

