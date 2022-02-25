#!/bin/bash
cp ~/.dotfiles/list.pacman $HOME
cd $HOME
sudo pacman -Syu
sudo pacman -S - < list.pacman

cp ~/.dotfiles/.scripts/text.txt $HOME
cp ~/.dotfiles/.scripts/stw $HOME
cd $HOME
chmod +x ./stw
./stw

cd ~/.dotfiles/.scripts
./fonts
./wall
# apps
./vscode

# For Changing the screen timeout to one hour
xset s 3600 3600
