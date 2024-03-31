# Performance monitoring, Uncomment and add zprof at the end.
# zmodload zsh/zprof
export ZSH="$HOME/.oh-my-zsh"
plugins=(git zsh-completions zsh-autosuggestions fzf-zsh-plugin)

set -o vi

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
source $HOME/.config/aliases/common.sh
source $HOME/.config/aliases/kubectl.sh

if [ $(uname)="Darwin" ]; then
  export PATH="/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin:$PATH"
  export PATH="/opt/homebrew/opt/ruby/bin:$PATH"

  export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"

  export ANDROID_HOME=$HOME/Library/Android/sdk
  export PATH=$PATH:$ANDROID_HOME/platform-tools
else
  export BROWSER=chromium
  alias open=xdg-open
  source /usr/share/nvm/init-nvm.sh
fi;

# Path setup
export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:/usr/local/opt/llvm/bin"
export PATH="$PATH:/opt/rocm/bin/"
export PATH="$PATH:$HOME/.local/share/gem/ruby/3.0.0/bin"

source <(kubectl completion zsh)

eval "$(starship init zsh)"
eval "$(pyenv init -)"

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
if [ -f "$HOME/.config/google-cloud-sdk/path.zsh.inc" ]; then . "$HOME/.config/google-cloud-sdk/path.zsh.inc"; fi
if [ -f "$HOME/.config/google-cloud-sdk/completion.zsh.inc" ]; then . "$HOME/.config/google-cloud-sdk/completion.zsh.inc"; fi


# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
[ -s "$HOME/.oh-my-zsh/completions/_bun" ] && source "$HOME/.oh-my-zsh/completions/_bun"
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"

# pnpm
export PNPM_HOME="$HOME/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

export FORCE_COLOR=1 # Force colors on turbo log output

# Fix FZF colors
export FZF_DEFAULT_OPTS='--color 16'
export FZF_CTRL_R_OPTS='--height 7'

# Automatically setup nvm if nvmrc
[[ -f ".nvmrc" ]] && nvm use

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
source $HOME/.rvm/scripts/rvm

# grit
export GRIT_INSTALL="$HOME/.grit"
export PATH="$GRIT_INSTALL/bin:$PATH"
