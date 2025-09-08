#!/bin/bash
sudo apt-get install neovim
sudo apt-get install ripgrep
sudo apt-get install fd
git clone https://github.com/ryanoasis/nerd-fonts.git
cd nerd-fonts || exit
./install.sh Hack
