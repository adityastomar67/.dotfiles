#    ███████╗ ██████╗██╗  ██╗██████╗  █████╗
#    ╚════██║██╔════╝██║  ██║██╔══██╗██╔══██╗
#      ███╔═╝╚█████╗ ███████║██████╔╝██║  ╚═╝
#    ██╔══╝   ╚═══██╗██╔══██║██╔══██╗██║  ██╗
# ██╗███████╗██████╔╝██║  ██║██║  ██║╚█████╔╝
# ╚═╝╚══════╝╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝ ╚════╝

## If you come from bash you might have to change your $PATH.
if [ ! -f "$HOME/.zshrc" ]; then
    touch "$HOME/.zshrc"
fi

## Sourcing setup files
while read file
do
  [ -f "$HOME/.zsh/$file.zsh" ] && source "$HOME/.zsh/$file.zsh"
done <<-EOF
    plugs
    # theme
    env
    opts
    keys
    prompt
    fzf
EOF

## Sourcing other files
[ -f "$HOME/.aliases" ]    && source ~/.aliases     # Aliases - For a full list of active aliases, run `alias`.
[ -f "$HOME/.functions" ]  && source ~/.functions   # functions to improve productivity

echo "# This file was created by the dotfiles sourced zshrc by adityastomar67.
# Do not edit the file directly. Instead, add any settings overrides in this file.
if [ -r ~/.zsh/.zshrc ]; then
    source ~/.zsh/.zshrc
fi

[ -f "$HOME/.alias_temp" ] && source "$HOME/.alias_temp"
" > $HOME/.zshrc

## Calling scrpits and Operations
echo -en "\x1b[2J\x1b[1;1H" ;echo # For faster clearing the Terminal
motivate ;echo                    # Random Motivational Quotes
# header ;echo                      # Header for adityastomar67
set -o vi                         # Vi-mode

source $HOME/.zsh/tmux.zsh
