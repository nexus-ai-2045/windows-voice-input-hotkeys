# Security Policy

## Reporting a vulnerability

If you find a security issue, please open a private report if GitHub security advisories are enabled for this repository. If private reporting is not available, open a minimal issue that does not include exploit details or secrets.

## Sensitive data

This project is a voice input helper. Depending on your local setup, dictated text can be processed by the Codex CLI and may leave the active application.

Do not dictate or test with:

- Passwords.
- API keys or access tokens.
- Private keys.
- Recovery codes.
- Customer or patient data.
- Private transcripts or confidential work content.

## Repository hygiene

This repository should not contain:

- Real credentials.
- Personal logs or transcripts.
- Machine inventory dumps.
- Local-only private paths.
- Screenshots with private content.

If sensitive data is accidentally committed, rotate the affected secret first, then rewrite or remove the affected history before making the repository public.
