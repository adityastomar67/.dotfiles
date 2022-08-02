<div align="center">
  <h2>Module: NVIM.</h1>
  Brief description of how this sub configuration actually works.
</div>

#### Installation

Noting really, if you have (Neo)vim installed then you can just backup your previous config if any, then just clone this repo and create a symlink of this configuration to your ~/.config/nvim

```bash
  # move to home dir
  cd ~
  # back up current config
  cp -r ~/.config/nvim ~/.config/nvim.backup
  # clone repository
  git clone git@github.com:adityastomar67/.dotfiles.git
  # copy nvim configurations from repository to your config directory
  cp -r ~/.dotfiles/nvim ~/.config/
  # now open the Neovim and insatll plugins
  nvim +PackerSync
  # cleanup
  rm -rf ~/.dotfiles
```
#### Before we proceed

If the reader is well versed or, has a general experience with shell scripting or, know what you are doing then they may skip this section.

```zsh
:: env.zsh       -    environment variables
:: keys.zsh      -    ZSH keybindings
:: opts.zsh      -    ZSH options and ZSH plugin options
:: plugs.zsh     -    plugins and plugin manager setup
:: prompt.zsh    -    ZSH prompt custom made
:: theme.zsh     -    ZSH LC_COLORS colors and FZF opt colors
```
