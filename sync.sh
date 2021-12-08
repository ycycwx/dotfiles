#!/bin/sh

BACKUP=./backup

# homebrew
brew bundle dump --force --file $BACKUP/Brewfile

# aria2
mkdir -p $BACKUP/aria2
cp -r $HOME/.aria2/* $BACKUP/aria2/

# prettier
cp $HOME/.prettierrc $BACKUP/prettierrc

# vimrc
cp $HOME/.vimrc $BACKUP/vimrc

# zshrc
cp $HOME/.zshrc $BACKUP/zshrc

# tmux
cp $HOME/.tmux.conf $BACKUP/tmux.conf

# git
cp -r $HOME/.gitconfig $BACKUP/gitconfig

# doom emacs
cp -r $HOME/.doom.d/ $BACKUP/doom.d/

# alacritty
cp -r $HOME/.config/alacritty/alacritty.yml $BACKUP/alacritty/
