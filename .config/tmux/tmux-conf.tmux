# ░░░████████╗███╗░░░███╗██╗░░░██╗██╗░░██╗░░░░█████╗░░█████╗░███╗░░██╗███████╗
# ░░░╚══██╔══╝████╗░████║██║░░░██║╚██╗██╔╝░░░██╔══██╗██╔══██╗████╗░██║██╔════╝
# ░░░░░░██║░░░██╔████╔██║██║░░░██║░╚███╔╝░░░░██║░░╚═╝██║░░██║██╔██╗██║█████╗░░
# ░░░░░░██║░░░██║╚██╔╝██║██║░░░██║░██╔██╗░░░░██║░░██╗██║░░██║██║╚████║██╔══╝░░
# ██╗░░░██║░░░██║░╚═╝░██║╚██████╔╝██╔╝╚██╗██╗╚█████╔╝╚█████╔╝██║░╚███║██║░░░░░
# ╚═╝░░░╚═╝░░░╚═╝░░░░░╚═╝░╚═════╝░╚═╝░░╚═╝╚═╝░╚════╝░░╚════╝░╚═╝░░╚══╝╚═╝░░░░░

# ----------------------------=== Key Bindings ===--------------------------

# --------=== unbind default prefix and set custom prefix
unbind C-b
set -g prefix C-Space
bind C-Space send-prefix

# --------=== reload config file
bind r source-file ~/.tmux.conf \; display "Config Reloaded!"

# --------=== split window and fix path for tmux 1.9
bind | split-window -h -c "#{pane_current_path}"
bind _ split-window -v -c "#{pane_current_path}"

# --------=== synchronize all panes in a window
bind y setw synchronize-panes

# --------=== pane movement shortcuts
bind h select-pane -L
bind j select-pane -D
bind k select-pane -U
bind l select-pane -R

bind -r C-h select-window -t :-
bind -r C-l select-window -t :+

# --------=== Resize pane shortcuts
bind -r H resize-pane -L 3
bind -r J resize-pane -D 3
bind -r K resize-pane -U 3
bind -r L resize-pane -R 3

# --------=== Kill pane/window/session shortcuts
bind x kill-pane
bind X kill-window
bind C-x confirm-before -p "kill other windows? (y/n)" "kill-window -a"
bind Q confirm-before -p "kill-session #S? (y/n)" kill-session

# --------=== Hide status bar on demand
bind C-z if -F '#{s/off//:status}' 'set status off' 'set status on'

# --------=== enable mouse support for switching panes/windows
setw -g mouse on

# --------=== set vi mode for copy mode
setw -g mode-keys vi

