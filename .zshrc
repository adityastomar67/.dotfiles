#               __              
# .-----.-----.|  |--.----.----.
# |-- __|__ --||     |   _|  __|
# |_____|_____||__|__|__| |____|
#
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Basic stuff 
# source ~/.config/zsh/.zprofile #.zshenv stuff

#################### EXPORTS:BEGIN ####################
export TERM="xterm-256color"
export HISTFILE=~/.config/zsh/.zsh_history
export PATH=~/.local/bin:$PATH
export PATH=~/.scripts:$PATH #making my scripts run without typing the whole path
export EDITOR='nvim'
export TERMINAL='alacritty'
export BROWSER='chrome'
export MANPAGER='nvim +Man!'
export ZSH=$HOME/.oh-my-zsh  # Path to your oh-my-zsh installation.
#################### EXPORTS:END ####################

# Directory
[ ! -d "$HOME/Downloads/git-repos" ] && mkdir $HOME/Downloads/git-repos
[ ! -d "$HOME/Downloads/torrents" ] && mkdir $HOME/Downloads/torrents

############### THEMES FOR ZSH ###############
# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes

# ZSH_THEME="daveverwer"
# ZSH_THEME="robbyrussell"
# ZSH_THEME="agnoster"   	# powerline
# ZSH_THEME="dstufft"
ZSH_THEME="spaceship"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME="spaceship"
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

##Theme.sh Config
#if command -v theme.sh > /dev/null; then
#	[ -e ~/.theme_history ] && theme.sh "$(theme.sh -l|tail -n1)"
#
#	# Optional
#
#	# Bind C-o to the last theme.
#	last_theme() {
#		theme.sh "$(theme.sh -l|tail -n2|head -n1)"
#	}
#
#	zle -N last_theme
#	bindkey '^O' last_theme
#
#	alias th='theme.sh -i'
#
#	# Interactively load a light theme
#	alias thl='theme.sh --light -i'
#
#	# Interactively load a dark theme
#	alias thd='theme.sh --dark -i'
#fi
############### END ###############

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Basic zsh settings
# PATH=$PATH:$HOME/.scripts #making my scripts run without typing the whole path
bindkey -v # vi-mode
autoload -Uz compinit && compinit #need the next two lines for case insensitive tab completion
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}'

# Prompt Settings
declare -a PROMPTS
PROMPTS=(    
     "❍"
     "▶"
     ">>>"
     "-->"
     "➤"
   )
RANDOM=$$$(date +%s)
ignition=${PROMPTS[$RANDOM % ${#RANDOM[*]}+1]}
PROMPT='%F{green}$ignition%f %F{yellow}%1~%f ' 

# Git Settings
autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
RPROMPT=\$vcs_info_msg_0_
zstyle ':vcs_info:git:*' formats '%F{yellow}(%b)%r%f'
zstyle ':vcs_info:*' enable git

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
plugins=(
    zsh-autosuggestions 
    git 
    history 
    sudo 
    web-search 
    copydir 
    copyfile 
    copybuffer 
    dirhistory
  )

# source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.

# On-demand rehash
zshcache_time="$(date +%s%N)"
autoload -Uz add-zsh-hook
rehash_precmd() {
  if [[ -a /var/cache/zsh/pacman ]]; then
    local paccache_time="$(date -r /var/cache/zsh/pacman +%s%N)"
    if (( zshcache_time < paccache_time )); then
      rehash
      zshcache_time="$paccache_time"
    fi
  fi
}
add-zsh-hook -Uz precmd rehash_precmd

#################### FUNCTIONS:BEGIN ####################
# Function extract for common file formats
SAVEIFS=$IFS
IFS=$(echo -en "\n\b")
function extract {
 if [ -z "$1" ]; then
    # display usage if no parameters given
    echo "Usage: extract <path/file_name>.<zip|rar|bz2|gz|tar|tbz2|tgz|Z|7z|xz|ex|tar.bz2|tar.gz|tar.xz>"
    echo "       extract <path/file_name_1.ext> [path/file_name_2.ext] [path/file_name_3.ext]"
 else
    for n in "$@"
    do
      if [ -f "$n" ] ; then
          case "${n%,}" in
            *.cbt|*.tar.bz2|*.tar.gz|*.tar.xz|*.tbz2|*.tgz|*.txz|*.tar)
                         tar xvf "$n"       ;;
            *.lzma)      unlzma ./"$n"      ;;
            *.bz2)       bunzip2 ./"$n"     ;;
            *.cbr|*.rar)       unrar x -ad ./"$n" ;;
            *.gz)        gunzip ./"$n"      ;;
            *.cbz|*.epub|*.zip)       unzip ./"$n"       ;;
            *.z)         uncompress ./"$n"  ;;
            *.7z|*.arj|*.cab|*.cb7|*.chm|*.deb|*.dmg|*.iso|*.lzh|*.msi|*.pkg|*.rpm|*.udf|*.wim|*.xar)
                         7z x ./"$n"        ;;
            *.xz)        unxz ./"$n"        ;;
            *.exe)       cabextract ./"$n"  ;;
            *.cpio)      cpio -id < ./"$n"  ;;
            *.cba|*.ace)      unace x ./"$n"      ;;
            *)
                         echo "extract: '$n' - unknown archive method"
                         return 1
                         ;;
          esac
      else
          echo "'$n' - file does not exist"
          return 1
      fi
    done
fi
}
IFS=$SAVEIFS

# navigation
up () {
  local d=""
  local limit="$1"

  # Default to limit of 1
  if [ -z "$limit" ] || [ "$limit" -le 0 ]; then
    limit=1
  fi

  for ((i=1;i<=limit;i++)); do
    d="../$d"
  done

  # perform cd. Show error if cd fails
  if ! cd "$d"; then
    echo "Couldn't go up $limit dirs.";
  fi
}

# Create a new React App
react-app() {
  npx create-react-app $1
  cd $1
  npm i -D eslint
  npm i -D eslint-config-prettier eslint-plugin-prettier
  npm i -D eslint-config-airbnb eslint-plugin-import eslint-plugin-jsx-a11y eslint-plugin-react eslint-plugin-react-hooks
  cp "${HOME}/.eslintrc.json" .
  cp "${HOME}/.prettierrc" .
  echo $1 > README.md
  rm -rf yarn.lock
  cd src
  rm -f App.css App.test.js index.css logo.svg serviceWorker.js
  mkdir components views 
  git add -A
  git commit -m "Initial commit."
  cd ..
  clear
  code .
}

editZsh(){
    lvim ~/.zshrc
    source ~/.zshrc
    backupToDrive ~/.zshrc
    echo "New .zshrc sourced."
}

backupToDrive(){
    cp "$1" /Users/<username>/Google\ Drive/Config/.zshrc
    echo "New .zshrc backed up to Google Drive."
}

# function for find strings in files
fif() {
    findr --type f $1|xargs grep -n -i  $2
}
#################### FUNCTIONS:END ####################

## Aliases
source ~/.aliases

# VI MODE
bindkey -v

#################### Color Script ####################
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

# Calling scrpits
clear && motivate
