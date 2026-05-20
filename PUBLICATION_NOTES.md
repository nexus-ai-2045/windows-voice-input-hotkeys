# Publication Notes

## Repository unit

This is a good standalone repository because it has one clear purpose:

> Faster voice input on Windows, with an optional Codex polishing workflow.

## Cleaned before publishing

- Removed local microphone device names.
- Removed personal Dropbox paths.
- Avoided storing API keys or tokens.
- Kept temporary output under `%TEMP%`.

## Suggested GitHub settings

- Visibility: private first
- Topics: `windows`, `autohotkey`, `voice-input`, `dictation`, `codex`
- Description: `AutoHotkey shortcuts for Windows voice typing and Codex-polished dictation.`

## Remaining manual check

- Confirm you are comfortable publishing under the MIT license.
- Confirm the Codex CLI command works on the target Windows machine.
- Decide later whether to make the repository public after private testing.

## Open source readiness

- `OPEN_SOURCE_CHECKLIST.md` now tracks the public-release gate.
- `SECURITY.md` explains sensitive dictation risks and security reporting.
- `CONTRIBUTING.md` explains what changes belong here and what must stay out.
- README now links to the public-release checklist and privacy notes.
