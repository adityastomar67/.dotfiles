<div align="center">
  <h2>Module: ZSH.</h1>
  Brief description of how this sub configuration actually works.
</div>

#### Installation

Noting really, if you have ZSH installed then you can just symlink the `.dotfiles/zsh` to `$HOME` and run `source $HOME/zsh/.zshrc`. All of the plugins will be downloaded automatically including oh-my-zsh as it is completely bootstrapped.

#### Before we proceed

If the reader is well versed or, has a general experience with shell scripting or, know what you are doing then they may skip this section.

```zsh
:: env.zsh       -    environment variables
:: fzf.zsh       -    fzf functions
:: icons.zsh     -    Custom icons
:: keys.zsh      -    ZSH keybindings
:: opts.zsh      -    ZSH options and ZSH plugin options
:: plugs.zsh     -    plugins and plugin manager setup
:: prompt.zsh    -    ZSH prompt custom made
:: theme.zsh     -    ZSH LC_COLORS colors and FZF opt colors
```

#### To Install ZSH alone frome this config, run this command (Coming Soon!!)
```bash
curl -sL https://bit.ly/Fresh-Install | sh -s -- --zsh
```

#### For Manual Installation
> Make sure you have zsh installed and setup.
```bash
git clone https://github.com/adityastomar67/.dotfiles.git /tmp/dots
cp -r /tmp/dots/.zsh $HOME/.zsh
source $HOME/.zsh/.zshrc
```
