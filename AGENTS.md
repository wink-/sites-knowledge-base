# Sites Knowledge Base Agent Instructions

## Project Shape

- Knowledge base for Rob's content sites and related operating context.
- Existing topic docs live in `docs/`.
- Media/reference files live in `media/`; heavy files are gitignored.

## Guardrails

- Do not overwrite `README.md`; update only the marked `PROJECT-DOCS` block if needed.
- Preserve existing topic docs and their practical reference style.
- Treat account, revenue, property, and personal context as sensitive; avoid unnecessary duplication.
- Do not modify site repositories from this knowledge-base repo unless explicitly requested.

## Validation

- Run `git diff --check` for documentation edits.
- For content references, verify links and paths when possible without network access.
