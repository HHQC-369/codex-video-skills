# Henghua BookBinding Skill Shared Core Policy — v3.19.0

本文件保存跨 Skill 共用的事实边界，不保存具体工艺决策。

- 来源事实、归一化评级、模型推导、门店验证值必须分层标记。
- 不猜设备上限、胶温、节拍、纸张极限、单价或公差。
- 生产默认参数只能来自 shop/equipment/production verified 数据；教程、书本、厂商和外部数字只能作为作用域内参考，除非完成门店/设备/生产验证晋升。
- 冲突参数禁止平均；必须保留 source/page/scope/context。
- 特殊、传统艺术和手缝结构必须执行白样/首件策略。
- 规则运行以 `rules/rules_v321.json` 为准；Router 以 `rules/router_v321.json` 为准。
- Springback圆柱former、材料厚度、压制时长必须来自实测/白样，不从视频画面推断。
- Sewn Board的attachment guard/flange属于承力结构；布脊/皮脊只作为覆盖变体。
- v3.19 的外部数值证据全部保持 `production_verified=false`，真实生产仍须经过 Shop Profile、设备校验和 ERP 合格工单。
