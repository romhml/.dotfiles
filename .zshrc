# Performance monitoring, Uncomment and add zprof at the end.
# zmodload zsh/zprof
export ZSH="$HOME/.oh-my-zsh"

plugins=(git zsh-completions zsh-autosuggestions zsh-vi-mode fzf-zsh-plugin)

# Fix FZF conflicts with zsh-vi-mode
zvm_after_init_commands+=('[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh')

# Fix FZF colors
export FZF_DEFAULT_OPTS='--color 16'
export FZF_CTRL_R_OPTS='--height 7'

source $ZSH/oh-my-zsh.sh
export UNAME=$(uname)

export LC_ALL=en_US.UTF-8
export EDITOR=nvim

if [ $UNAME != "Darwin" ]; then
  export BROWSER=firefox
  alias open=xdg-open
fi;

export ZVM_CURSOR_STYLE_ENABLED=false

# Vim navigation in zsh menuselect
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history


export GPG_TTY=$(tty)
source ~/.config/aliases/common.sh
source ~/.config/aliases/kubectl.sh

export BAT_THEME="Nord"

# Rust
source $HOME/.cargo/env

# Golang
export GO111MODULE="on"
export GOPATH="$HOME/go"
export PATH="$PATH:$GOPATH/bin"

# Python
export CLOUDSDK_PYTHON=/usr/bin/python3
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"

# gcloud
# The next line updates PATH for the Google Cloud SDK.
if [ -f "$HOME/.config/google-cloud-sdk/path.zsh.inc" ]; then . "$HOME/.config/google-cloud-sdk/path.zsh.inc"; fi
# The next line enables shell command completion for gcloud.
if [ -f "$HOME/.config/google-cloud-sdk/completion.zsh.inc" ]; then . "$HOME/.config/google-cloud-sdk/completion.zsh.inc"; fi

source <(kubectl completion zsh)

eval "$(starship init zsh)"
eval "$(pyenv init -)"

if [ $(uname)="Darwin" ]; then
  export PATH="/usr/local/opt/node@18/bin:$PATH"
fi

#
# Path setup
export PATH="$PATH:${HOME}/.local/bin"
export PATH="$PATH:/usr/local/opt/llvm/bin"
export PATH="$PATH:$(yarn global bin)"
export PATH="$PATH:/opt/rocm/bin/"

export FORCE_COLOR=1 # Force colors on turbo log output

# pnpm
export PNPM_HOME="/home/rohm/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
