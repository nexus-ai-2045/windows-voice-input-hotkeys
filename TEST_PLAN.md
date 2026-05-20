# テスト計画

public にする前に、Windows 実機でこの手順を確認します。

## 環境

- Windows 11
- `scripts\voice-dictation-hotkey.ahk` 用の AutoHotkey v2
- `scripts\codex_voice_input.ahk` 用の AutoHotkey v1.1
- Codex 版を使う場合は、PowerShell で `codex --version` が通ること
- `Win + H` で Windows 音声入力が動くこと

## シンプル版

1. AutoHotkey v2 で `scripts\voice-dictation-hotkey.ahk` を起動する。
2. メモ帳などの普通のテキスト入力欄にカーソルを置く。
3. `Ctrl + Alt + Space` を押す。
4. Windows 音声入力が開くことを確認する。
5. もう一度 `Ctrl + Alt + Space` を押す。
6. Windows 音声入力が切り替わる、または閉じることを確認する。
7. マウスホイールをダブルクリックする。
8. Windows 音声入力が開くことを確認する。
9. ブラウザなどで、通常の中クリックが完全に壊れていないことを確認する。

## シンプル版の設定変更

1. `scripts\voice-dictation-hotkey.ini.example` を `scripts\voice-dictation-hotkey.ini` にコピーする。
2. `VoiceTypingHotkey` を一時的なテスト値に変える。例: `F13` または `CapsLock`
3. `scripts\voice-dictation-hotkey.ahk` を再起動する。
4. 新しいホットキーで Windows 音声入力が開くことを確認する。
5. `EnableMouseWheelDoubleClick=0` にする。
6. スクリプトを再起動する。
7. マウスホイールのダブルクリックで Windows 音声入力が開かないことを確認する。

## Codex 版

1. PowerShell で `codex --version` が通ることを確認する。
2. AutoHotkey v1.1 で `scripts\codex_voice_input.ahk` を起動する。
3. メモ帳などの普通のテキスト入力欄にカーソルを置く。
4. `Right Alt` を押し続ける。
5. 一時入力欄が開き、Windows 音声入力が始まることを確認する。
6. 短く無害なテスト文を話す。
7. `Right Alt` を離す。
8. Codex が文章を整えて、元のアプリに貼り付けることを確認する。
9. マウスホイールをダブルクリックする。
10. 一時入力欄が開くことを確認する。
11. `Right Alt` を押す。
12. Codex が文章を整えて貼り付けることを確認する。

## Codex 版の設定変更

1. `scripts\codex_voice_input.ini.example` を `scripts\codex_voice_input.ini` にコピーする。
2. `PadHotkey` を一時的なテスト値に変える。例: `F13`
3. `scripts\codex_voice_input.ahk` を再起動する。
4. 新しいホットキーで一時入力欄が開くことを確認する。
5. `EnableMouseWheelDoubleClick=0` にする。
6. スクリプトを再起動する。
7. マウスホイールのダブルクリックで一時入力欄が開かないことを確認する。

## プライバシー確認

- テスト中に、パスワード、API キー、秘密情報、個人情報、機密情報を音声入力しない。
- 個人設定を残したくない場合は、ローカル `.ini` ファイルを削除する。
- `.ini`、`.txt`、`.wav`、transcript 系の生成ファイルが Git に stage されていないことを確認する。

## 合格条件

- どちらのワークフローも初期ホットキーで起動する。
- マウスホイールのダブルクリックが初期状態で動く。
- マウスホイールのダブルクリックを `.ini` で無効化できる。
- 主要ホットキーをスクリプト編集なしで変更できる。
- Codex 版は、整形に失敗した場合に raw text を貼り付ける。
- テスト後に `git status --short --branch` が clean。
