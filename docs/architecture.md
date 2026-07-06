---
type: Architecture
title: Architecture
description: Repository shape and knowledge flow for Sites Knowledge Base.
tags: [architecture, knowledge-base, content-sites]
timestamp: 2026-07-06T00:00:00Z
---

# Architecture

## Runtime Shape

- Documentation-only knowledge base; no build system or application runtime is present.
- Content site source repositories are referenced from the README but are not embedded here.
- `media/` stores local reference material for content creation.

## Key Areas

| Path | Role |
| --- | --- |
| `README.md` | Site directory, deployment context, and editing overview. |
| `docs/accounts.md` | Account and hosting reference. |
| `docs/common-tasks.md` | Recurring operational workflows. |
| `docs/publishing-log.md` | Publishing history. |
| `docs/revenue-targets.md` | Monetization goals/status. |
| `docs/property.md`, `docs/garden.md`, `docs/fruit-trees.md`, `docs/solar-array.md` | Personal/property source material for site content. |
| `media/` | Local PDFs, photos, inspiration, and reference assets. |

## Data Flow

Agents and editors use this repo for context, then make content changes in the relevant site repository or CMS. Cloudflare Pages deploys the individual sites after their own repositories change.
