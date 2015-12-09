#!/bin/bash
rubyVersion=2.2.3

set -e
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd ${SCRIPT_DIR}/..

git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
if [ -f ~/.zshrc ]; then
    echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.zshrc
    echo 'eval "$(rbenv init -)"' >> ~/.rshrc
    file=~/.zshrc
else if [ -f ~/.bashrc ]; then
    echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
    echo 'eval "$(rbenv init -)"' >> ~/.bashrc
    file=~/.bashrc
else
    echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bash_profile
    echo 'eval "$(rbenv init -)"' >> ~/.bash_profile
    file=~/.bash_profile
fi
git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build

sudo apt-get install build-essential libssl-dev libreadline-dev zlib1g-dev

source $file

rbenv install $rubyVersion
rbenv global $rubyVersion
