## This file has been generated by regen.py
## Changes may be overwritten the next time 
## configs are re-generated

# Colors
# black
foreground='#d4d4d5'
background='#101317'

base00='#171C21'
base08='#949494'

# red
base01='#f87070'
base09='#f87070'

# green
base02='#79dcaa'
base10='#36c692'

# yellow
base03='#ffe59e'
base11='#ffe59e'

# blue
base04='#7ab0df'
base12='#7ab0df'

# magenta
base05='#c397d8'
base13='#b77ee0'

# cyan
base06='#70c0ba'
base14='#54ced6'

# white
base07='#d4d4d5'
base15='#ffffff'

## Theme.sh Config
if command -v theme.sh > /dev/null; then
	[ -e ~/.theme_history ] && theme.sh "$(theme.sh -l|tail -n1)"

    #Optional
    Bind C-o to the last theme.
	last_theme() {
		theme.sh "$(theme.sh -l|tail -n2|head -n1)"
	}
	zle -N last_theme
	bindkey '^O' last_theme
	alias th='theme.sh -i'

    #Interactively load a light theme
	alias thl='theme.sh --light -i'

    #Interactively load a dark theme
	alias thd='theme.sh --dark -i'
fi

# vim:filetype=zsh