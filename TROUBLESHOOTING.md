# トラブルシュート

## Windows 音声入力が起動しない

- ショートカットを押す前に、通常のテキスト入力欄へカーソルを置いてください。
- まず `Win + H` を手動で押し、Windows 音声入力が単体で動くことを確認してください。
- Windows のマイク権限を確認してください。
- キーボード設定やマイク設定を変更した後は、AutoHotkey スクリプトを再起動してください。

## `Ctrl + Alt + Space` が別アプリと衝突する

次のファイルをコピーします。

```text
scripts\voice-dictation-hotkey.ini.example
```

コピー先:

```text
scripts\voice-dictation-hotkey.ini
```

その後、次の値を編集します。

```ini
VoiceTypingHotkey=^!Space
```

例:

```ini
VoiceTypingHotkey=CapsLock
```

## マウスホイールのダブルクリックで音声入力が起動する

マウスホイールのダブルクリックは、初期設定で有効です。

調整または無効化したい場合は、使っているスクリプトに対応するローカル `.ini` を編集します。

```ini
EnableMouseWheelDoubleClick=1
MouseWheelDoubleClickMs=350
```

無効化する場合:

```ini
EnableMouseWheelDoubleClick=0
```

通常の中クリックはアプリへ渡します。ただし、対象アプリによっては音声入力が始まる前に 2 回分の中クリックへ反応することがあります。気になる場合は、この repo 側のマウス割り当てを無効にし、マウスドライバ側で `Ctrl + Alt + Space` を送る設定にしてください。

## Codex の整形が動かない

PowerShell で `codex` が使えることを確認します。

```powershell
codex --version
```

続けて確認すること:

- Codex CLI のログインが済んでいること。
- 小さな UTF-8 テキストファイルで `scripts\codex_text_polish.ps1` を手動実行できること。
- PowerShell がスクリプト実行をブロックする場合は、信頼できる checkout から次のようにプロセス単位で実行ポリシーを緩めること。

```powershell
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
```

## 違うアプリへ貼り付けられる

- 一時入力欄が表示されてから話してください。
- 音声入力中は、できるだけ別ウィンドウへ切り替えないでください。
- 特定アプリでフォーカス復帰が不安定な場合は、シンプルな `Win + H` 呼び出し版を使ってください。

## 日本語が文字化けする

- 入力ファイルは UTF-8 のまま扱ってください。
- 新しめの PowerShell を使ってください。
- ファイルの文字コードを勝手に変えるエディタでスクリプトを編集しないでください。
