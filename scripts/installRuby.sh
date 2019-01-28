#!/bin/bash
rubyVersion=2.5.1

set -e
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd ${SCRIPT_DIR}/..

if [[ ! -d ~/.rbenv ]]; then
    git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
fi

if [[ -f ~/.zshrc ]]; then
    echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.zshrc
    echo 'eval "$(rbenv init -)"' >> ~/.zshrc
else
    echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
    echo 'eval "$(rbenv init -)"' >> ~/.bashrc
fi

if [[ ! -d ~/.rbenv/plugins/ruby-build ]]; then
    git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
fi

sudo apt-get install -y build-essential libssl-dev libreadline-dev zlib1g-dev

export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

rbenv install $rubyVersion
rbenv global $rubyVersion
