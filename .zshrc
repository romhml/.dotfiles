# Performance monitoring, Uncomment and add zprof at the end.
# zmodload zsh/zprof
export ZSH="$HOME/.oh-my-zsh"

plugins=(git zsh-completions zsh-autosuggestions fzf-zsh-plugin)

set -o vi

# Fix FZF colors
export FZF_DEFAULT_OPTS='--color 16'
export FZF_CTRL_R_OPTS='--height 7'

source $ZSH/oh-my-zsh.sh
export UNAME=$(uname)

export LC_ALL=en_US.UTF-8
export EDITOR=nvim

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

# Golang
export GO111MODULE="on"
export GOPATH="$HOME/go"
export PATH="$PATH:$GOPATH/bin"

# Python
export CLOUDSDK_PYTHON=/usr/bin/python3
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"

# Rust
export PATH="$HOME/.cargo/bin:$PATH"

# gcloud
# The next line updates PATH for the Google Cloud SDK.
if [ -f "$HOME/.config/google-cloud-sdk/path.zsh.inc" ]; then . "$HOME/.config/google-cloud-sdk/path.zsh.inc"; fi
# The next line enables shell command completion for gcloud.
if [ -f "$HOME/.config/google-cloud-sdk/completion.zsh.inc" ]; then . "$HOME/.config/google-cloud-sdk/completion.zsh.inc"; fi

source <(kubectl completion zsh)

eval "$(starship init zsh)"
eval "$(pyenv init -)"

if [ $(uname)="Darwin" ]; then
  export PATH="/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin:$PATH"
  export PATH="/opt/homebrew/opt/ruby/bin:$PATH"

  export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

  export ANDROID_HOME=$HOME/Library/Android/sdk
  export PATH=$PATH:$ANDROID_HOME/platform-tools
fi

if [ $UNAME != "Darwin" ]; then
  export BROWSER=chromium
  alias open=xdg-open
fi;

# Path setup
export PATH="$PATH:${HOME}/.local/bin"
export PATH="$PATH:/usr/local/opt/llvm/bin"
export PATH="$PATH:$(yarn global bin)"
export PATH="$PATH:/opt/rocm/bin/"

export FORCE_COLOR=1 # Force colors on turbo log output

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# pnpm
export PNPM_HOME="$HOME/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

# bun completions
[ -s "/home/rohm/.oh-my-zsh/completions/_bun" ] && source "/home/rohm/.oh-my-zsh/completions/_bun"
