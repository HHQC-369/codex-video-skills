---
name: chengfeng-videocut-bundle-router
description: Route Chinese talking-head editing, subtitles, visuals, export, update checking, and related Codex video-cutting workflows to the chengfeng-videocut Marketplace plugin.
---

# chengfeng-videocut Router

Upstream: https://github.com/Agentchengfeng/chengfeng-videocut-skills

## Important architecture rule
The upstream project is a Codex Marketplace Plugin, not a single standalone SKILL.md.

Its business entries include:
- chengfeng-cut
- chengfeng-subtitle
- chengfeng-visual
- chengfeng-export
- chengfeng-report-bug
- chengfeng-check-updates

## Installation
Follow the CURRENT upstream README Marketplace installation procedure. Do not replace the product runtime with a hand-written local mock.

## Platform
Upstream documents Windows 10/11 and macOS support, with additional Runtime/Node/Chrome requirements.

## Boundary
This router intentionally does not duplicate the upstream plugin runtime. Pull the full repository and install it via Codex Marketplace.
