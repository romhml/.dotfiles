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


# FZF Fish commands:
# Ctrl-o	Find a file.
# Ctrl-r	Search through command history.
# Alt-c	cd into sub-directories (recursively searched).
# Alt-Shift-c	cd into sub-directories, including hidden ones.
# Alt-o	Open a file/dir using default editor ($EDITOR)
# Alt-Shift-o	Open a file/dir using xdg-open or open commandet -U FZF_COMPLETE 2
set -U FZF_FIND_FILE_COMMAND "ag -l --hidden --ignore .git"
set -U FZF_DEFAULT_OPTS "--height 40% --layout=reverse --border"

# source ~/.config/aliases/common.sh
# source ~/.config/aliases/kubectl.sh

set BAT_THEME Nord

set FZF_DEFAULT_OPTS '--color 16'
set FZF_CTRL_R_OPTS '--height 7'

# Golang
set GO111MODULE on
set GOPATH $HOME/go
set PATH $GOPATH/bin $PATH

# Python
# set CLOUDSDK_PYTHON /usr/bin/python3
# set PYENV_ROOT "$HOME/.pyenv"
# set PATH "$PYENV_ROOT/bin" $PATH
# eval "$(pyenv init --path)"

# Rust
set PATH $HOME/.cargo/bin $PATH

# Kube
# kubectl completion fish | source

if [ $UNAME="Darwin" ]
  set PATH "/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin" $PATH
else
  set BROWSER firefox
  alias open=xdg-open
end

# Path setup
set PATH $HOME/.local/bin $PATH
