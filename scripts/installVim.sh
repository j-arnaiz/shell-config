#!/bin/bash
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd ${SCRIPT_DIR}/..

if [ "$[$(date +%s) - $(stat -c %Z /var/lib/apt/periodic/update-success-stamp)]" -ge 600000 ]; then
    sudo apt-get update
fi
sudo apt-get install git autojump silversearcher-ag octave vim-gtk

./scripts/installPowerlineFonts.sh

# Installing dot files
files=("vimrc" "vimrc.bundles")
source ${SCRIPT_DIR}/backup.sh
for (( i=0; i<${#files[*]}; i++)) do
  ln -s `pwd`/${files[${i}]} ~/.${files[${i}]}
done

[ ! -d ~/.vim ] && mkdir ~/.vim

if [ ! -e ~/.vim/bundle/vundle ]; then
    git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
fi
vim +BundleInstall +qall
cd $OLDPWD
