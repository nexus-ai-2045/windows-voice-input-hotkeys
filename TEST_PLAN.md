# Test Plan

Use this before making the repository public.

## Environment

- Windows 11
- AutoHotkey v2 for `scripts\voice-dictation-hotkey.ahk`
- AutoHotkey v1.1 for `scripts\codex_voice_input.ahk`
- Codex CLI available as `codex` for Codex-polished voice input
- Windows voice typing works when pressing `Win + H`

## Simple Windows Voice Typing

1. Run `scripts\voice-dictation-hotkey.ahk` with AutoHotkey v2.
2. Put the cursor in a normal text field.
3. Press `Ctrl + Alt + Space`.
4. Confirm Windows voice typing opens.
5. Press `Ctrl + Alt + Space` again.
6. Confirm Windows voice typing toggles or closes.
7. Double-click the mouse wheel.
8. Confirm Windows voice typing opens.
9. Confirm normal middle-click behavior still works in a browser tab.

## Simple Hotkey Configuration

1. Copy `scripts\voice-dictation-hotkey.ini.example` to `scripts\voice-dictation-hotkey.ini`.
2. Change `VoiceTypingHotkey` to a temporary test value, such as `F13` or `CapsLock`.
3. Restart `scripts\voice-dictation-hotkey.ahk`.
4. Confirm the new hotkey toggles Windows voice typing.
5. Set `EnableMouseWheelDoubleClick=0`.
6. Restart the script.
7. Confirm mouse-wheel double-click no longer opens Windows voice typing.

## Codex-Polished Voice Input

1. Confirm `codex --version` works in PowerShell.
2. Run `scripts\codex_voice_input.ahk` with AutoHotkey v1.1.
3. Put the cursor in a normal text field.
4. Hold `Right Alt`.
5. Confirm the temporary dictation pad opens and Windows voice typing starts.
6. Speak a short harmless test sentence.
7. Release `Right Alt`.
8. Confirm Codex polishes the text and pastes it into the original app.
9. Double-click the mouse wheel.
10. Confirm the temporary dictation pad opens.
11. Press `Right Alt`.
12. Confirm Codex polishes and pastes.

## Codex Hotkey Configuration

1. Copy `scripts\codex_voice_input.ini.example` to `scripts\codex_voice_input.ini`.
2. Change `PadHotkey` to a temporary test value, such as `F13`.
3. Restart `scripts\codex_voice_input.ahk`.
4. Confirm the new pad hotkey opens the temporary dictation pad.
5. Set `EnableMouseWheelDoubleClick=0`.
6. Restart the script.
7. Confirm mouse-wheel double-click no longer opens the temporary dictation pad.

## Privacy Check

- Do not dictate secrets, passwords, API keys, or private content during tests.
- Delete local `.ini` files if they contain personal preferences you do not want to keep.
- Confirm no generated `.ini`, `.txt`, `.wav`, or transcript files are staged in Git.

## Pass Criteria

- Both workflows start from documented default hotkeys.
- Mouse-wheel double-click works by default.
- Mouse-wheel double-click can be disabled from `.ini`.
- Primary hotkeys can be changed without editing scripts.
- Codex-polished workflow falls back to raw text if polishing fails.
- `git status --short --branch` is clean after testing.
