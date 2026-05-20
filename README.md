# Windows Voice Input Hotkeys

Small AutoHotkey scripts for faster voice input on Windows.

This repository has two workflows:

- `voice-dictation-hotkey.ahk`: a tiny AutoHotkey v2 shortcut for Windows voice typing.
- `codex_voice_input.ahk`: an AutoHotkey v1 bridge that captures Windows voice typing, asks Codex to polish the text, then pastes the cleaned result back into the original app.

## Status

This project is private-first while the workflow is being tested. See [OPEN_SOURCE_CHECKLIST.md](OPEN_SOURCE_CHECKLIST.md) before making the repository public.

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

## Privacy and Security

- Dictated text may be sent to your locally configured Codex CLI provider for polishing.
- Temporary text files are written under `%TEMP%\codex-voice-input`.
- Do not dictate secrets, passwords, private keys, or other sensitive data unless you are comfortable with your local Codex setup handling that text.
- This repository should not contain API keys, tokens, local machine inventories, private file paths, or device-specific personal configuration.

To report a security issue, see [SECURITY.md](SECURITY.md).

## Contributing

Small fixes and workflow notes are welcome. See [CONTRIBUTING.md](CONTRIBUTING.md).

## Notes

- The simple hotkey script uses AutoHotkey v2 syntax.
- The Codex bridge uses AutoHotkey v1 syntax.
- Temporary files are written under `%TEMP%\codex-voice-input`.
- No API key is stored in this repository. The Codex bridge relies on your local Codex CLI authentication.

## License

MIT
