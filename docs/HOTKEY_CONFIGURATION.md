# Hotkey Configuration

Hotkeys are configured with local `.ini` files next to each script. These files are ignored by Git, so your personal shortcuts stay local.

## Simple Windows voice typing

Copy:

```text
scripts\voice-dictation-hotkey.ini.example
```

to:

```text
scripts\voice-dictation-hotkey.ini
```

Example:

```ini
[Hotkeys]
VoiceTypingHotkey=^!Space
EnableMouseWheelDoubleClick=1
MouseWheelDoubleClickMs=350
```

## Codex-polished voice input

Copy:

```text
scripts\codex_voice_input.ini.example
```

to:

```text
scripts\codex_voice_input.ini
```

Example:

```ini
[Hotkeys]
HoldHotkey=RAlt
PadHotkey=^!Space
EnableMouseWheelDoubleClick=1
MouseWheelDoubleClickMs=350
```

## AutoHotkey symbols

Common modifier symbols:

```text
^  Ctrl
!  Alt
+  Shift
#  Windows key
```

Examples:

```text
^!Space     Ctrl + Alt + Space
#+Space     Windows + Shift + Space
CapsLock    Caps Lock
RAlt        Right Alt
F13         F13
```

## Mouse-wheel double click

Mouse-wheel double click is enabled by default:

```ini
EnableMouseWheelDoubleClick=1
MouseWheelDoubleClickMs=350
```

Set it to `0` to disable:

```ini
EnableMouseWheelDoubleClick=0
```

The scripts pass normal middle-click through to the active app. Some apps may still react to the two middle clicks before dictation starts; if that bothers you, disable this feature and use your mouse driver to send a keyboard shortcut instead.
