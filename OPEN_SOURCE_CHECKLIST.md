# Open Source Checklist

Use this before changing the repository from private to public.

## Must be done before public release

- Confirm the repository contains no API keys, tokens, passwords, private keys, or credentials.
- Confirm the repository contains no local-only personal paths such as Dropbox, OneDrive, or machine-specific home directories.
- Confirm the repository contains no private screenshots, logs, transcripts, device inventories, or support dumps.
- Confirm the README clearly says what the project does, who it is for, and how to run it.
- Confirm the license is intentional. This repository currently uses MIT.
- Confirm security reporting instructions exist in `SECURITY.md`.
- Confirm contribution expectations exist in `CONTRIBUTING.md`.
- Confirm scripts do not run destructive commands or change system settings without making that behavior obvious.
- Test both documented workflows on a Windows machine.

## Nice to have before public release

- Add screenshots or a short GIF showing the dictation pad.
- Add a table of supported AutoHotkey versions.
- Add troubleshooting notes for Windows voice typing, Codex CLI auth, and PowerShell execution policy.
- Add a release tag such as `v0.1.0`.

## Public release settings

- Visibility: public only after the checks above pass.
- Description: `AutoHotkey shortcuts for Windows voice typing and Codex-polished dictation.`
- Topics: `windows`, `autohotkey`, `voice-input`, `dictation`, `codex`
- Features: issues enabled, discussions optional, wiki disabled unless needed.

## Public release decision

Before flipping visibility, answer these:

1. Would a stranger understand what this does from the README?
2. Would a stranger avoid leaking sensitive text after reading the privacy section?
3. Is every included file useful to someone outside this machine?
4. Is there anything here that would be uncomfortable if indexed by search engines?
