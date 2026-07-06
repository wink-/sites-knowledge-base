---
type: Setup
title: Setup
description: Local editing and validation notes for Sites Knowledge Base.
tags: [setup, documentation]
timestamp: 2026-07-06T00:00:00Z
---

# Setup

## Requirements

- Markdown editor or text editor.
- Git.

## Editing

- Update topic docs in `docs/` directly.
- Put local reference files in the appropriate `media/` subdirectory.
- Make site code/content changes in the relevant site repo, not in this knowledge base, unless the file is reference-only.

## Validation

```bash
git status --short --branch
git diff --check
```

For site builds, use the build instructions in the target site repository.
