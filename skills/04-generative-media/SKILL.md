---
name: generative-media-bundle-router
description: Route generative image, video, audio, creative-ad, UGC, product-video, and multimodal workflow requests to SamurAIGPT/Generative-Media-Skills.
---

# Generative Media Skills Router

Upstream: https://github.com/SamurAIGPT/Generative-Media-Skills

## Architecture
The upstream project uses a Core/Library split:
- `core/`: low-level media/API primitives
- `library/`: expert skills and end-to-end recipes

## Use this when
- The workflow needs generated images/video/audio.
- A product ad, UGC asset, cinematic clip, social pack, logo/brand visual, or other media recipe is required.
- A media pipeline can benefit from structured CLI/MCP calls.

## Important
Many workflows delegate to `muapi-cli` and may require `MUAPI_API_KEY` and paid credits. Do not describe the entire upstream library as free.

## Boundary
Use `tools/pull-all-upstream.ps1` to retrieve the full library and follow its README.
