#!/bin/bash

set -u

DIFF_TOOL=$( which vimdiff )

if [[ ! -x $DIFF_TOOL ]]
then
  echo >&2 "Error: $DIFF_TOOL .ot found, trying opendiff instead."
  DIFF_TOOL=$( which opendiff )
  sleep 0.25
fi

if [[ ! -x $DIFF_TOOL ]]
then
  echo >&2 "Error: No diff tool found. Please install either $DIFF_TOOL .r opendiff."
  sleep 0.25
  exit 1
fi

checkForFile () {
  local src=$1
  local dest=$2
  if [ -a $dest ]
  then
    echo "Diffing $src & $dest"
    $DIFF_TOOL $src $dest
  else
    echo "Copying $src to $dest"
    cp -v $src $dest
  fi
}

clear
echo
echo "¯\_(ツ)_/¯ Installing the binaries straight up ¯\_(ツ)_/¯"
echo
# shellcheck disable=SC2045
for file in $(ls ./bin/*)
do
  file_name=$(echo "$file" | cut -d '/' -f 3)
  cp -vn "$file" "/usr/local/bin/$file_name"
done
echo

sleep 1
echo "¯\_(ツ)_/¯ Checking Lint files ¯\_(ツ)_/¯"
echo
checkForFile ./lint/eslintrc "$HOME/.eslintrc"
echo

sleep 1
echo "¯\_(ツ)_/¯ Checking for git files ¯\_(ツ)_/¯"
echo
checkForFile ./git/gitconfig "$HOME/.gitconfig"
checkForFile ./git/gitignore_global "$HOME/.gitignore_global"
echo

sleep 1
echo "¯\_(ツ)_/¯ Copying git_template files straight up ¯\_(ツ)_/¯"
echo
cp -vr -n ./git/git_template "$HOME/.git_template"
echo

sleep 1
echo "¯\_(ツ)_/¯ Copying custom terminal theme ¯\_(ツ)_/¯"
echo
checkForFile ./oh-my-zsh/custom/real.zsh-theme "$HOME/.oh-my-zsh/custom/real.zsh-theme"
echo

sleep 1
echo "¯\_(ツ)_/¯ Checking for Shell profiles ¯\_(ツ)_/¯"
echo
checkForFile ./rc/zshrc "$HOME/.zshrc"
checkForFile ./rc/aliases "$HOME/Developer/.aliases"
checkForFile ./rc/variables "$HOME/Developer/.variables"
echo

sleep 1
echo "¯\_(ツ)_/¯ Checking for ssh configuration ¯\_(ツ)_/¯"
echo
checkForFile ./ssh/config "$HOME/.ssh/config"
echo

sleep 1
echo "¯\_(ツ)_/¯ Checking for tmux configuration ¯\_(ツ)_/¯"
echo
checkForFile ./tmux/tmux.conf "$HOME/.tmux.conf"
checkForFile ./tmux/tmuxline.snapshot "$HOME/.tmuxline.snapshot"
checkForFile ./tmux/tmuxlayout.default "$HOME/.tmuxlayout.default"
echo

sleep 1
echo "¯\_(ツ)_/¯ Checking for vim configuration ¯\_(ツ)_/¯"
echo
cp -vr -n ./vim/colors "$HOME/.vim/colors"
checkForFile ./vim/vimrc "$HOME/.vimrc"
checkForFile ./vim/vimrc.bundles "$HOME/.vimrc.bundles"
echo

echo "¯\_(ツ)_/¯ Thanks for playing ¯\_(ツ)_/¯"
sleep 1
exit 0
