# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

if [ ! -d "$ZINIT_HOME" ]; then
    mkdir -p "$(dirname $ZINIT_HOME)"
    git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

source "${ZINIT_HOME}/zinit.zsh"
# Add in Powerlevel10k
zinit ice depth=1; zinit light romkatv/powerlevel10k

# Add in zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions

# Load completions.
autoload -U compinit && compinit
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
# Keep personal prompt overrides separate from the generated p10k config.
[[ ! -f ~/.p10k.local.zsh ]] || source ~/.p10k.local.zsh
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.local/node/bin:$PATH"

if command -v direnv >/dev/null 2>&1; then
  eval "$(direnv hook zsh)"
fi

if command -v mise >/dev/null 2>&1; then
  eval "$(mise activate zsh)"
fi

if command -v wt >/dev/null 2>&1; then eval "$(command wt config shell init zsh)"; fi
# Keybindings.
bindkey -e
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward
# History.
HISTSIZE=1000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Completion styling.

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

# Aliases
export CLICOLOR=1
export LSCOLORS='Exfxcxdxbxegedabagacad'
alias ls='ls --color'

# Shell integrations.
if command -v fzf >/dev/null 2>&1; then
  eval "$(fzf --zsh)"
fi


# Bun completions.
[[ -s "$HOME/.bun/_bun" ]] && source "$HOME/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# Vite+ bin (https://viteplus.dev)
[[ -r "$HOME/.vite-plus/env" ]] && source "$HOME/.vite-plus/env"

# Load machine-specific settings without committing them to this repository.
[[ -r "$HOME/.zshrc.local" ]] && source "$HOME/.zshrc.local"
