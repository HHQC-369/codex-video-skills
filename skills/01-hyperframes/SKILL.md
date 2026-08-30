---
name: hyperframes-bundle-router
description: Route video creation and motion-graphics tasks to the upstream HyperFrames skill set. Use for HTML/CSS/GSAP based deterministic video rendering, product promos, motion graphics, talking-head overlays, captions, music-driven clips, and general programmatic video.
---

# HyperFrames Bundle Router

Upstream: https://github.com/heygen-com/hyperframes

## Use this when
- The user wants a programmatic video, motion graphic, product launch clip, UI animation, kinetic typography, or rendered HTML/CSS animation.
- A downstream editing workflow needs generated overlay animations.
- Deterministic frame rendering is important.

## Preferred upstream installation
```bash
npx skills add heygen-com/hyperframes
```

Read the upstream `/hyperframes` router first. It decides which HyperFrames sub-skill to use.

## Requirements
- Node.js 22+
- FFmpeg

## Boundary
This file is an integration/router entry. The complete implementation is in the upstream repository; use `tools/pull-all-upstream.ps1` from this bundle to retrieve it.
