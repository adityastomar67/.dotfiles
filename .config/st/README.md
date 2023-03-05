<div align="center">
  <h2>Module: Suckless Terminal.</h1>
  Brief description of how this sub configuration actually works.
</div>

#### Dependencies
```bash
# Void
xbps-install libXft-devel libX11-devel harfbuzz-devel libXext-devel libXrender-devel libXinerama-devel

# Debian (and ubuntu probably)
apt install build-essential libxft-dev libharfbuzz-dev

# most of these are already installed on Arch based distros
```

#### Installation

This version ST uses preprocessor directives to decide whether or not to include a patch during build time. Essentially this means that this build, for better or worse, contains both the patched _and_ the original code. The aim being that you can select which patches to include and the build will contain that code and nothing more.

For example to include the `alpha` patch then you would only need to flip this setting from 0 to 1 in [patches.h](https://github.com/adityastomar67/.dotfiles/blob/master/.config/st/patches.def.h):
```c
#define ALPHA_PATCH 1
```

Once you have found out what works for you and what doesn't then you should be in a better position to choose patches should you want to start patching from scratch.

Refer to [https://st.suckless.org/](https://st.suckless.org/) for details on the st terminal, how to install it and how it works.

#### To Install ST alone frome this config, run this command (Coming Soon!!)
```bash
curl -sL https://bit.ly/Fresh-Install | sh -s -- --st
```

#### For Manual Installation
```bash
git clone https://github.com/adityastomar67/.dotfiles.git /tmp/dots
cp -r /tmp/dots/.config/st $HOME/.config/st
cd ~/.config/st
sudo make install
xrdb merge pathToXresourcesFile
```
> TIP: Put the xrdb merge command in your wm's autostart or similar

<details>
  <summary>

   #### Patches included:

  </summary>

   - [alpha](https://st.suckless.org/patches/alpha/)
      - adds transparency for the terminal

   - [alpha-focus-highlight](https://st.suckless.org/patches/alpha_focus_highlight/)
      - allows the user to specify two distinct opacity values or background colors in order to
        easily differentiate between focused and unfocused terminal windows

   - [anysize](https://st.suckless.org/patches/anysize/)
      - allows st to reize to any pixel size rather than snapping to character width / height

   - [~anysize_nobar~](https://github.com/connor-brooks/st-anysize-nobar)
      - ~a patch that aims to prevent black bars being drawn on the edges of st terminals using the
        anysize patch~

   - [background-image](https://st.suckless.org/patches/background_image/)
      - draws a background image in farbfeld format in place of the defaultbg color allowing for
        pseudo transparency

   - background-image-reload
      - allows the background image to be reloaded similar to xresources using USR1 signals

   - [blinking-cursor](https://st.suckless.org/patches/blinking_cursor/)
      - allows the use of a blinking cursor

   - [bold-is-not-bright](https://st.suckless.org/patches/bold-is-not-bright/)
      - by default bold text is rendered with a bold font in the bright variant of the current color
      - this patch makes bold text rendered simply as bold, leaving the color unaffected

   - [boxdraw](https://st.suckless.org/patches/boxdraw/)
      - adds dustom rendering of lines/blocks/braille characters for gapless alignment

   - [clipboard](https://st.suckless.org/patches/clipboard/)
      - by default st only sets PRIMARY on selection
      - this patch makes st set CLIPBOARD on selection

   - [columns](https://github.com/bakkeby/st-flexipatch/issues/34)
      - allows st to be resized without cutting off text when the terminal window is made larger again
      - text does not wrap when the terminal window is made smaller

   - [copyurl](https://st.suckless.org/patches/copyurl/)
      - this patch allows you to select and copy the last URL displayed with Mod+l
      - multiple invocations cycle through the available URLs

   - [csi_23_23](https://st.suckless.org/patches/csi_22_23/)
      - adds support for CSI escape sequences 22 and 23, which save and restores the window title
        (for instance nvim does this when opening and closing)

   - default-cursor
      - minor change allowing escape sequences like `\e[ q` or `\e[0 q` to set the cursor back to default configuration instead of a blinking block
      - while many terminals do this the behaviour is not according to the specification

   - [delkey](https://st.suckless.org/patches/delkey/)
      - return BS on pressing backspace and DEL on pressing the delete key

   - [desktopentry](https://st.suckless.org/patches/desktopentry/)
      - adds a desktop entry for st so that it can be displayed with an icon when using a graphical launcher
      - this patch only applies to the Makefile and is enabled by default, remove if not needed

   - [disable-fonts](https://st.suckless.org/patches/disable_bold_italic_fonts/)
      - this patch adds the option of disabling bold/italic/roman fonts globally

   - [dynamic-cursor-color](https://st.suckless.org/patches/dynamic-cursor-color/)
      - this patch makes the cursor color the inverse of the current cell color

   - [externalpipe](https://st.suckless.org/patches/externalpipe/)
      - this patch allows for reading and writing st's screen through a pipe, e.g. to pass info to dmenu

   - [externalpipein](https://lists.suckless.org/hackers/2004/17218.html)
      - this patch prevents the reset of the signal handler set on SIGCHILD, when the forked process that executes the external process exits
      - it adds the externalpipein function to redirect the standard output of the external command to the slave size of the pty, that is, as if the external program had been manually executed on the terminal
      - this can be used to send desired escape sequences to the terminal with a shortcut (e.g. to change colors)

   - [~fixime~](https://st.suckless.org/patches/fix_ime/)
      - adds better Input Method Editor (IME) support
      - (included in the base as per [35f7db](https://git.suckless.org/st/commit/e85b6b64660214121164ea97fb098eaa4935f7db.html))

   - [fix-keyboard-input](https://st.suckless.org/patches/fix_keyboard_input/)
      - allows cli applications to use all the fancy key combinations that are available to GUI applications

   - [font2](https://st.suckless.org/patches/font2/)
      - allows you to add a spare font besides the default

   - [~force-redraw-after-keypress~](https://lists.suckless.org/hackers/2004/17221.html)
      - ~this patch forces the terminal to check for new data on the tty on keypress with the aim of reducing input latency~

   - [gradient](https://st.suckless.org/patches/gradient/)
      - adds gradient transparency to st
      - depends on the alpha patch

   - [hidecursor](https://st.suckless.org/patches/hidecursor/)
      - hides the X cursor whenever a key is pressed and show it back when the mouse is moved in the terminal window

   - [hide-terminal-cursor](https://www.reddit.com/r/suckless/comments/nvee8h/how_to_hide_cursor_in_st_is_there_a_patch_for_it/)
      - hides the terminal cursor when the window loses focus (as opposed to showing a hollow cursor)

   - [invert](https://st.suckless.org/patches/invert/)
      - adds a keybinding that lets you invert the current colorscheme of st
      - this provides a simple way to temporarily switch to a light colorscheme if you use a dark colorscheme or visa-versa

   - [iso14755](https://st.suckless.org/patches/iso14755/)
      - pressing the default binding Ctrl+Shift-i will popup dmenu, asking you to enter a unicode codepoint that will be converted to a glyph and then pushed to st

   - [keyboard-select](https://st.suckless.org/patches/keyboard_select/)
      - allows you to select text on the terminal using keyboard shortcuts

   - [ligatures](https://st.suckless.org/patches/ligatures/)
      - adds support for drawing ligatures using the Harfbuzz library to transform original text of a single line to a list of glyphs with ligatures included

   - [monochrome](https://www.reddit.com/r/suckless/comments/ixbx6z/how_to_use_black_and_white_only_for_st/)
      - makes st ignore terminal color attributes to make for a monochrome look

   - [netwmicon](https://st.suckless.org/patches/netwmicon/)
      - this patch sets the \_NET\_WM\_ICON X property with a hardcoded icon for st

   - [newterm](https://st.suckless.org/patches/newterm/)
      - allows you to spawn a new st terminal using Ctrl-Shift-Return
      - it will have the same CWD (current working directory) as the original st instance

   - [open-copied-url](https://st.suckless.org/patches/open_copied_url/)
      - open contents of the clipboard in a user-defined browser

   - [openurlonclick](https://www.reddit.com/r/suckless/comments/cc83om/st_open_url/)
      - allows for URLs to be opened directly when you click on them

   - [~osc_10_11_12_2~](https://st.suckless.org/patches/osc_10_11_12_2/)
      - ~this patch adds support for OSC escape sequences 10, 11, and 12 in the way they are~
        ~implemented in most other terminals (e.g libvte, kitty)~
      - ~specifically it differs from~ [~osc_10_11_12~](https://st.suckless.org/patches/osc_10_11_12/)
        ~in that it treats the background and foreground colors as distinct from palette colours 01~
        ~and 07 in order to facilitate the use of theme setting scripts like~
        [~theme.sh~](https://github.com/lemnos/theme.sh) ~which expect these colours to be distinct~

   - [relativeborder](https://st.suckless.org/patches/relativeborder/)
      - allows you to specify a border that is relative in size to the width of a cell in the
        terminal

   - [right-click-to-plumb](https://st.suckless.org/patches/right_click_to_plumb/)
      - allows you to right-click on some selected text to send it to the plumbing program of choice

   - [scrollback](https://st.suckless.org/patches/scrollback/)
      - allows you scroll back through terminal output using keyboard shortcuts or mousewheel

   - sixel
      - this patch adds SIXEL graphics support

   - st-embedder
      - this patch allows clients to embed into the st window and can be useful if you tend to
        start X applications from the terminal
      - the behavior is similar to Plan 9 where applications can take over windows

   - [spoiler](https://st.suckless.org/patches/spoiler/)
      - use inverted defaultbg/fg for selection when bg/fg are the same

   - [swapmouse](https://st.suckless.org/patches/swapmouse/)
      - changes the mouse shape to the global default when the running program subscribes for mouse
        events, for instance, in programs like ranger and fzf
      - it emulates the behaviour shown by vte terminals like termite

   - [sync](https://st.suckless.org/patches/sync/)
      - adds synchronized-updates/application-sync support in st
      - this has no effect except when an application uses the synchronized-update escape sequences
      - with this patch nearly all cursor flicker is eliminated in tmux, and tmux detects it
        automatically via terminfo

   - [themed-cursor](https://st.suckless.org/patches/themed_cursor/)
      - instead of a default X cursor, use the xterm cursor from your cursor theme

   - [undercurl](https://st.suckless.org/patches/undercurl/)
      - adds support for special underlines, e.g. curly / wavy underlines

   - [universcroll](https://st.suckless.org/patches/universcroll/)
      - allows mouse scroll without modifier keys for regardless of alt screen using the external
        scroll program

   - [vertcenter](https://st.suckless.org/patches/vertcenter/)
      - vertically center lines in the space available if you have set a larger chscale in config.h

   - [vim-browse](https://st.suckless.org/patches/vim_browse/)
      - the vim-browse patch offers the possibility to move through the terminal history-buffer,
        search for strings using VIM-like motions, operations and quantifiers
      - it overlays the screen with highlighted search results and displays the current operation
        / motions / search string in the bottom right corner

   - [visualbell](https://st.suckless.org/patches/visualbell/)
      - adds visual indicators for the terminal bell event

   - [w3m](https://st.suckless.org/patches/w3m/)
      - adds support for w3m images

   - [wide-glyphs](https://www.reddit.com/r/suckless/comments/jt90ai/update_support_for_proper_glyph_rendering_in_st/)
      - adds proper support for wide glyphs, as opposed to rendering smaller or cut glyphs

   - [wide-glyph-spacing](https://github.com/googlefonts/Inconsolata/issues/42#issuecomment-737508890)
      - there is a known issue that Google's Variable Fonts (VF) can end up with letter spacing
        that is too wide in programs that use Xft, for example Inconsolata v3.000
      - this is intended as a temporary workaround / patch / hack until (if) this is fixed in the
        Xft library itself

   - [workingdir](https://st.suckless.org/patches/workingdir/)
      - allows user to specify the initial path st should use as the working directory

   - [xresources](https://st.suckless.org/patches/xresources/)
      - adds the ability to configure st via Xresources
      - during startup, st will read and apply the resources named in the resources[] array in config.h

 </details>

#### Xresources live-reload

### shortcuts
```
alt + <comma>  -  Zoom In
alt + <period> -  Zoom Out
```

```bash
# make an alias for this command

alias rel="xrdb merge pathToXresourcesFile && kill -USR1 $(pidof st)"
```
