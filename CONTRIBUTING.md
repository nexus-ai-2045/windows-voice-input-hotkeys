# Contributing

Thanks for helping improve Windows Voice Input Hotkeys.

## Good contributions

- Fixes for AutoHotkey v1 or v2 compatibility.
- Clearer setup instructions.
- Safer defaults around clipboard, temporary files, or Codex invocation.
- Troubleshooting notes for Windows voice typing.
- Small workflow improvements that keep the project easy to understand.

## Keep this repository generic

Please avoid adding:

- Personal file paths.
- Machine-specific device names.
- Screenshots containing private content.
- API keys, tokens, logs, or transcripts.
- Large binaries or generated media.

## Development notes

- `scripts\voice-dictation-hotkey.ahk` uses AutoHotkey v2.
- `scripts\codex_voice_input.ahk` uses AutoHotkey v1.
- `scripts\codex_text_polish.ps1` expects the `codex` command to be available.

Before opening a pull request, test the script you changed on Windows and update the README if the user-facing behavior changed.
