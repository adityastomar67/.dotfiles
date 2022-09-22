#!/bin/bash

## Checking if Stow is Installed
if [[ ! $(command -v stow) ]]; then
    sudo pacman -S stow --noconfirm
fi

## Making Backups
list="$HOME/.dotfiles/bin/text.txt"
while IFS= read -r item; do
    mv "$item" "$item.backup"
done <"$list"

## Stowing dots
cd "$HOME/.dotfiles" || exit
stow .

