#!/bin/sh
dotfiles=$HOME/dotfiles

function _current_epoch() {
  echo $(($(date +%s) / 60 / 60 / 24))
}

function _update_dotfiles_update() {
  echo "LAST_EPOCH=$(_current_epoch)" > ~/.dotfiles-update
}

function _upgrade_dotfiles() {
  /usr/bin/env dotfiles=$dotfiles /bin/sh $dotfiles/tools/upgrade.sh
  # update the dotfiles file
  _update_dotfiles_update
}

epoch_target=$UPDATE_DOTFILES_DAYS
if [[ -z "$epoch_target" ]]; then
  # Default to old behavior
  epoch_target=1
fi

if [ -f ~/.dotfiles-update ]
then
  . ~/.dotfiles-update

  if [[ -z "$LAST_EPOCH" ]]; then
    _update_dotfiles_update && return 0;
  fi

  epoch_diff=$(($(_current_epoch) - $LAST_EPOCH))
  if [ $epoch_diff -gt $epoch_target ]
  then
    if [ "$DISABLE_UPDATE_PROMPT" = "true" ]
    then
      _upgrade_dotfiles
    else
      pushd $dotfiles 
      git fetch --all &> /dev/null
      originMaster=$(git rev-parse origin/master);
      localHead=$(git rev-parse head);
      popd

      if [ "$originMaster" != "$localHead" ]; then
        echo "[Dotfiles] Would you like to check for updates? [Y/n] \c"
        read line
        case "$line" in
            (N|n)
                _update_dotfiles_update
            ;;
            *)
                _upgrade_dotfiles
            ;;
        esac
      else
        _update_dotfiles_update
      fi
    fi
  fi
else
  # create the dotfiles file
  _update_dotfiles_update
fi
