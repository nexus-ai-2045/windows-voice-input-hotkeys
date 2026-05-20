# セキュリティポリシー

## 脆弱性の報告

セキュリティ上の問題を見つけた場合は、GitHub security advisories が有効なら private report を使ってください。private report が使えない場合は、攻撃手順や秘密情報を含めない最小限の issue を作成してください。

## 機密データ

この project は音声入力補助です。ローカル設定によっては、音声入力したテキストが Codex CLI で処理され、現在のアプリの外へ渡されます。

次の内容を読み上げたり、テスト用に入力したりしないでください。

- パスワード。
- API キーや access token。
- 秘密鍵。
- recovery code。
- 顧客、患者、取引先などの機密情報。
- 非公開の議事録や confidential な業務内容。

## Repo の衛生管理

この repo には次のものを含めません。

- 実在する認証情報。
- 個人ログや書き起こし。
- 端末 inventory dump。
- ローカル専用の private path。
- 個人情報を含むスクリーンショット。

機密情報を誤って commit した場合は、まず影響を受けた secret を rotate し、その後 public 化する前に履歴から削除または rewrite してください。
