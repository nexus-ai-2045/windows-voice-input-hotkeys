# Public 化チェックリスト

この repo を private から public に変える前に確認します。

## Public 化前に必須

- API キー、トークン、パスワード、秘密鍵、認証情報が含まれていないこと。
- Dropbox、OneDrive、個人のホームディレクトリなど、ローカル専用の個人パスが含まれていないこと。
- 個人情報を含むスクリーンショット、ログ、書き起こし、端末一覧、サポート用 dump が含まれていないこと。
- README だけで、何をする repo か、誰向けか、どう実行するかが分かること。
- ライセンスが意図したものになっていること。この repo は MIT を使います。
- `SECURITY.md` にセキュリティ報告方針があること。
- `CONTRIBUTING.md` に貢献時の注意があること。
- `TROUBLESHOOTING.md` によくある詰まりどころがあること。
- issue / pull request テンプレートで、機密の音声入力テキストを共有しないよう注意していること。
- `docs/PUBLIC_RELEASE.md` に現在の public 化手順があること。
- `docs/HOTKEY_CONFIGURATION.md` で、スクリプトを直接編集せずホットキーを変える方法が分かること。
- マウスホイールのダブルクリック仕様が、通常の中クリックとの関係も含めて説明されていること。
- `TEST_PLAN.md` を Windows 実機で通していること。
- スクリプトが破壊的なコマンドを実行したり、分かりにくい形でシステム設定を変えたりしないこと。
- README に載せた 2 つの使い方を Windows 実機で確認していること。

## Public 化前にできればやる

- 一時入力欄のスクリーンショットまたは短い GIF を追加する。
- 対応 AutoHotkey バージョンの表を追加する。
- `v0.1.0` のような release tag を作る。

## GitHub 設定案

- Visibility: 上の確認が終わってから public。
- Description: `AutoHotkey shortcuts for Windows voice typing and Codex-polished dictation.`
- Topics: `windows`, `autohotkey`, `voice-input`, `dictation`, `codex`
- Features: issues は有効、discussions は任意、wiki は必要になるまで無効。

## Public 化判断

公開ボタンを押す前に、次へ答えます。

1. 初見の人が README だけで用途を理解できるか。
2. privacy セクションを読めば、機密テキストを漏らさない使い方が分かるか。
3. 含まれている全ファイルが、この PC の外にいる人にも役立つか。
4. 検索エンジンに index されて困るものが残っていないか。
