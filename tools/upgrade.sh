printf '\033[0;34m%s\033[0m\n' "Upgrading Dotfiles"
cd "$dotfiles"
if git pull --rebase origin master
then
  printf '\033[0;32m%s\033[0m\n' '    ____          __   ____ _  __           '
  printf '\033[0;32m%s\033[0m\n' '   / __ \ ____   / /_ / __/(_)/ /___   _____'
  printf '\033[0;32m%s\033[0m\n' '  / / / // __ \ / __// /_ / // // _ \ / ___/'
  printf '\033[0;32m%s\033[0m\n' ' / /_/ // /_/ // /_ / __// // //  __/(__  ) '
  printf '\033[0;32m%s\033[0m\n' '/_____/ \____/ \__//_/  /_//_/ \___//____/  '
  printf '\033[0;32m%s\033[0m\n' '                                            '

  printf '\033[0;34m%s\033[0m\n' 'Dotfiles updated...'
else
  printf '\033[0;31m%s\033[0m\n' 'There was an error updating. Try again later?'
fi

