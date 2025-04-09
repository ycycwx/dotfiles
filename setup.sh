#/bin/sh

if ! command -v stow &> /dev/null
then
    echo "stow could not be found, installing..."
    brew install stow
fi

stow alacritty
stow ghostty
stow mpv
stow neovim
stow prettier
stow tmux
