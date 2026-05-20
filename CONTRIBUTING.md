# Contributing

Windows Voice Input Hotkeys を良くするための貢献を歓迎します。

## 歓迎する変更

- AutoHotkey v1 / v2 互換性の修正。
- セットアップ手順の改善。
- clipboard、一時ファイル、Codex 呼び出しまわりの安全な初期値。
- Windows 音声入力のトラブルシュート追加。
- repo の見通しを保てる小さなワークフロー改善。

## この repo に入れないもの

次のものは追加しないでください。

- 個人のファイルパス。
- 個別端末にしかないデバイス名。
- 個人情報を含むスクリーンショット。
- API キー、トークン、ログ、音声入力の書き起こし。
- 大きなバイナリや生成済みメディア。

## 開発メモ

- `scripts\voice-dictation-hotkey.ahk` は AutoHotkey v2 用です。
- `scripts\codex_voice_input.ahk` は AutoHotkey v1.1 用です。
- `scripts\codex_text_polish.ps1` は `codex` コマンドが使える前提です。

Pull request を開く前に、変更したスクリプトを Windows 実機で確認してください。ユーザーから見える挙動が変わった場合は README またはトラブルシュートも更新してください。
