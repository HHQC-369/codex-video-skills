# Henghua BookBinding GitHub Install Report

## Installed
- Repository: `HHQC-369/codex-video-skills`
- Branch: `main`
- Skill: `HenghuaBookBindingExpert`
- Version: `3.19.0`
- Factory level: `L24`
- Version archive: `bookbinding/HenghuaBookBindingExpert/v3.19.0/`
- Live router: `skills/bookbinding/SKILL.md`
- Factory entry: `skills/bookbinding/factory/v3.19.0/`
- Validator: `skills/bookbinding/validation/v1.15.0/`
- Installer: `skills/bookbinding/tools/install-henghua-bookbinding.ps1`

## Installed source layer
- 32/32 sub Skill definitions are stored under the version archive.
- Shared policy is stored at `skills/_shared/CORE_POLICY.md` inside the version archive.
- Repository manifest registers 105 binding methods, 961 sourced technical parameters and 134 sources for v3.19.0.

## Release hashes
- Source package SHA256: `40558bf425df1d179d39592705354633ef781d29b5758b746313b3780595f1bf`
- Installable package SHA256: `9481e76a7c53d7165eee19007afd628d58b68ca6c788ac29fe344577d6651b00`
- Validation Center SHA256: `e3019ab560ad9637327203b709a13f9e2bd3128997af9d8c7a758e7560ca28c1`

## Upgrade rule
Do not overwrite v3.19.0. New optimization work should be committed into a new version directory and only then should `CURRENT_VERSION.md` and `manifest.json` be advanced.

## Production truth boundary
GitHub/reference evidence must never silently become production defaults. Current real production promotion continues through `shop_verified -> equipment_verified -> production_verified`.
