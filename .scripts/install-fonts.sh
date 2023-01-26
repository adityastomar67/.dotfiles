#!/bin/bash

cd ~/.dotfiles/.fonts
sudo cp * /usr/share/fonts/OTF/ 
mkdir -p ~/.local/share/fonts
cp ttf-material-design-icons/* ~/.local/share/fonts/
fc-cache -fv
