# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how many often would you like to wait before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git st stt)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=/opt/local/bin:/opt/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/Applications/Sublime\ Text\ 2.app/Contents/SharedSupport/bin

alias c=clear
alias cl='clear; ls -lA1'
alias ll='ls -la'
alias l='ls -l'
alias o='open . &'
alias ,='cd ..'
alias rs='rake setup'

# Sublime
alias st='subl'
alias stt='subl .'

# Git
alias g='git status'
alias gs='git show'
alias gl='git log'
alias gitlog='git log --graph --full-history --all --color --pretty=format:"%x1b[31m%h%x09%x1b[32m%d%x1b[0m%x20%s"'
alias gb='git branch -a'
alias gd='git diff'
alias ga='git add'
alias gc='git commit -m'
alias gca='git commit -v -a'
alias gprom='git pull --rebase origin master'
alias gpom='git push origin master'
alias gp='git pull'
alias grh='git reset --hard'
#alias gclean='git branch --merged | xargs git branch -d; git remote prune origin'
alias gclean='git remote prune origin; git branch --merged | grep -v -E "(\*|master)" | xargs -n 1 git branch -d'

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

export PATH="/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/local/git/bin:/Applications/adt-bundle-mac-x86_64/sdk/tools:/Applications/adt-bundle-mac-x86_64/sdk/platform-tools:$PATH"
