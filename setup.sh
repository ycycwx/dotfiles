#!/bin/sh
set -eu

cd -- "$(dirname -- "$0")"

if ! command -v stow > /dev/null 2>&1
then
    echo "stow could not be found, installing..."
    brew install stow
fi

set -- alacritty ghostty mpv neovim prettier tmux
stow --simulate --target="$HOME" "$@"
stow --target="$HOME" "$@"
