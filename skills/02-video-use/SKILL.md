---
name: video-use-bundle-router
description: Route conversational video-editing tasks to browser-use/video-use. Use for talking heads, tutorials, interviews, montages, filler removal, transcript-aware cuts, subtitles, grading, overlays, and final render verification.
---

# video-use Bundle Router

Upstream: https://github.com/browser-use/video-use

## Required workflow
1. Pull the upstream repository.
2. Read `install.md` first.
3. Read upstream `SKILL.md`.
4. Keep user footage outside the skill repository.
5. Follow the upstream confirm-before-cut workflow.

## Typical capabilities
- Word-boundary-aware cutting
- Filler/dead-space removal
- Subtitles
- Color grading
- Animation overlays
- Preview + self-evaluation
- Persistent project memory

## Common requirements
- Python
- ffmpeg + ffprobe
- ElevenLabs API Key
- Node.js when using HyperFrames/Remotion animation slots

## Boundary
Do not pretend this adapter contains the full editor runtime. Use `tools/pull-all-upstream.ps1` to retrieve the actual implementation.
