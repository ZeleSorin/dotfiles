# Dotfiles

Portable terminal configuration for WezTerm, Zsh, and Powerlevel10k.
<img width="1549" height="964" alt="Screenshot 2026-08-07 at 13 32 57" src="https://github.com/user-attachments/assets/6608f3bb-c432-479e-b3e9-f78db3fd5ea4" />

## Layout

```text
stow/
├── wezterm/
│   ├── .wezterm.lua
│   └── .config/wezterm/background.png
└── zsh/
    ├── .zshrc
    ├── .p10k.zsh
    └── .p10k.local.zsh
```

The files are arranged as GNU Stow packages whose target is the home directory.
This keeps the repository as the source of truth while applications continue to
read their standard paths under `~`.

Machine-specific settings do not belong in this repository. Put them in
`~/.zshrc.local`; the tracked Zsh configuration loads that file when present.

## Install

Install GNU Stow if necessary:

```zsh
brew install stow
```

On a machine without conflicting configuration files:

```zsh
./install.sh
```

The installer deliberately does not use Stow's `--adopt` option, because that
could copy private machine settings into the repository. Back up or reconcile
conflicting files manually before installation.

## Local settings

Create `~/.zshrc.local` for settings that apply only to one machine. For
example:

```zsh
export EXAMPLE_SETTING='value'
```

The local file is intentionally not managed by Stow or Git.

## Recover an earlier version

Inspect the history of one configuration file:

```zsh
git log -- stow/wezterm/.wezterm.lua
git show <commit>:stow/wezterm/.wezterm.lua
```

Restore one file from an earlier commit, review it, and commit the restoration:

```zsh
git restore --source=<commit> -- stow/wezterm/.wezterm.lua
git diff
git commit -am 'restore earlier WezTerm configuration'
```

Undo a complete commit while preserving history:

```zsh
git revert <commit>
```

Stable milestones can also be named with tags, for example:

```zsh
git tag terminal-v1
```
