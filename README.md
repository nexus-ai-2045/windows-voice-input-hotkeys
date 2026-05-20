# Windows Voice Input Hotkeys

Small AutoHotkey scripts for faster voice input on Windows.

This repository has two workflows:

- `voice-dictation-hotkey.ahk`: a tiny AutoHotkey v2 shortcut for Windows voice typing.
- `codex_voice_input.ahk`: an AutoHotkey v1 bridge that captures Windows voice typing, asks Codex to polish the text, then pastes the cleaned result back into the original app.

## Simple Windows Voice Typing

Install AutoHotkey v2, then run:

```text
scripts\voice-dictation-hotkey.ahk
```

Shortcut:

```text
Ctrl + Alt + Space
```

This sends `Win + H`, which starts or toggles Windows voice typing in the active text field.

## Codex-Polished Voice Input

Install:

- AutoHotkey v1.1
- Codex CLI available as `codex`
- Windows voice typing enabled

Then run:

```text
scripts\codex_voice_input.ahk
```

Shortcuts:

- Hold `Right Alt`: dictate while held, release to polish and paste.
- Double-tap `Right Alt`: start hands-free dictation.
- Press `Right Alt` again in hands-free mode: finish, polish, and paste.
- `Ctrl + Alt + Space`: open the temporary dictation pad.

The script opens a small temporary text box, starts Windows voice typing, sends the dictated text to `codex exec`, and pastes the polished text into the app that was active before dictation started.

## Notes

- The simple hotkey script uses AutoHotkey v2 syntax.
- The Codex bridge uses AutoHotkey v1 syntax.
- Temporary files are written under `%TEMP%\codex-voice-input`.
- No API key is stored in this repository. The Codex bridge relies on your local Codex CLI authentication.

## License

MIT
