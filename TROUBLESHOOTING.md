# Troubleshooting

## Windows voice typing does not start

- Put the cursor in a normal text field before pressing the shortcut.
- Press `Win + H` manually once to confirm Windows voice typing works outside this script.
- Check Windows microphone permissions.
- Restart the AutoHotkey script after changing keyboard or microphone settings.

## `Ctrl + Alt + Space` conflicts with another app

Copy:

```text
scripts\voice-dictation-hotkey.ini.example
```

to:

```text
scripts\voice-dictation-hotkey.ini
```

Then edit:

```ini
VoiceTypingHotkey=^!Space
```

For example:

```ini
VoiceTypingHotkey=CapsLock
```

## Mouse-wheel double click already starts dictation

Mouse-wheel double click is supported by default.

To tune or disable it, edit the relevant local `.ini` file:

```ini
EnableMouseWheelDoubleClick=1
MouseWheelDoubleClickMs=350
```

Set `EnableMouseWheelDoubleClick=0` to disable it.

The normal middle-click is passed through, but some apps may still respond to the double middle-click before dictation starts. If that is a problem, disable the built-in mapping and use mouse software to send `Ctrl + Alt + Space` instead.

## Codex polishing does not run

- Confirm `codex` is available in PowerShell:

```powershell
codex --version
```

- Confirm the Codex CLI is already authenticated.
- Run `scripts\codex_text_polish.ps1` manually with a small UTF-8 text file.
- If PowerShell blocks the script, run from a trusted checkout and use a process-scoped execution policy:

```powershell
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
```

## Text is pasted into the wrong app

- Wait until the dictation pad appears before speaking.
- Avoid switching windows while dictation is active.
- If focus restoration is unreliable in a specific app, use the simple `Win + H` workflow instead.

## Japanese text becomes garbled

- Keep input files as UTF-8.
- Use a recent PowerShell version.
- Avoid editing scripts in tools that silently change file encoding.
