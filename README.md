# Windows Voice Input Hotkeys

Windows 標準の音声入力を、好きなホットキーやマウスホイールのダブルクリックで呼び出すための AutoHotkey スクリプト集です。

Windows 音声入力そのものは、この repo がなくても `Win + H` で使えます。この repo は、`Win + H` をもっと押しやすくしたい人、マウス操作で呼び出したい人、音声入力した文章を Codex で整えてから貼り付けたい人向けです。

## できること

- `Ctrl + Alt + Space` で Windows 音声入力を起動
- マウスホイールのダブルクリックで Windows 音声入力を起動
- `.ini` ファイルでホットキーを変更
- Codex CLI を使って、音声入力した日本語を整えてから元のアプリへ貼り戻し

## 構成

- `scripts\voice-dictation-hotkey.ahk`
  - AutoHotkey v2 用
  - Windows 音声入力を好きな操作で呼び出すシンプル版
- `scripts\codex_voice_input.ahk`
  - AutoHotkey v1.1 用
  - 一時入力欄で音声入力し、Codex で文章を整えてから貼り戻す版

## 状態

このプロジェクトは公開用の最小構成です。機密の音声入力テキストやローカル設定を repo に入れない方針は、[OPEN_SOURCE_CHECKLIST.md](OPEN_SOURCE_CHECKLIST.md) と [SECURITY.md](SECURITY.md) にまとめています。

## AutoHotkey なしで使う場合

Windows 標準の音声入力だけを使うなら、AutoHotkey は不要です。

```text
Win + H
```

これで現在のテキスト入力欄に対して Windows 音声入力を開始できます。

## シンプル版

AutoHotkey v2 を入れてから実行します。

```text
scripts\voice-dictation-hotkey.ahk
```

初期設定:

```text
Ctrl + Alt + Space
マウスホイールのダブルクリック
```

どちらも `Win + H` を送信し、Windows 音声入力を起動または切り替えます。

設定を変えるには、次をコピーします。

```text
scripts\voice-dictation-hotkey.ini.example
```

コピー先:

```text
scripts\voice-dictation-hotkey.ini
```

その後、`VoiceTypingHotkey`、`EnableMouseWheelDoubleClick`、`MouseWheelDoubleClickMs` を編集します。

詳しくは [docs/HOTKEY_CONFIGURATION.md](docs/HOTKEY_CONFIGURATION.md) を見てください。

## Codex で整えて貼り戻す版

必要なもの:

- AutoHotkey v1.1
- `codex` コマンドとして使える Codex CLI
- Windows 音声入力

実行:

```text
scripts\codex_voice_input.ahk
```

初期設定:

- `Right Alt` を押している間だけ音声入力、離すと Codex で整えて貼り付け
- `Right Alt` を素早く2回押すとハンズフリー音声入力開始
- ハンズフリー中に `Right Alt` を押すと、整えて貼り付け
- `Ctrl + Alt + Space` で一時入力欄を開く
- マウスホイールのダブルクリックで一時入力欄を開く

このスクリプトは小さな一時入力欄を開き、そこで Windows 音声入力を使います。入力された文章を `codex exec` に渡して整え、元のアプリに貼り戻します。

設定を変えるには、次をコピーします。

```text
scripts\codex_voice_input.ini.example
```

コピー先:

```text
scripts\codex_voice_input.ini
```

その後、`HoldHotkey`、`PadHotkey`、`EnableMouseWheelDoubleClick`、`MouseWheelDoubleClickMs` を編集します。

## プライバシーと安全

- Codex で整える版では、音声入力した文章がローカル設定済みの Codex CLI に渡されます。
- 一時ファイルは `%TEMP%\codex-voice-input` に作られます。
- パスワード、API キー、秘密鍵、個人情報、機密情報は音声入力しないでください。
- この repo には API キー、トークン、端末固有の情報、個人用パス、ログ、Transcript を入れない方針です。

セキュリティに関する扱いは [SECURITY.md](SECURITY.md) を見てください。

## テスト

Windows 実機での確認手順は [TEST_PLAN.md](TEST_PLAN.md) にあります。

## 関連ドキュメント

- [TEST_PLAN.md](TEST_PLAN.md): Windows 実機での確認手順
- [OPEN_SOURCE_CHECKLIST.md](OPEN_SOURCE_CHECKLIST.md): public 化前の確認
- [SECURITY.md](SECURITY.md): セキュリティと機密情報の扱い
- [TROUBLESHOOTING.md](TROUBLESHOOTING.md): 困ったときの確認
- [CHANGELOG.md](CHANGELOG.md): 変更履歴
- [docs/HOTKEY_CONFIGURATION.md](docs/HOTKEY_CONFIGURATION.md): ホットキー設定
- [docs/MOUSE_MAPPINGS.md](docs/MOUSE_MAPPINGS.md): マウスホイールダブルクリック
- [docs/PUBLIC_RELEASE.md](docs/PUBLIC_RELEASE.md): public 化手順

## メモ

- シンプル版は AutoHotkey v2 構文です。
- Codex 版は AutoHotkey v1.1 構文です。
- ローカル `.ini` ファイルは Git で無視されるので、個人設定は repo に入りません。
- API キーは保存しません。Codex 版は、手元の Codex CLI 認証を使います。

## License

MIT
