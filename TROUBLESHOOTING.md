# Troubleshooting

## Windows voice typing does not start

- Put the cursor in a normal text field before pressing the shortcut.
- Press `Win + H` manually once to confirm Windows voice typing works outside this script.
- Check Windows microphone permissions.
- Restart the AutoHotkey script after changing keyboard or microphone settings.

## `Ctrl + Alt + Space` conflicts with another app

Edit `scripts\voice-dictation-hotkey.ahk` and change the hotkey line:

```ahk
^!Space::Send "#h"
```

For example, `CapsLock` can be used instead:

```ahk
CapsLock::Send "#h"
```

## Mouse-wheel double click already starts dictation

Some mouse drivers and utilities can map wheel double-click to a keyboard shortcut such as `Ctrl + Alt + Space` or `Win + H`.

That is a good place to keep mouse-specific behavior because it avoids interfering with normal middle-click behavior in browsers, editors, and CAD-style tools.

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
