# ░░░███████╗░██████╗██╗░░██╗██████╗░░█████╗░
# ░░░╚════██║██╔════╝██║░░██║██╔══██╗██╔══██╗
# ░░░░░███╔═╝╚█████╗░███████║██████╔╝██║░░╚═╝
# ░░░██╔══╝░░░╚═══██╗██╔══██║██╔══██╗██║░░██╗
# ██╗███████╗██████╔╝██║░░██║██║░░██║╚█████╔╝
# ╚═╝╚══════╝╚═════╝░╚═╝░░╚═╝╚═╝░░╚═╝░╚════╝░

## If you come from bash you might have to change your $PATH.

## Sourcing setup files
while read file
do
  [ -f "$HOME/zsh/$file.zsh" ] && source "$HOME/zsh/$file.zsh"
done <<-EOF
#theme
env
#plugs
opts
keys
prompt
#fzf
EOF

## Directories Generation if not present already.
while read directory
do
  [ ! -d "$HOME/$directory" ] && command mkdir $HOME/$directory
done <<-EOF
Downloads/git-repos
Downloads/torrents
Workspace
Study-Material
.nano-backups
.Trash
EOF

plugins=(
  z
  zsh-autosuggestions
  fast-syntax-highlighting
  git
  history
  web-search
  copybuffer
  dirhistory
)
source ~/.oh-my-zsh/oh-my-zsh.sh # For plugins

## Sourcing other files
[ -f "$HOME/.aliases" ]                       && source ~/.aliases                       # Aliases - For a full list of active aliases, run `alias`.
[ -f "$HOME/.functions" ]                     && source ~/.functions                     # functions to improve productivity
[ -f "$HOME/src/bitwarden_completion.zsh" ]   && source ~/src/bitwarden_completion.zsh   # For Bitwarden completion
[ -f "$HOME/.alias_temp" ]                    && source $HOME/.alias_temp                # Temporary Aliases for Trials
# [ -f "$HOME/src/exercism_completion.zsh" ]    && source ~/src/exercism_completion.zsh    # For exercism completion
# [ -f "$HOME/src/spotify-tui_completion.zsh" ] && source ~/src/spotify-tui_completion.zsh # For Spotify-TUI completion

## Calling scrpits and Operations
echo -en "\x1b[2J\x1b[1;1H" ;echo # For faster clearing the Terminal
motivate ;echo                    # Random Motivational Quotes
# header ;echo                      # Header for adityastomar67
set -o vi                         # Vi-mode

## Tmux Launching
if [ -t 0 ] && [[ -z $TMUX ]] && [[ $- = *i* ]]; then command tmux -2; fi # -2 flag for TMUX to enable 256 colors, use exec in place of command to make terminal close after exiting
