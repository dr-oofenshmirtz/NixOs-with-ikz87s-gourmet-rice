source "$HOME/.zshrc"

. "$HOME/.cargo/env"

export GOPATH=$HOME/go
export GIT_EDITOR=$VIM
# i3blocks community scrips dependency
export SCRIPT_DIR=~/.config/i3blocks/scripts 


addToPath /usr/local/go/bin
addToPath $GOPATH/bin
addToPath $HOME/.yarn/bin
addToPath $HOME/.cargo/bin
addToPath $HOME/.rustup
addToPath /.npm-global/bin

addToPathFront $HOME/.local/bin
addToPathFront $HOME/.local/go/bin
addToPathFront $HOME/go/bin

export PATH=$HOME/.config/rofi/bin:$PATH
# exec $HOME/.local/bin/window-change.js
