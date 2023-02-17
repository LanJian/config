#!/usr/bin/env sh

ln -s -f $PWD/.gitconfig $HOME/.gitconfig
ln -s -f $PWD/.vimrc $HOME/.vimrc
ln -s -f $PWD/.zshrc $HOME/.zshrc
ln -s -f $PWD/.zshenv $HOME/.zshenv
ln -s -f $PWD/.aliases $HOME/.aliases
ln -s -f $PWD/.tmux.conf $HOME/.tmux.conf
ln -s -f $PWD/.pentadactylrc $HOME/.pentadactylrc
ln -s -f $PWD/.xmobarrc $HOME/.xmobarrc
ln -s -f $PWD/jackhxs.zsh-theme $HOME/.oh-my-zsh/themes/jackhxs.zsh-theme
ln -s -f $PWD/.p10k.zsh $HOME/.p10k.zsh

ln -s -f -n $PWD/.xmonad $HOME/.xmonad
ln -s -f -n $PWD/.pentadactyl $HOME/.pentadactyl
ln -s -f -n $PWD/.config/rofi $HOME/.config/rofi
ln -s -f -n $PWD/.config/dunst $HOME/.config/dunst
ln -s -f -n $PWD/.config/tridactyl $HOME/.config/tridactyl
ln -s -f -n $PWD/.config/nvim $HOME/.config/nvim

mkdir -p $HOME/.scripts
ln -s -f $PWD/.scripts/* $HOME/.scripts/
