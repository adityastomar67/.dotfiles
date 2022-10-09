# ░░░███████╗░██████╗██╗░░██╗██████╗░░█████╗░
# ░░░╚════██║██╔════╝██║░░██║██╔══██╗██╔══██╗
# ░░░░░███╔═╝╚█████╗░███████║██████╔╝██║░░╚═╝
# ░░░██╔══╝░░░╚═══██╗██╔══██║██╔══██╗██║░░██╗
# ██╗███████╗██████╔╝██║░░██║██║░░██║╚█████╔╝
# ╚═╝╚══════╝╚═════╝░╚═╝░░╚═╝╚═╝░░╚═╝░╚════╝░

## If you come from bash you might have to change your $PATH.
if [ ! -f "$HOME/.zshrc" ]; then
    touch "$HOME/.zshrc"
fi

## Sourcing setup files
while read file
do
  [ -f "$HOME/zsh/$file.zsh" ] && source "$HOME/zsh/$file.zsh"
done <<-EOF
    plugs
    # theme
    env
    opts
    keys
    prompt
    fzf
EOF

## Directories Generation if not present already.
while read directory
do
  [ ! -d "$HOME/$directory" ] && command mkdir -p $HOME/$directory
done <<-EOF
Downloads/git-repos
Downloads/torrents
Workspace
.Trash
EOF

## Sourcing other files
[ -f "$HOME/.aliases" ]    && source ~/.aliases     # Aliases - For a full list of active aliases, run `alias`.
[ -f "$HOME/.functions" ]  && source ~/.functions   # functions to improve productivity

echo "
# This file was created by the dotfiles sourced zshrc by adityastomar67.
# Do not edit the file directly. Instead, add any settings overrides in this file.
if [ -r ~/zsh/.zshrc ]; then
    source ~/zsh/.zshrc
fi
" > $HOME/.zshrc

## Calling scrpits and Operations
echo -en "\x1b[2J\x1b[1;1H" ;echo # For faster clearing the Terminal
motivate ;echo                    # Random Motivational Quotes
# header ;echo                      # Header for adityastomar67
set -o vi                         # Vi-mode

## Tmux Launching
if [ -t 0 ] && [[ -z $TMUX ]] && [[ $- = *i* ]]; then command tmux -2; fi # -2 flag for TMUX to enable 256 colors, use exec in place of command to make terminal close after exiting

# To work on
# if [[ -z $TMUX ]]; then
        
#    if [[ $(tmux list-sessions | wc -l) -ne 0 ]]; then
#
#        if [[ $(tmux list-sessions -F"#{?session_attached,,x}" | grep "x" | wc -l) -eq 1 ]]; then
#            tmux attach-session -t $(tmux list-sessions -F"#{?session_attached,,#S}"  )
#            return
#        else
#            printf '\033[32;1mCurrent \033[33;1mtmux \033[32;1msessions\033[0m:\n'
#            tmux list-sessions -F"#S - (#{?session_attached,Attached,Not Attached})"
#            printf '\033[34;1mAttach session?\033[0;m: [\033[35;1mname\033[0m] \033[37;2m(empty if none)\033[0m: '
#
#        fi
#
#    else
#        printf '\033[34;1mNo \033[33;1mtmux \033[34;1msessions active\n'
#        printf '\033[34;1mCreate new session?\033[0;m: [\033[35;1mname\033[0m] \033[37;2m(empty if none)\033[0m: '
#    fi
#
#    read session
#
#    if [[ -n $session ]]; then
#        if tmux list-sessions -F"#S" | grep -q "$session"; then
#            tmux attach-session -t $session 
#            return
#        elif [[ $session == new ]]; then
#            tmux new-session
#            return
#        else
#            tmux new-session -s $session
#            return
#        fi
#    fi
#
#    return
#fi
