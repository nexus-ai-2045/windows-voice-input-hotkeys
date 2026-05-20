# Mouse Mappings

Mouse-wheel double click can be a comfortable way to start dictation, especially when the keyboard focus is already in the target app.

## Recommended approach

Prefer mapping mouse-wheel double click in your mouse driver or mouse utility to one of these shortcuts:

```text
Win + H
```

or:

```text
Ctrl + Alt + Space
```

Keeping mouse-specific behavior outside the AutoHotkey scripts avoids breaking normal middle-click behavior in browsers, terminals, editors, 3D tools, and other apps where middle click already has meaning.

## Why it is not hardcoded

AutoHotkey can intercept `MButton`, but doing so can interfere with:

- Opening links in a new browser tab.
- Closing browser tabs.
- Panning in design, CAD, spreadsheet, or map tools.
- App-specific mouse gestures.

For that reason, this repository documents the mapping but does not force it by default.

## Optional AutoHotkey v2 experiment

If you still want to handle it in AutoHotkey v2, test carefully:

```ahk
MButton::{
    if (A_PriorHotkey = "MButton" && A_TimeSincePriorHotkey < 350) {
        Send "#h"
    } else {
        Send "{MButton}"
    }
}
```

This is intentionally not included in the default script because the first middle click still reaches the active app.
