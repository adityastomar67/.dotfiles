#!/bin/sh

git clone https://github.com/jszczerbinsky/ptSh ~/Downloads/git-repos/ptSh
cd ~/Downloads/git-repos/ptSh
make 
sudo make install
rm -rf ~/Downloads/git-repos/ptSh
