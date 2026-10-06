#!/usr/bin/env zsh

set -euo pipefail

repo_dir=${0:A:h}
stow_args=(
  --dir "$repo_dir/stow"
  --target "$HOME"
  --restow
)

if (( $# != 0 )); then
  print -u2 "usage: $0"
  exit 2
fi

if ! command -v stow >/dev/null 2>&1; then
  print -u2 'GNU Stow is required. Install it with: brew install stow'
  exit 1
fi

stow "${stow_args[@]}" wezterm zsh lsd herdr
