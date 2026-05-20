param(
    [Parameter(Mandatory = $true)]
    [string]$InputPath,
    [string]$OutputPath = "",
    [string]$Model = ""
)

$ErrorActionPreference = "Stop"
[Console]::InputEncoding = [System.Text.UTF8Encoding]::new($false)
[Console]::OutputEncoding = [System.Text.UTF8Encoding]::new($false)
$OutputEncoding = [System.Text.UTF8Encoding]::new($false)

if (-not (Test-Path -LiteralPath $InputPath)) {
    throw "入力ファイルが見つかりません: $InputPath"
}

$inputText = Get-Content -LiteralPath $InputPath -Raw -Encoding UTF8
if ([string]::IsNullOrWhiteSpace($inputText)) {
    throw "入力テキストが空です。"
}

$workDir = Join-Path $env:TEMP "codex-voice-input"
New-Item -ItemType Directory -Force -Path $workDir | Out-Null

if ([string]::IsNullOrWhiteSpace($OutputPath)) {
    $OutputPath = Join-Path $workDir ("codex-output-" + (Get-Date -Format "yyyyMMdd-HHmmssfff") + ".txt")
}

$prompt = @"
次の日本語音声入力テキストを、そのまま貼り付けられる自然な文章に整えてください。

ルール:
- 文脈から見て明らかな音声認識ミスを直す。
- 必要に応じて自然な句読点と改行を入れる。
- かな、漢字、数字、英字表記を読みやすく整える。
- 不要な filler words を削る。
- ユーザーの意図は変えない。
- 完成した本文だけを出力する。説明、引用符、Markdown は出力しない。

対象テキスト:
$inputText
"@

$argsList = @(
    "exec",
    "--skip-git-repo-check",
    "--ephemeral",
    "--ignore-user-config",
    "--ignore-rules",
    "-s", "read-only",
    "-C", $workDir,
    "-o", $OutputPath
)

if (-not [string]::IsNullOrWhiteSpace($Model)) {
    $argsList += @("-m", $Model)
}

$argsList += @("-")

$prompt | & codex @argsList | Out-Null

if ($LASTEXITCODE -ne 0) {
    throw "codex exec が exit code $LASTEXITCODE で失敗しました。"
}

if (-not (Test-Path -LiteralPath $OutputPath)) {
    throw "Codex output file が作成されませんでした: $OutputPath"
}

$finalText = Get-Content -LiteralPath $OutputPath -Raw -Encoding UTF8
$finalText = $finalText.Trim()

if ([string]::IsNullOrWhiteSpace($finalText)) {
    throw "Codex output が空です。"
}

Set-Clipboard -Value $finalText
Write-Output $finalText
