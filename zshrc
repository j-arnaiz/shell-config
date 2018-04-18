# Path to your oh-my-zsh installation.
  export ZSH=/home/jesus/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="powerlevel9k/powerlevel9k"

# PowerLevel9k Theme {
  DEFAULT_USER=jesus
  POWERLEVEL9K_MODE='awesome-fontconfig'
  POWERLEVEL9K_STATUS_VERBOSE=false

  POWERLEVEL9K_DIR_DEFAULT_BACKGROUND='027'
  POWERLEVEL9K_DIR_HOME_BACKGROUND='027'
  POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND='027'
  POWERLEVEL9K_VCS_CLEAN_BACKGROUND='046'
  POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND='051'
  POWERLEVEL9K_VCS_MODIFIED_BACKGROUND='226'

  POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status load ram)
# }

# Tmux {
  ZSH_TMUX_AUTOSTART=true
# }

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(gitfast git-extras autojump bgnotify bower bundler capistrano catimg colored-man-pages colorize command-not-found composer common-aliases debian dircycle dirhistory encode64 extract fancy-ctrl-z fasd frontend-search gem jsontools npm pass phing rails redis-cli sudo symfony2 urltools vagrant web-search wd docker docker-compose tmux tmuxinator)

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
# eval $(thefuck --alias)
export PATH="$HOME/.rbenv/bin:$PATH"
export ANSIBLE_NOCOWS=1
eval "$(rbenv init -)"
alias wallsync='rsync ~/.config/variety/Favorites/* /media/jesus/Data/Users/JArna/Pictures/Wallpapers'
alias docker-rm='docker ps -aq | xargs docker rm -f'
alias docker-rmi='docker images -q | xargs docker rmi -f'
alias docker-rmn='docker network ls -q | xargs docker network rm'
alias docker-rmv='docker volume ls -q | xargs docker volume rm'
function docker-rma() {
  docker-rm
  docker-rmi
  docker-rmn
  docker-rmv
}

alias tm='tmuxinator'
alias tmm='tmuxinator misc'
alias gbdm='git branch --no-color --merged | command grep -vE "^(\*|\s*master\s*$|\s*develop\s*$)" | command xargs -n 1 git branch -d'
alias dist-upgrade='sudo apt-get update && sudo apt-get dist-upgrade -y && sudo apt-get clean -y'
# unalias ag
export ANSIBLE_VAULT_PASSWORD_FILE=~/.vault_pass

function docker-exec() {
  local container=`grep -o -e '[a-zA-Z\-]*-app' docker-compose.yml`
  docker exec -it ${container} ${@:1}
}
alias de='docker-exec'
