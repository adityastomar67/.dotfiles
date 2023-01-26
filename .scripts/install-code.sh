#!/bin/bash

# EXTENSIONs
code --force --install-extension ms-vscode.sublime-keybindings@4.0.10
code --force --install-extension octref.vetur@0.34.1
code --force --install-extension s-nlf-fh.glassit
code --force --install-extension ms-vscode.cpptools
code --force --install-extension formulahendry.code-runner
code --force --install-extension esbenp.prettier-vscode
code --force --install-extension ritwickdey.liveserver
code --force --install-extension ms-python.python
code --force --install-extension Github.copilot
code --force --install-extension ms-python.vscode-pylance
code --force --install-extension coenraads.bracket-pair-colorizer
code --force --install-extension viktorqvarfordt.vscode-pitch-black-theme
code --force --install-extension PKief.material-icon-theme
code --force --install-extension moalamri.inline-fold
code --force --install-extension foxundermoon.shell-format
code --force --install-extension EliverLara.andromeda
# code --force --install-extension teabyii.ayu@0.20.2
# code --force --install-extension matklad.rust-analyzer@0.2.727
# code --force --install-extension GitHub.github-vscode-theme
# code --force --install-extension vscodevim.vim

cd ~/.config/Code/User

[ -f "settings.json" ] && mv settings.json settings.json_old
[ -f "keybindings.json" ] && mv keybindings.json keybindings.json_old
[ -d "snippets" ] && mv snippets snippets_old

cp -r ~/.dotfiles/vscode/* ~/.config/Code/User/
