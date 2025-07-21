# zmodload zsh/zprof

ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"

source "${ZINIT_HOME}/zinit.zsh"
eval "$(starship init zsh)"

zinit wait lucid for \
 atinit"ZINIT[COMPINIT_OPTS]=-C; zicompinit; zicdreplay" \
 blockf \
    zsh-users/zsh-completions \
 atload"!_zsh_autosuggest_start" \
    zsh-users/zsh-autosuggestions \
    Aloxaf/fzf-tab \
 is-snippet \
  OMZP::{git,archlinux,extract} \
  OMZP::{podman,docker-compose/_docker-compose} \
  OMZP::golang \
  OMZP::{python,pip} \
  OMZP::{yarn,node} \
 as"completion" OMZP::docker/completions/_docker

# Vim mode
KEYTIMEOUT=1
set -o vi
bindkey "^?" backward-delete-char

source $HOME/.config/aliases/common.sh
source $HOME/.config/aliases/kubectl.sh

# History
HISTSIZE=5000
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

bindkey '^p' history-search-backward
bindkey '^n' history-search-forward

# FZF
eval "$(fzf --zsh)"
export FZF_DEFAULT_OPTS='--color bw'
export FZF_CTRL_R_OPTS='--height 7'

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no

# Environment
export UNAME=$(uname)
export CLICOLOR=1
export LC_ALL=en_US.UTF-8

export EDITOR=nvim
export LAUNCH_EDITOR=nvimux
export BROWSER=zen-browser

export GPG_TTY=$(tty)

if [ $UNAME = "Darwin" ]; then
  export PATH="/opt/homebrew/opt/postgresql@15/bin:$PATH"
else;
  alias open=xdg-open
  alias ls="ls --color"
fi;

export PATH="$PATH:$HOME/.cargo/bin"

export CLOUDSDK_PYTHON=/usr/bin/python3
export PATH="$PATH:$HOME/.local/bin"
eval "$(fnm env --use-on-cd --log-level quiet)"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
[ -s "$HOME/.oh-my-zsh/completions/_bun" ] && source "$HOME/.oh-my-zsh/completions/_bun"

# pnpm
export PNPM_HOME="$HOME/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

export PATH=$PATH:$HOME/.spicetify
