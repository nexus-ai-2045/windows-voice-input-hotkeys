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
    throw "Input file was not found: $InputPath"
}

$inputText = Get-Content -LiteralPath $InputPath -Raw -Encoding UTF8
if ([string]::IsNullOrWhiteSpace($inputText)) {
    throw "Input text is empty."
}

$workDir = Join-Path $env:TEMP "codex-voice-input"
New-Item -ItemType Directory -Force -Path $workDir | Out-Null

if ([string]::IsNullOrWhiteSpace($OutputPath)) {
    $OutputPath = Join-Path $workDir ("codex-output-" + (Get-Date -Format "yyyyMMdd-HHmmssfff") + ".txt")
}

$prompt = @"
Polish the following Japanese voice-dictation text for direct pasting.

Rules:
- Correct likely speech-recognition mistakes from context.
- Add natural punctuation and line breaks when useful.
- Clean kana/kanji, numbers, and Latin text.
- Remove unnecessary filler words.
- Preserve the user's intent.
- Output only the finished text. No explanation, quotes, or Markdown.

Text:
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
    throw "codex exec failed with exit code $LASTEXITCODE."
}

if (-not (Test-Path -LiteralPath $OutputPath)) {
    throw "Codex output file was not created: $OutputPath"
}

$finalText = Get-Content -LiteralPath $OutputPath -Raw -Encoding UTF8
$finalText = $finalText.Trim()

if ([string]::IsNullOrWhiteSpace($finalText)) {
    throw "Codex output was empty."
}

Set-Clipboard -Value $finalText
Write-Output $finalText
