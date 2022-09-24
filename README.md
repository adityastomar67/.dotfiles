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

![Screenshot](https://github.com/adityastomar67/.dotfiles/blob/master/bin/img/Screenshot.png)

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
source $HOME/zsh/.zshrc
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
source $HOME/zsh/.zshrc
```

# TODO For this Repo

### Tasks
- [ ] Maintain File Structure
- [ ] screen-256 & xterm-256 color conflict solution
- [ ] Add dependency installation guide
