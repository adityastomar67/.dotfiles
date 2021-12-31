# ░░░███████╗░██████╗██╗░░██╗██████╗░░█████╗░
# ░░░╚════██║██╔════╝██║░░██║██╔══██╗██╔══██╗
# ░░░░░███╔═╝╚█████╗░███████║██████╔╝██║░░╚═╝
# ░░░██╔══╝░░░╚═══██╗██╔══██║██╔══██╗██║░░██╗
# ██╗███████╗██████╔╝██║░░██║██║░░██║╚█████╔╝
# ╚═╝╚══════╝╚═════╝░╚═╝░░╚═╝╚═╝░░╚═╝░╚════╝░

## If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

### Basic stuff 
# source ~/.config/zsh/.zprofile #.zshenv stuff

### Exports
export TERM="xterm-256color"               # Default term
export HISTFILE=~/.config/zsh/.zsh_history # Path to History File
export PATH=~/.local/bin:$PATH             # Bin Path to run Commands
export PATH=~/.scripts:$PATH               # Making my scripts run without typing the whole path
export ZSH=$HOME/.oh-my-zsh                # Path to your oh-my-zsh installation.
# export EDITOR='nvim'                       # Default Code Editor
# export TERMINAL='alacritty'                # default Terminal
# export BROWSER='google-chrome-stable'      # Default Browser
# export MANPAGER='nvim +Man!'               # Manual Page in NVim

### Directory
[ ! -d "$HOME/Downloads/git-repos" ] && mkdir $HOME/Downloads/git-repos
[ ! -d "$HOME/Downloads/torrents" ] && mkdir $HOME/Downloads/torrents

### Functions
source ~/.functions

### Aliases - For a full list of active aliases, run `alias`.
source ~/.aliases

### Vi Mode
bindkey -v

### Basic zsh settings

### Themes
## Set name of the theme to load --- if set to "random", it will load a random theme each time oh-my-zsh is loaded, in which case, to know which specific one was loaded, run: echo $RANDOM_THEME
## See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="daveverwer"
# ZSH_THEME="robbyrussell"
# ZSH_THEME="agnoster" 
# ZSH_THEME="dstufft"
ZSH_THEME="spaceship"

## Set list of themes to pick from when loading at random Setting this variable when ZSH_THEME="spaceship" a theme from this variable instead of looking in $ZSH/themes/
## If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

## Theme.sh Config
# if command -v theme.sh > /dev/null; then
#	[ -e ~/.theme_history ] && theme.sh "$(theme.sh -l|tail -n1)"
## Optional
## Bind C-o to the last theme.
#	last_theme() {
#		theme.sh "$(theme.sh -l|tail -n2|head -n1)"
#	}
#	zle -N last_theme
#	bindkey '^O' last_theme
#	alias th='theme.sh -i'
## Interactively load a light theme
#	alias thl='theme.sh --light -i'
## Interactively load a dark theme
#	alias thd='theme.sh --dark -i'
#fi

### Prompt Settings
declare -a PROMPTS
PROMPTS=(    
     " "
     "▶"
     ">>>"  
     "-->"
     "➤"
     "󰮯 "
   )
# RANDOM=$$$(date +%s)
# ignition=${PROMPTS[$RANDOM % ${#RANDOM[*]}+1]}
ignition=${PROMPTS[1 + $RANDOM%6]}
PROMPT='%F{yellow}$ignition%f %F{blue}%1~%f ' 

## Git Prompt Settings
autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
RPROMPT=\$vcs_info_msg_0_
zstyle ':vcs_info:git:*' formats '%F{blue}(%b)%r%f '
zstyle ':vcs_info:*' enable git

## Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

## Uncomment the following line to use hyphen-insensitive completion. Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

## Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

## Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

## Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

## Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

## Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

## Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

## Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

## Uncomment the following line to display red dots whilst waiting for completion.
## You can also set it to another string to have that shown instead of the default red dots. e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
## Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

## Uncomment the following line if you want to disable marking untracked files under VCS as dirty. This makes repository status check for large repositories much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

## Uncomment the following line if you want to change the command execution time stamp shown in the history command output.
## You can set one of the optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd" or set a custom format using the strftime function format specifications, see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

## Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

### Plugins
## Standard plugins can be found in $ZSH/plugins/ & Custom plugins may be added to $ZSH_CUSTOM/plugins/
plugins=(
    zsh-autocomplete 
    git 
    history
    web-search
    copybuffer 
    dirhistory
  )
# source $ZSH/oh-my-zsh.sh

autoload -Uz compinit && compinit                                  # need the next two lines for case insensitive tab completion
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}'       # Matchlist

### User configuration
# export MANPATH="/usr/local/man:$MANPATH"

## You may need to manually set your language environment
# export LANG=en_US.UTF-8

## Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='nvim'
# else
#   export EDITOR='lvim'
# fi

## Compilation flags
# export ARCHFLAGS="-arch x86_64"

### On-demand rehash
# zshcache_time="$(date +%s%N)"
# autoload -Uz add-zsh-hook
# rehash_precmd() {
#   if [[ -a /var/cache/zsh/pacman ]]; then
#     local paccache_time="$(date -r /var/cache/zsh/pacman +%s%N)"
#     if (( zshcache_time < paccache_time )); then
#       rehash
#       zshcache_time="$paccache_time"
#     fi
#   fi
# }
# add-zsh-hook -Uz precmd rehash_precmd

### Color Script
# colorscript --random
# colorscript --exec bars
# colorscript --exec alpha
# colorscript --exec blocks1
# colorscript --exec crunch
# colorscript --exec crunchbang-mini
# colorscript --exec dna
# colorscript --exec elfman
# colorscript --exec faces
# colorscript --exec fade
# colorscript --exec jangofett
# colorscript --exec panes
# colorscript --exec rails
# colorscript --exec square
# colorscript --exec tanks
# colorscript --exec tiefighter1row
# colorscript --exec tux

### Calling scrpits
clear && motivate
