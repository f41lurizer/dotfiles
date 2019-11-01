# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=$HOME/.local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
#ZSH_THEME="robbyrussell"
#ZSH_THEME=random
ZSH_THEME="kphoen"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
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
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  vi-mode
)

ZSH_THEME="spaceship"
source $ZSH/oh-my-zsh.sh
SPACESHIP_DIR_TRUNC=0
SPACESHIP_DIR_TRUNC_REPO=false
SPACESHIP_PROMPT_ORDER=(
#  time          # Time stampts section
#  user          # Username section
  dir           # Current directory section
#  host          # Hostname section
#  TODO: I want to uncomment the git version, as soon as spaceship version 4.0.0 is released with async rendering I will uncomment. Right now it makes the prompt annoyingly slow
# git           # Git section (git_branch + git_status)
#  #hg            # Mercurial section (hg_branch  + hg_status)
#  #package       # Package version
#  #node          # Node.js section
#  #ruby          # Ruby section
#  #elixir        # Elixir section
#  #xcode         # Xcode section
#  #swift         # Swift section
#  #golang        # Go section
#  #php           # PHP section
#  #rust          # Rust section
#  #haskell       # Haskell Stack section
#  #julia         # Julia section
#  #docker        # Docker section
#  #aws           # Amazon Web Services section
  venv          # virtualenv section
#  #conda         # conda virtualenv section
  pyenv         # Pyenv section
#  #dotnet        # .NET section
#  #ember         # Ember.js section
#  #kubecontext   # Kubectl context section
  exec_time     # Execution time
  line_sep      # Line break
#  battery       # Battery level and status
  vi_mode       # Vi-mode indicator
  jobs          # Background jobs indicator
  exit_code     # Exit code section
  char          # Prompt character
  )

# User configuration

#ssh
export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#

#git 
alias gp="git push"
alias gcm="git commit -m "
alias gca"git commit --amend"
alias gch="git checkout "
alias gchb="git checkout -b "
alias gs="git status"
alias gd="git diff "
alias ga="git add "
alias gl="git log --oneline"

# node
alias nrw="npm run watch"
alias nrt="npm run test"

#system aliases
alias x="exit"
alias off="sudo poweroff -f"
alias o="xdg-open "

alias gr="grep -riIn"

#tmux keybindings
alias ta="tmux a"

export TERM=xterm-256color

#Neovim - stolen from this reddit post https://www.reddit.com/r/neovim/comments/6npyjk/neovim_terminal_management_avoiding_nested_neovim/
# v inside of a neovim terminal opens in that same neovim instance. Neovim without will open in new neovim
if [ -n "$NVIM_LISTEN_ADDRESS" ]; then
  #export VISUAL="nvr -cc tabedit --remote-wait +'set bufhidden=wipe'"
  export VISUAL="nvr --remote"
else
  export VISUAL="nvim"
fi
# C-x C-e to open current line in vim

alias v="$VISUAL"
export EDITOR="$VISUAL"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Sometimes we just want to blast away anything docker related
docker-removecontainers() {
    docker stop $(docker ps -aq)
    docker rm $(docker ps -aq)
}

docker-armageddon() {
    removecontainers
    docker network prune -f
    docker rmi -f $(docker images --filter dangling=true -qa)
    docker volume rm $(docker volume ls --filter dangling=true -q)
    docker rmi -f $(docker images -qa)
}

source ~/.zshrc.code42
