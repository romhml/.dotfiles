set --universal fish_greeting

if status is-interactive
    # Commands to run in interactive sessions can go here
    fish_vi_key_bindings
    starship init fish | source
end

set UNAME $(uname)

set LC_ALL en_US.UTF-8
set EDITOR nvim

set GPG_TTY $(tty)
source ~/.config/aliases/common.sh
source ~/.config/aliases/kubectl.sh

set BAT_THEME Nord

set FZF_DEFAULT_OPTS '--color 16'
set FZF_CTRL_R_OPTS '--height 7'

# Golang
set GO111MODULE on
set GOPATH $HOME/go
set PATH $GOPATH/bin $PATH

# Python
set CLOUDSDK_PYTHON /usr/bin/python3
set PYENV_ROOT "$HOME/.pyenv"
set PATH "$PYENV_ROOT/bin" $PATH
eval "$(pyenv init --path)"

# Rust
set PATH $HOME/.cargo/bin $PATH

kubectl completion fish | source

eval "$(pyenv init -)"

if [ $(uname)="Darwin" ]
  set PATH "/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin" $PATH
end

if [ $UNAME != "Darwin" ] 
  set BROWSER firefox
  alias open=xdg-open
end;

# Path setup
set PATH $HOME/.local/bin $PATH