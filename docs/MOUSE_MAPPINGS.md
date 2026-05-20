# Mouse Mappings

Mouse-wheel double click can be a comfortable way to start dictation, especially when the keyboard focus is already in the target app.

## Built-in support

Both scripts support mouse-wheel double click by default:

- `voice-dictation-hotkey.ahk`: toggles Windows voice typing.
- `codex_voice_input.ahk`: opens the temporary dictation pad.

The normal middle-click is passed through to the active app by using the `~MButton` hotkey prefix.

## Configuration

For the simple AutoHotkey v2 script, copy:

```text
scripts\voice-dictation-hotkey.ini.example
```

to:

```text
scripts\voice-dictation-hotkey.ini
```

For the Codex AutoHotkey v1 script, copy:

```text
scripts\codex_voice_input.ini.example
```

to:

```text
scripts\codex_voice_input.ini
```

Then adjust:

```text
EnableMouseWheelDoubleClick=1
MouseWheelDoubleClickMs=350
```

Set `EnableMouseWheelDoubleClick=0` to disable the mouse mapping.

## Tradeoffs

Middle click already has meaning in some apps:

- Opening links in a new browser tab.
- Closing browser tabs.
- Panning in design, CAD, spreadsheet, or map tools.
- App-specific mouse gestures.

The scripts pass normal middle-click through, but the target app may still react to the two middle clicks before dictation starts. If that is distracting in a specific app, disable the built-in mapping and use your mouse driver to send `Ctrl + Alt + Space` instead.
