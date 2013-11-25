# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

EDITOR=vim; export EDITOR

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

herokuPath="/usr/local/heroku/bin"
androidPath="/Applications/adt-bundle-mac-x86_64/sdk/tools:/Applications/adt-bundle-mac-x86_64/sdk/platform-tools"
generalPath="/usr/bin:/bin:/usr/sbin:/sbin"
windowsPath="/c/Windows/System32:/c/Program Files/Perforce"
node="$HOME/local/node/bin"

# Customize to your needs...
export PATH=$HOME/bin:/usr/local/bin:/usr/local/share/npm/bin:$herokuPath:$androidPath:$generalPath:$windowsPath:$node

#export PATH=/usr/local/bin:/usr/local/share/npm/bin:/opt/local/bin:/opt/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/git/bin
#export PATH="/usr/local/heroku/bin:$PATH"
#export PATH="/Applications/adt-bundle-mac-x86_64/sdk/tools:/Applications/adt-bundle-mac-x86_64/sdk/platform-tools:$PATH"
#export PATH="/usr/bin:/bin:/usr/sbin:/sbin:$PATH"

alias c=clear
alias cl='clear; ls -lA1h'
alias ll='ls -lah'
alias l='ls -lh'
alias o='open . &'
alias e='explorer . &'
alias ,='cd ..'
alias rs='rake setup'
alias quickweb='python -m SimpleHTTPServer'
alias pd='popd'
alias md='mkdir'
alias tv='terminal_velocity ~/Dropbox/NotationalVelocity'
alias tma='tmux -2 attach -d -t'
alias tmux='tmux -2 new -s $(basename $(pwd))'
alias tm=tmux
alias tml='tmux list-sessions'
alias hn='hn -c | less'

# Sublime
alias st='subl'
alias stt='subl .'
alias subl='subl'

# Git
alias g='git status'
alias gs='git show'
alias gf='git fetch --all'
alias gl='git log'
alias gll='git log --graph --full-history --all --color --pretty=format:"%x1b[31m%h%x09%x1b[32m%d%x1b[0m%x20%s"'
alias gb='git branch -a'
alias gd='git diff'
alias gdw='git diff -w'
alias gdc='git diff --cached'
alias gdcw='git diff --cached -w'
alias gds='git diff --staged'
alias gcm='git checkout master'
alias ga='git add'
alias gc='git commit -m'
alias gca='git commit -v -a'
alias gprom='git pull --rebase origin master'
alias grom='git rebase origin/master'
alias grc='git rebase --continue'
alias gpom='git push origin master'
alias gp='git pull --rebase'
alias gss='git stash save'
alias gsp='git stash pop'
alias grh='git reset --hard'
alias gclean='git remote prune origin; git branch --merged | grep -v -E "(\*|master)" | xargs -n 1 git branch -d'
alias gsub='git submodule update --init --recursive'
alias gsl='git stash list'
alias gsd='git stash show -p stash@{0}'
alias gmt='git mergetool'

source ~/.zsh/zshrc.sh
#precmd() {
#    update_current_git_vars
#}

RPROMPT=$'$(git_super_status)'
PROMPT=$'%{$fg_bold[red]%}➜ %{$fg_bold[green]%}%p %{$fg[cyan]%}%c %{$fg_bold[blue]%}%{$fg_bold[blue]%} % %{$reset_color%}'

# Dotfiles update
source ~/dotfiles/tools/check_for_upgrade.sh
