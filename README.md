# homebrew-octavo

A Homebrew tap — a small cellar of formulae and casks, brewed in octavo (eight leaves to the sheet, perfectly pocket-sized).

## Usage

```bash
brew tap coetzeer/homebrew-octavo
brew trust coetzeer/octavo   # brew 6+ refuses untrusted taps; do this once
brew install oh-my-bash
```

## Layout

- `Formula/` — Ruby formulae for command-line tools
- `Casks/` — casks for GUI apps (when needed)

## Formulae

- `oh-my-bash` — the Oh My Bash framework. Upstream never tags releases, so
  the stable URL is pinned to a commit and the formula version is that
  commit's date (e.g. `2026-08-21`); `livecheck` is skipped for the same
  reason. Install it, then follow the caveats
  (`brew info coetzeer/homebrew-octavo/oh-my-bash`) to wire it into
  `~/.bashrc`.
