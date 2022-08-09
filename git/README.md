# Git Configuration

Your git configuration file is usually kept in your $HOME directory.

For example, on a MacOSX/Linux machine this is stored in ~/.gitconfig

# Set up your username / email address

``` bash
git config --global user.name "[name]"
git config --global user.email "[email address]"
```

# Enable helpful colorization of command line output

``` bash
git config --global color.ui auto
```

# Set your default editor

``` bash
git config --global core.editor "vim"
```

# Check your current git configuration

``` bash
git config --list --show-origin
# Query specific setting
git config user.name
```

# Set 'main' as default branch name from 'master'

```bash
git config --global init.defaultBranch main
```

# Git Aliases

There are two (perhaps more!) but mainly two ways to set up aliases for your git on your shell.

# Option 1, using a bash alias

## Stop the dreaded error pushing to remote when making your first push. Never again!
```bash
alias gp='git push -u origin HEAD'
```

## Push your local changes. Quick!!!
```bash
function acp() {
git add .
git commit -m "$1"
git push -u origin HEAD
}
```

## Create a new repo in a single command with readme and remote repository set up
``` bash
function gitnewrepo() {mkdir $1 && cd $1 && git init && hub create && touch README.md && echo "# " $1 >> README.md && git add . && git commit -m "init" && git push -u origin HEAD;}
```


# Option 2 Using a global git alias (place in your global .gitconfig)

## Add a nice alias for log (no newlines)
```bash
git config --global alias.l "log
    --graph
    --pretty=oneline
    --abbrev-commit
    --decorate"
git l
```

## Easily undo the last changes you made with a new git undo command
```bash
git config --global alias.undo 'reset HEAD~1 --mixed'
```

## View your last commit
```bash
git config --global alias.last 'log -1 HEAD --stat'
```

## Get a list of your git aliases
```bash
git config --global alias.gl 'config --global -l'
```

# How to -- Git Template

To add the template to your global git config is enter the following:

`git config --global commit.template path/to/your/file.txt`

*Now whenever you’re making a commit, instead of the typical git commit -m "A brief commit message", just enter git commit to open your default editor with the template in place. You’ll automatically have a guide to choose conventions from to create a structured message.*

The “header” of the commit message notes the type of the commit as docs and a brief description that does not exceed 60 characters to ensure readability (the commented lines are 60 characters long and act as guides for when to use a line break). The “body” optionally elaborates on the changes made, and the “footer” optionally notes any issue/PR the commit is related to. The final message will simply look like this:

*The final message will look like this*

```
docs: Update README with contributing instructions

Adds a CONTRIBUTING.md with PR best practices, code style
guide, and code of conduct for contributors.

Closes #9
```
# Vim Setup

*If you use Vim or Neovim, and you want to speed up the process even more, you can add this to your git config:*

```
# Neovim
git config --global core.editor "nvim +16 +startinsert"

# Vim
git config --global core.editor "vim +16 +startinsert"
```

This sets the default editor to Neovim (or Vim), and places the cursor on line 16 in Insert Mode as soon the editor opens. Now whenever you’re committing, when you type git commit, Neovim opens the template, places your cursor, and accepts typing input immediately. Also note that you can still use git commit -m "Your message" exactly as you did before, but the configuration will default to the template setup when you just type git commit.
