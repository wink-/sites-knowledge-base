# Sites Knowledge Base Agent Instructions

## Project Shape

- Knowledge base for Rob's content sites and related operating context.
- Existing topic docs live in `docs/`.
- Media/reference files live in `media/`; heavy files are gitignored.

## Commands

- Validate docs edits: `git diff --check`.
- Check current state: `git status --short --branch`.
- For site builds, use the target site repository instructions rather than this knowledge-base repo.

## Guardrails

- Do not overwrite `README.md`; update only the marked `PROJECT-DOCS` block if needed.
- Preserve existing topic docs and their practical reference style.
- Treat account, revenue, property, and personal context as sensitive; avoid unnecessary duplication.
- Do not modify site repositories from this knowledge-base repo unless explicitly requested.

## Validation

- Run `git diff --check` for documentation edits.
- For content references, verify links and paths when possible without network access.

## Docs Pointers

- Start with `docs/index.md` for progressive disclosure.
- Use `docs/architecture.md` for repository shape and knowledge flow.
- Use `docs/setup.md` for editing and validation notes.
- Preserve and consult topic docs such as `docs/accounts.md`, `docs/common-tasks.md`, `docs/publishing-log.md`, and `docs/revenue-targets.md`.
- Update `docs/status.md`, `docs/notes.md`, and `docs/log.md` when task state or durable context changes.
