# 公開メモ

## Repository unit

この repo は、目的が 1 つに絞れているため独立 repo として扱いやすいです。

> Windows の音声入力をすばやく呼び出し、必要なら Codex で文章を整えて貼り戻す。

## 公開前に整理済み

- ローカルのマイク device 名を削除。
- 個人の Dropbox path を削除。
- API key や token を保存しない構成にした。
- 一時出力は `%TEMP%` 配下へ置く構成にした。

## GitHub 設定案

- Visibility: public。
- Topics: `windows`, `autohotkey`, `voice-input`, `dictation`, `codex`
- Description: `AutoHotkey shortcuts for Windows voice typing and Codex-polished dictation.`

## 残る手動確認

- MIT license で公開して問題ないか確認する。
- 対象 Windows machine で Codex CLI command が動くことを確認する。
- public 化後も、実機での追加確認結果を README / TEST_PLAN に反映する。

## Open source readiness

- `OPEN_SOURCE_CHECKLIST.md` で public 化 gate を管理する。
- `SECURITY.md` で音声入力の機密リスクと security reporting を説明する。
- `CONTRIBUTING.md` で入れてよい変更と入れないものを説明する。
- `TROUBLESHOOTING.md` で common setup / runtime failure を扱う。
- GitHub issue / pull request template で、機密の音声入力テキストを共有しないよう注意する。
- README から public 化 checklist と privacy notes へ辿れるようにする。
