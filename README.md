<div align = "center">
   <a href="https://github.com/adityastomar67/.dotfiles/graphs/contributors">
   <img alt="People" src="https://img.shields.io/github/contributors/adityastomar67/.dotfiles?style=flat&color=ffaaf2&label=People"> </a>

   <a href="https://github.com/adityastomar67/.dotfiles/stargazers">
   <img alt="Stars" src="https://img.shields.io/github/stars/adityastomar67/.dotfiles?style=flat&color=98c379&label=Stars"></a>

   <a href="https://github.com/adityastomar67/.dotfiles/network/members">
   <img alt="Forks" src="https://img.shields.io/github/forks/adityastomar67/.dotfiles?style=flat&color=66a8e0&label=Forks"> </a>

   <a href="https://github.com/adityastomar67/.dotfiles/watchers">
   <img alt="Watches" src="https://img.shields.io/github/watchers/adityastomar67/.dotfiles?style=flat&color=f5d08b&label=Watches"> </a>

   <a href="https://github.com/adityastomar67/.dotfiles/pulse">
   <img alt="Last Updated" src="https://img.shields.io/github/last-commit/adityastomar67/.dotfiles?style=flat&color=e06c75&label="> </a>
</div>

```bash
   █▀▀▀ ▀█▀ █   █▀▀ █▀▀
   █▀▀   █  █   █▀▀ ▀▀█
▀  ▀    ▀▀▀ ▀▀▀ ▀▀▀ ▀▀▀
A bunch of files that start with .(dot) and makes linux more awesome.
```

![Screenshot](https://user-images.githubusercontent.com/33474611/218635275-147eef14-e6f7-4967-852f-19410069012a.png)
<!--![Screenshot](https://github.com/adityastomar67/.dotfiles/blob/master/bin/img/Screenshot.png)-->

## List of Common Dependencies

| Program                             | Name                                                                                                                           |
| :---                                | :---                                                                                                                           |
| Linux Distribution                  | [Arch Linux](https://www.archlinux.org/)                                                                                       |
| Window Manager                      | [bspwm](https://github.com/baskerville/bspwm)                                                                                  |
| Bar                                 | [polybar](https://github.com/jaagr/polybar) (Hidden)                                                                           |
| Program Launcher                    | [rofi](https://github.com/DaveDavenport/rofi)                                                                                  |
| Wallpaper Setter                    | [feh](https://github.com/derf/feh)                                                                                             |
| Web Browser                         | [Firefox](https://firefox.com)                                                                                                 |
| Startpage                           | [Termstart](https://github.com/adityastomar67/.dotfiles/tree/master/startpage/termstart)                                       |
| Code Editor                         | [Nvim](https://neovim.io/)                                                                                                     |
| Text editors/Terminal font          | [Cascursive](https://github.com/sainnhe/icursive-nerd-font)                                                                    |
| Shell                               | [zsh](https://www.zsh.org/)                                                                                                    |
| Terminal Emulator                   | [st](https://st.suckless.org/), [Alacritty](https://github.com/alacritty/alacritty)                                            |
| Document Viewer                     | [Zathura](https://pwmt.org/projects/zathura/)                                                                                  |
| Music Player                        | [ncmpcpp/mpd](https://github.com/ncmpcpp/ncmpcpp)                                                                              |
| Lockscreen                          | [i3lock-color(v2.13c2+)](https://github.com/Raymo111/i3lock-color)                                                             |
| ASCII Art                           | [fsymbols](https://fsymbols.com/text-art)                                                                                      |

## Installation
>**Warning:** If you want to give these dotfiles a try, you should first fork this repository, review the code, and remove things you don’t want or need. Don’t blindly use my settings unless you know what that entails. Use at your own risk!

I suggest you to go through configs and cherrypick what you need. Might be time consuming, but will provide you a setup you're happy with.

Though if you simply wish to clone my setup on your machine, first step is to install the applications I use on your distro. The major ones are listed above.


### For Complete Automated install
Run this code snippet in your terminal **(Coming soon...)**
```bash
curl -sL https://bit.ly/Fresh-Install | sh -s -- --dots
```

### Install Manually

```bash
# Download
git clone https://github.com/adityastomar67/.dotfiles.git $HOME
cd ~/.dotfiles

# Install
./install.sh

# zsh plugin install
source $HOME/.config/.zsh/.zshrc
```

### Temporary Install
>If you do not want to dirty your `$HOME` directory
```bash
# Creating a temporary home directory and Downloading
mkdir /tmp/tmphome
cd /tmp/tmphome
git clone https://github.com/adityastomar67/.dotfiles.git
cd .dotfiles

# Set HOME environment temporary
export HOME=/tmp/tmphome

# Install
./install.sh

# zsh plugin install
source $HOME/.config/.zsh/.zshrc
```
## :art: <samp>COLORSCHEME</samp>

   <p align="center">
      <img src="https://user-images.githubusercontent.com/33474611/218638930-dfc983ee-ae4a-41f1-8755-688772152b36.png" alt="Colorscheme Showcase">
   </p>

   <details>
   <summary><strong>Xresources</strong></summary>

   ```
    ! special
    *.foreground:   #c5c8c9
    *.background:   #0B0F10

    ! black
    *.color0:       #2C3333
    *.color8:       #131718

    ! red
    *.color1:       #df5b61
    *.color9:       #ee6a70

    ! green
    *.color2:       #87c7a1
    *.color10:      #96d6b0

    ! yellow
    *.color3:       #de8f78
    *.color11:      #ffb29b

    ! blue
    *.color4:       #6791c9
    *.color12:      #7ba5dd

    ! magenta
    *.color5:       #bc83e3
    *.color13:      #cb92f2

    ! cyan
    *.color6:       #70b9cc
    *.color14:      #7fc8db

    ! white
    *.color7:       #c4c4c4
    *.color15:      #cccccc
   ```

   </details>
   
# TODO For this Repo

### Tasks
- [ ] Maintain File Structure
- [ ] screen-256 & xterm-256 color conflict solution
- [ ] Add dependency installation guide
