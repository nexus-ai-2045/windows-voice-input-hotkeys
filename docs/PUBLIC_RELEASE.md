# Public 化手順

この repo は private-first で育てます。public に変える判断をするときは、この手順を使います。

## 1. ローカル preflight を実行する

repo root で実行します。

```powershell
git status --short --branch
git log --oneline --decorate -5
rg -n -i "(sk-[A-Za-z0-9]|api[_-]?key|token|secret|password|passwd|authorization|bearer|client_secret|private_key|D:\\\\|Dropbox|OneDrive|Realtek|Steinberg|Yamaha|Waves)" .
```

期待する状態:

- working tree が clean。
- 直近 commit が意図したもの。
- 検索結果は、機密情報への注意を書いた documentation だけ。実際の機密情報は含まれていない。

## 2. 含まれているファイルを確認する

すべてのファイルが、個人の 1 台の PC の外でも役立つことを確認します。

残すもの:

- 汎用 script。
- 汎用 docs。
- security / contribution guidance。
- troubleshooting notes。

public 前に消すもの:

- 非公開 transcript。
- ローカル log。
- 個人情報を含む screenshot。
- 端末 inventory。
- 個別 device 固有の personal configuration。
- ローカル専用 filesystem path。

## 3. ワークフローをテストする

Windows 実機で確認します。

- AutoHotkey v2 で `scripts\voice-dictation-hotkey.ahk` を実行する。
- テキスト入力欄で `Ctrl + Alt + Space` を押す。
- AutoHotkey v1.1 で `scripts\codex_voice_input.ahk` を実行する。
- 音声入力が開き、Codex 整形が走り、元のアプリへ貼り戻されることを確認する。

気になる挙動があれば、public 化前に `TROUBLESHOOTING.md` へ記録します。

## 4. GitHub 設定を準備する

推奨設定:

- Description: `AutoHotkey shortcuts for Windows voice typing and Codex-polished dictation.`
- Topics: `windows`, `autohotkey`, `voice-input`, `dictation`, `codex`
- Issues: enabled。
- Discussions: optional。
- Wiki: 必要になるまで disabled。
- Security advisories: 使えるなら enabled。

## 5. 任意で最初の release を作る

テスト後、軽い release tag を作れます。

```powershell
git tag v0.1.0
git push origin v0.1.0
```

Release notes は `CHANGELOG.md` を使います。

## 6. Visibility を変える

GitHub で操作します。

1. Repository settings を開く。
2. Danger Zone へ移動する。
3. Visibility を private から public に変える。
4. GitHub の warning を読み直してから確定する。

変更後、private browser window で public page を開き、README だけで文脈が伝わることを確認します。
