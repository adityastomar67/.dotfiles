#!/usr/bin/env sh

cp -r ttf/* ~/.local/share/fonts/
cp -r "ligature_plugins/*" "$XDG_NVIM/after/syntax/"
