OMZ_HOME="$HOME/.oh-my-zsh"
ZINIT_HOME="$HOME/.zinit"

## zinit setup
if [ ! -d "$ZINIT_HOME" ]
then
    echo "ZINIT not found. Cloning..."
    git clone --depth 1 https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

source "$ZINIT_HOME/zinit.zsh"
alias use='zinit light'
alias snip='zinit snippet'
alias ice='zinit ice'
alias load='zinit load'

ice depth"1"
use zsh-users/zsh-completions

autoload compinit
compinit

use hlissner/zsh-autopair
use zdharma-continuum/fast-syntax-highlighting
use MichaelAquilina/zsh-you-should-use
use zsh-users/zsh-autosuggestions
use Aloxaf/fzf-tab
# use marlonrichert/zsh-autocomplete

ice wait'3' lucid
load zsh-users/zsh-history-substring-search

ice wait'2' lucid
load zdharma-continuum/history-search-multi-word

# ice wait'5' lucid
# snip https://gist.githubusercontent.com/hightemp/5071909/raw/
unalias use snip ice load

## oh-my-zsh setup
if [ ! -d "$OMZ_HOME" ]
then
    echo "OH-MY-ZSH not found. Cloning..."
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

plugins=(
  z
  git
  history
  web-search
  copybuffer
  dirhistory
)
source "$OMZ_HOME/oh-my-zsh.sh"
