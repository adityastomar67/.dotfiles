#    ███████╗ ██████╗██╗  ██╗██████╗  █████╗
#    ╚════██║██╔════╝██║  ██║██╔══██╗██╔══██╗
#      ███╔═╝╚█████╗ ███████║██████╔╝██║  ╚═╝
#    ██╔══╝   ╚═══██╗██╔══██║██╔══██╗██║  ██╗
# ██╗███████╗██████╔╝██║  ██║██║  ██║╚█████╔╝
# ╚═╝╚══════╝╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝ ╚════╝

## Main entry point file for the Z-Shell
if [ ! -f "$HOME/.zshrc" ]; then
    touch "$HOME/.zshrc"

    echo "# This file was created by the dotfiles sourced zshrc by adityastomar67.
    # Do not edit the file directly. Instead, add any settings overrides in this file.
    if [ -r ~/.config/.zsh/.zshrc ]; then
        source ~/.config/.zsh/.zshrc
    fi
    " > $HOME/.zshrc
fi

## Sourcing config files
while read file
do
  [ -f "$HOME/.config/.zsh/$file.zsh" ] && source "$HOME/.config/.zsh/$file.zsh"
done <<-EOF
    plugs
    theme
    env
    opts
    keys
    prompt
    fzf
EOF

## Explicitly launching of tmux
source $HOME/.config/.zsh/tmux.zsh

## Sourcing other files
[ -f "$HOME/.dotfiles/.aliases" ]    && source $HOME/.dotfiles/.aliases     # Aliases - For a full list of active aliases, run `alias`.
[ -f "$HOME/.dotfiles/.functions" ]  && source $HOME/.dotfiles/.functions   # functions to improve productivity
[ -f "$HOME/.dotfiles/.temp_src" ]   && source "$HOME/.dotfiles/.temp_src"

## Calling scrpits and Operations
echo -en "\x1b[2J\x1b[1;1H" ;echo # For faster clearing the Terminal
motivate ;echo                    # Random Motivational Quotes
# header ;echo                      # Header for adityastomar67
set -o vi                         # Vi-mode
