# zmodload zsh/zprof

ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"

source "${ZINIT_HOME}/zinit.zsh"
eval "$(starship init zsh)"

zinit wait lucid for \
 atinit"ZINIT[COMPINIT_OPTS]=-C; zicompinit; zicdreplay" \
    zdharma-continuum/fast-syntax-highlighting \
 blockf \
    zsh-users/zsh-completions \
 atload"!_zsh_autosuggest_start" \
    zsh-users/zsh-autosuggestions \
 is-snippet \
  OMZP::{git,sudo,archlinux,extract} \
  OMZP::{kubectl,podman} \
  OMZP::golang \
  OMZP::{python,pip,pyenv} \
  OMZP::{yarn,node}

zi ice wait lucid; zi light Aloxaf/fzf-tab
zi ice wait lucid; zi light jeffreytse/zsh-vi-mode

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

# Vim mode
ZVM_CURSOR_STYLE_ENABLED=false
KEYTIMEOUT=1

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no

# Environment
export UNAME=$(uname)
export CLICOLOR=1
export LC_ALL=en_US.UTF-8
export EDITOR=nvim
export GPG_TTY=$(tty)

if [ $UNAME = "Darwin" ]; then

else;
  export BROWSER=chromium
  alias open=xdg-open
fi;

export CLOUDSDK_PYTHON=/usr/bin/python3
export PATH="$PATH:$HOME/.local/bin"
eval "$(fnm env --use-on-cd)"

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"

# zprof
