# ホットキー設定

ホットキーは、各スクリプトの横に置くローカル `.ini` ファイルで設定します。

`.ini` ファイルは Git で無視されます。自分用のショートカット設定は repo に入りません。

## シンプル版

次をコピーします。

```text
scripts\voice-dictation-hotkey.ini.example
```

コピー先:

```text
scripts\voice-dictation-hotkey.ini
```

例:

```ini
[Hotkeys]
VoiceTypingHotkey=^!Space
EnableMouseWheelDoubleClick=1
MouseWheelDoubleClickMs=350
```

## Codex 版

次をコピーします。

```text
scripts\codex_voice_input.ini.example
```

コピー先:

```text
scripts\codex_voice_input.ini
```

例:

```ini
[Hotkeys]
HoldHotkey=RAlt
PadHotkey=^!Space
EnableMouseWheelDoubleClick=1
MouseWheelDoubleClickMs=350
```

## AutoHotkey の記号

よく使う修飾キー:

```text
^  Ctrl
!  Alt
+  Shift
#  Windows キー
```

例:

```text
^!Space     Ctrl + Alt + Space
#+Space     Windows + Shift + Space
CapsLock    CapsLock
RAlt        右 Alt
F13         F13
```

## マウスホイールのダブルクリック

初期状態では有効です。

```ini
EnableMouseWheelDoubleClick=1
MouseWheelDoubleClickMs=350
```

無効にする場合:

```ini
EnableMouseWheelDoubleClick=0
```

通常の中クリックはアクティブなアプリへ通します。ただし、アプリによっては音声入力が始まる前に2回分の中クリックに反応することがあります。

それが気になる場合は、この機能を無効にして、マウスドライバ側で `Ctrl + Alt + Space` などを送る設定にしてください。
