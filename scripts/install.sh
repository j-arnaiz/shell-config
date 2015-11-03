#!/bin/bash
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd ${SCRIPT_DIR}/..

./scripts/installPowerlineFonts.sh
./scripts/installComposer.sh

sudo apt-get update
sudo apt-get install git tmux zsh fortune autojump vim-gtk

# Install oh-my-zsh
sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

# Installing dot files
files=("bash_aliases" "bash_profile" "bash_colors" "bashrc" "vimrc" "vimrc.bundles" "gitconfig" "tmux.conf" "ctags" "phpmd.xml" "gitignore" "zshrc")
backupFolder=$(date +%Y%m%d_%H%M%S)
mkdir $backupFolder
for (( i=0; i<${#files[*]}; i++)) do
  cp ~/.${files[${i}]} $backupFolder/ 2> /dev/null
  rm ~/.${files[${i}]} 2> /dev/null
  ln -s `pwd`/${files[${i}]} ~/.${files[${i}]}
done
mkdir ~/.vim 2> /dev/null
if [ ! -e ~/.vim/bundle/vundle ]; then
    git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
fi
vim +BundleInstall +qall
cd $OLDPWD

