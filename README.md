# My Dev Environment Files
This repo contains my dotfile configuration.

## Terminal setup Linux
### Install Pacman
Open up a terminal window and install pacman with the following command:
```bash
wget https://gitlab.com/trivoxel-utils/deb-pacman/uploads/460d83f8711c1ab5e16065e57e7eeabc/deb-pacman-2.0-0.deb
```
```bash
sudo dpkg -i deb-pacman-2.0-0.deb
```

And if you want to comprobe the version you can exec this command:
```bash
pacman --version
```

### Install Neovim
To install, run:
```bash
sudo pacman -S neovim
```
If some cases when you install neovim via pacman or apt install, you don't have the latest version. So we need to do the following steps:
- Install Neovim via assets from release website [Neovim 0.9.0](https://github.com/neovim/neovim/releases/tag/v0.9.0)
- Download nvim-linux64.tar.gz
- Extract: `tar xzvf nvim-linux64.tar.gz`
- Change the directory `mv nvim-linux64 ~/.`
- Create a symbolic link `sudo ln -s ~/nvim-linux64/bin/nvim /usr/local/bin/nvim`
- Now you can use **neovim** with nvim prefix, but if you want to only use **vim**, you can add alias in your .zshrc file like this `alias vim="/usr/local/bin/nvim"`

## NvChad setup
### Pre-requisites
- Neovim 0.9.0
- Nerd Font as your terminal font, in my case I'm using JetBrainsMono
- Ripgrep

### Relevant Files
- .config/nvim


# Inspiration
The inspiration for this configuration comes from the [dotfiles by dreamsofcode-io](https://github.com/dreamsofcode-io/dotfiles) and [dotfile by josean martinez](https://github.com/josean-dev/dev-environment-files).
