# マウス割り当て

マウスホイールのダブルクリックは、キーボードへ手を戻さずに音声入力を始めたいときに便利です。入力したいアプリにすでに focus がある場面と相性が良いです。

## 組み込み対応

どちらのスクリプトも、初期設定でマウスホイールのダブルクリックに対応しています。

- `voice-dictation-hotkey.ahk`: Windows 音声入力を起動または切り替えます。
- `codex_voice_input.ahk`: Codex で整えるための一時入力欄を開きます。

`~MButton` を使っているため、通常の中クリックも active app へ渡します。

## 設定

シンプルな AutoHotkey v2 版では、次をコピーします。

```text
scripts\voice-dictation-hotkey.ini.example
```

コピー先:

```text
scripts\voice-dictation-hotkey.ini
```

Codex 連携の AutoHotkey v1.1 版では、次をコピーします。

```text
scripts\codex_voice_input.ini.example
```

コピー先:

```text
scripts\codex_voice_input.ini
```

その後、次を調整します。

```text
EnableMouseWheelDoubleClick=1
MouseWheelDoubleClickMs=350
```

無効化する場合:

```text
EnableMouseWheelDoubleClick=0
```

## 注意点

中クリックは、アプリによって既に意味があります。

- ブラウザでリンクを新しいタブで開く。
- ブラウザのタブを閉じる。
- design、CAD、spreadsheet、map tool などで pan する。
- アプリ固有の mouse gesture。

この repo のスクリプトは通常の中クリックを渡しますが、対象アプリは音声入力が始まる前の 2 回の中クリックへ反応することがあります。特定アプリで気になる場合は組み込みのマウス割り当てを無効化し、マウスドライバ側で `Ctrl + Alt + Space` を送る設定にしてください。
