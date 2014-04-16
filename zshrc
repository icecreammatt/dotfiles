# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

setopt allexport
EDITOR=vim; 

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
# ZSH_THEME="robbyrussell"
# ZSH_THEME="agnoster"
ZSH_THEME="terminalparty"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how many often would you like to wait before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

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

export PATH=$HOME/bin:/usr/local/bin:/usr/local/share/npm/bin:$herokuPath:$androidPath:$generalPath:$windowsPath:$node:/usr/local/mysql/bin
#export PATH="/usr/bin:/bin:/usr/sbin:/sbin:$PATH"

# source ~/.zsh/zshrc.sh
# precmd() {
#     update_current_git_vars
# }

[ -e "${HOME}/.zsh_aliases" ] && source "${HOME}/.zsh_aliases"
[ -e "${HOME}/.zshrc_local" ] && source "${HOME}/.zshrc_local"

PROMPT='%{$fg_bold[green]%}> %{$fg[white]%} '
# RPROMPT=$'$(git_super_status)'
# PROMPT=$'%{$fg_bold[white]%}%M %{$fg_bold[red]%}➜ %{$fg_bold[green]%}%p %{$fg[cyan]%}%c %{$fg_bold[blue]%}%{$fg_bold[blue]%} % %{$reset_color%}'

# Dotfiles update
source ~/dotfiles/tools/check_for_upgrade.sh

#if [[ ! $TERM =~ screen ]]; then
#        exec tmux -2
#fi
#
# whiteboard () {
#     convert $1 -morphology Convolve DoG:15,100,0 -negate -normalize -blur 0x1 -channel RBG -level 60%,91%,0.1 $2
# }
