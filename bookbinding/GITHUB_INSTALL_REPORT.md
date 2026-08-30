# Henghua BookBinding GitHub Install Report

## Installed
- Repository: `HHQC-369/codex-video-skills`
- Branch: `main`
- Skill: `HenghuaBookBindingExpert`
- Version: `3.19.0`
- Factory level: `L24`
- Version archive: `bookbinding/HenghuaBookBindingExpert/v3.19.0/`
- **唯一正式 Skill 入口:** `skills/bookbinding/SKILL.md`
- Factory docs: `skills/bookbinding/factory/v3.19.0/`
- Validator: `skills/bookbinding/validation/v1.15.0/`
- Installer: `skills/bookbinding/tools/install-henghua-bookbinding.ps1`

## Deduplication status
- Duplicate Skill identity `HenghuaBookBindingExpert` was found at both the live router and Factory version path.
- `skills/bookbinding/factory/v3.19.0/SKILL.md` has been deleted.
- Its latest v3.19.0 evidence boundaries and release information were merged into `skills/bookbinding/SKILL.md`.
- The 32 files under `bookbinding/HenghuaBookBindingExpert/v3.19.0/skills/` are **not duplicates**: they have separate professional responsibilities and unique Skill names, so all are retained.
- No older BookBinding version directory is present in the current repository tree.

## Installed source layer
- 32/32 latest professional sub Skill definitions are retained under the version archive.
- Shared policy is stored at `bookbinding/HenghuaBookBindingExpert/v3.19.0/skills/_shared/CORE_POLICY.md`.
- Repository manifest registers 105 binding methods, 961 sourced technical parameters and 134 sources for v3.19.0.

## Release hashes
- Source package SHA256: `40558bf425df1d179d39592705354633ef781d29b5758b746313b3780595f1bf`
- Installable package SHA256: `9481e76a7c53d7165eee19007afd628d58b68ca6c788ac29fe344577d6651b00`
- Validation Center SHA256: `e3019ab560ad9637327203b709a13f9e2bd3128997af9d8c7a758e7560ca28c1`

## Upgrade rule
Do not create a second Skill entry with the same `name`. New optimization work should be committed into a new version archive (for example `v3.20.0/`), while the single canonical entry remains `skills/bookbinding/SKILL.md`. Only after validation should `CURRENT_VERSION.md`, the canonical entry and `manifest.json` advance together.

## Production truth boundary
GitHub/reference evidence must never silently become production defaults. Current real production promotion continues through `shop_verified -> equipment_verified -> production_verified`.
