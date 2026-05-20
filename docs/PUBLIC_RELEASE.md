# Public Release Guide

This repository is intended to be private-first. Use this guide when deciding whether to make it public.

## 1. Run the local preflight

From the repository root:

```powershell
git status --short --branch
git log --oneline --decorate -5
rg -n -i "(sk-[A-Za-z0-9]|api[_-]?key|token|secret|password|passwd|authorization|bearer|client_secret|private_key|D:\\\\|Dropbox|OneDrive|Realtek|Steinberg|Yamaha|Waves)" .
```

Expected:

- Working tree is clean.
- Recent commits are intentional.
- Search results are only documentation that warns about sensitive data, not actual sensitive data.

## 2. Review included files

Every file should be useful outside one personal machine.

Keep:

- Generic scripts.
- Generic docs.
- Security and contribution guidance.
- Troubleshooting notes.

Remove before public:

- Private transcripts.
- Local logs.
- Screenshots with private content.
- Machine inventory.
- Device-specific personal configuration.
- Local-only filesystem paths.

## 3. Test the workflows

Test on Windows:

- Run `scripts\voice-dictation-hotkey.ahk` with AutoHotkey v2.
- Press `Ctrl + Alt + Space` in a text field.
- Run `scripts\codex_voice_input.ahk` with AutoHotkey v1.
- Confirm dictation opens, Codex polishing runs, and text returns to the original app.

Record any rough edges in `TROUBLESHOOTING.md` before public release.

## 4. Prepare GitHub settings

Recommended settings:

- Description: `AutoHotkey shortcuts for Windows voice typing and Codex-polished dictation.`
- Topics: `windows`, `autohotkey`, `voice-input`, `dictation`, `codex`
- Issues: enabled.
- Discussions: optional.
- Wiki: disabled unless needed.
- Security advisories: enabled if available.

## 5. Optional first release

After testing, create a lightweight release:

```powershell
git tag v0.1.0
git push origin v0.1.0
```

Use the release notes from `CHANGELOG.md`.

## 6. Change visibility

In GitHub:

1. Open repository settings.
2. Go to the danger zone.
3. Change visibility from private to public.
4. Re-read GitHub's warning before confirming.

After the change, open the public page in a private browser window and confirm the README gives enough context without relying on private knowledge.
