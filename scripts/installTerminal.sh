#!/bin/bash
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd ${SCRIPT_DIR}/..


if [ "$[$(date +%s) - $(stat -c %Z /var/lib/apt/periodic/update-success-stamp)]" -ge 600000 ]; then
    sudo apt-get update
fi
sudo apt-get install git tmux zsh tmuxinator autojump

[ ! -d ~/.oh-my-zsh ] && sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

[ ! -d ~/.oh-my-zsh/custom/themes/powerlevel10k ] && git clone https://github.com/romkatv/powerlevel10k ~/.oh-my-zsh/custom/themes/powerlevel10k

# Installing dot files
files=("bash_aliases" "bash_profile" "bash_colors" "bashrc" "gitconfig" "tmux.conf" "gitignore" "zshrc")
source ${SCRIPT_DIR}/backup.sh
for (( i=0; i<${#files[*]}; i++)) do
  ln -s `pwd`/${files[${i}]} ~/.${files[${i}]}
done

echo "Enter your git name: "
read gitname
echo "Enter your git email: "
read gitemail

sed -i "s/%name%/$gitname/g" ~/.gitconfig
sed -i "s/%email%/$gitemail/g" ~/.gitconfig