# --------=== more settings to make copy-mode more vim-like
unbind [
bind Escape copy-mode
unbind p
bind p paste-buffer
bind -T copy-mode-vi v send -X begin-selection

if-shell "uname | grep -q Darwin" {
    bind -T copy-mode-vi y send -X copy-pipe-and-cancel 'tmux save-buffer - | pbcopy'; \
    bind C-c run 'tmux save-buffer - | pbcopy'; \
    bind C-v run 'tmux set-buffer "$(pbpaste)"; tmux paste-buffer'
}

if-shell '[[ $(uname -s) = Linux ]]' {
    bind -T copy-mode-vi y send -X copy-pipe-and-cancel 'xclip -i -sel clipboard'; \
    bind C-c run "tmux save-buffer - | xclip -i -sel clipboard"; \
    bind C-v run 'tmux set-buffer "$(xclip -o -sel clipboard)"; tmux paste-buffer'
}

# ----------------------------=== Theme ===--------------------------

# NOTE: you can use vars with $<var> and ${<var>} as long as the str is double quoted: ""
# WARNING: hex colors can't contain capital letters

# --> Catppuccin ColorScheme
thm_transparent_bg_color="default"
thm_bg="#1e1e28"
thm_fg="#dadae8"
thm_cyan="#c2e7f0"
thm_black="#15121c"
thm_gray="#332e41"
thm_magenta="#c6aae8"
thm_pink="#e5b4e2"
thm_red="#e38c8f"
thm_green="#b1e3ad"
thm_yellow="#ebddaa"
thm_blue="#a4b9ef"
thm_orange="#f9c096"
thm_black4="#575268"

# --------=== status
set -g status-position bottom
set -g status off
set-option -g status-style bg="${thm_transparent_bg_color}"
set -g status-justify "centre"
set -g status-left-length "100"
set -g status-right-length "100"

# --------=== messages
set -g message-style fg="${thm_cyan}",bg="${thm_transparent_bg_color}",align="centre"
set -g message-command-style fg="${thm_cyan}",bg="${thm_gray}",align="centre"

# --------=== panes
setw -g pane-base-index 1
set -g pane-border-style fg="${thm_gray}"
set -g pane-active-border-style fg="${thm_blue}"

# --------=== windows
set -g renumber-windows on
set -g base-index 1
setw -g window-status-activity-style fg="${thm_fg}",bg="${thm_bg}",none
setw -g window-status-separator ""
setw -g window-status-style fg="${thm_fg}",bg="${thm_bg}",none
setw -g aggressive-resize on
# set-window-option -g automatic-rename on

# --------=== Statusline
set-option -g set-titles on
set-option -g set-titles-string "#T - #W"
set -g status-left ""
set -g status-right ""
# set -g status-right "#[fg=$thm_pink,bg=$thm_bg,nobold,nounderscore,noitalics]#[fg=$thm_bg,bg=$thm_pink,nobold,nounderscore,noitalics] #[fg=$thm_fg,bg=$thm_gray] #W #{?client_prefix,#[fg=$thm_red],#[fg=$thm_green]}#[bg=$thm_gray]#{?client_prefix,#[bg=$thm_red],#[bg=$thm_green]}#[fg=$thm_bg] #[fg=$thm_fg,bg=$thm_gray] #S "

# --------=== current_dir
setw -g window-status-format "#[fg=$thm_bg,bg=$thm_blue] #I #[fg=$thm_fg,bg=$thm_gray] #{b:pane_current_path} "
setw -g window-status-current-format "#[fg=$thm_bg,bg=$thm_orange] #I #[fg=$thm_fg,bg=$thm_bg] #{b:pane_current_path} "

# --------=== parent_dir/current_dir
# setw -g window-status-format "#[fg=colour232,bg=colour111] #I #[fg=colour222,bg=colour235] #(echo '#{pane_current_path}' | rev | cut -d'/' -f-2 | rev) "
# setw -g window-status-current-format "#[fg=colour232,bg=colour208] #I #[fg=colour255,bg=colour237] #(echo '#{pane_current_path}' | rev | cut -d'/' -f-2 | rev) "

# --------=== Modes
setw -g clock-mode-colour "${thm_blue}"
setw -g mode-style "fg=${thm_pink} bg=${thm_black4} bold"

# --------=== Terminal
set -g default-terminal "xterm-256color" # tmux display things in 256 colors
# set-option -g default-terminal "screen-256color" # Doesn't support for italics in terminal
# set -as terminal-overrides ',xterm*:Tc:sitm=\E[3m'
set-option -sa terminal-overrides ',screen*:RGB'

# --------=== Extras
bind-key a send-prefix # for nested tmux sessions
set -g history-limit 20000
setw -g monitor-activity off
set -g visual-activity off
unbind =
bind = select-layout tiled
set -sg escape-time 0
set-option -g focus-events on


# ----------------------------=== Plugins ===--------------------------

# set -g @plugin 'ofirgall/tmux-window-name'
# set -g @plugin 'tmux-plugins/tmux-resurrect'
# set -g @plugin 'tmux-plugins/tmux-continuum'

# set -g @continuum-restore 'on'

# --------=== Plugin Manager
if "test ! -d ~/.tmux/plugins/tpm" \
   "run 'git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm && ~/.tmux/plugins/tpm/bin/install_plugins'"

run '~/.tmux/plugins/tpm/tpm'
