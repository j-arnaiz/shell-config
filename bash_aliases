shopt -s expand_aliases

alias ll='ls -l'
alias la='ls -la'
alias sl='ls'

if which trash &> /dev/null; then
  alias rm='trash'
else
  #trash-cli is not available on debian, so skip anoying message
  if grep -vi debian /etc/issue.net; then
    echo "Your rm's may harm you. Install trash package: apt-get install trash-cli"
  fi
fi

alias cd..='cd ..'
alias gti='git'
alias gz='tar czvf'
alias ugz='tar xzvf'

# php
alias phplog="tail -f /tmp/php_errors.log"
alias sf="bin/console"

# git log
alias glog="git log --format='%Cgreen%h%Creset %C(cyan)%an%Creset - %s' --graph"
