#!/bin/bash

set -u

TARGET_OS=$( uname -s | awk '{ print tolower($0) }' )
SLEEP_DURATION=1

DIFF_TOOL=""
NVIM_INSTALL=$( which nvim )
VIMDIFF_INSTALL=$( which vimdiff )
OPENDIFF_INSTALL=$( which opendiff )

if [[ -x $NVIM_INSTALL ]]
then
  DIFF_TOOL="${NVIM_INSTALL} -d"
else
  echo >&2 "Error: \`nvim\` Not found, trying \`vimdiff\` instead."
  sleep "${SLEEP_DURATION}"
  if [[ -x $VIMDIFF_INSTALL ]]
  then
    DIFF_TOOL=$VIMDIFF_INSTALL
  else
    echo >&2 "Error: \`vimdiff\` Not found, trying \`opendiff\` instead."
    sleep "${SLEEP_DURATION}"
    if [[ -x $OPENDIFF_INSTALL ]]
    then
      DIFF_TOOL=$OPENDIFF_INSTALL
    else
      echo >&2 "Error: No diff tool found. Please install either nvim, vimdiff, or opendiff."
      sleep "${SLEEP_DURATION}"
      exit 1
    fi
  fi
fi

checkForFile () {
  local src=$1
  local dest=$2
  if [[ -f $dest ]]
  then
    echo "Diffing $src & $dest"
    sleep "${SLEEP_DURATION}"
    $DIFF_TOOL $src $dest
  else
    echo "Copying $src to $dest"
    sleep "${SLEEP_DURATION}"
    cp -v $src $dest
  fi
}

shrugText () {
  body=$1
  shrug="¯\_(ツ)_/¯"
  echo "${shrug} ${body} ${shrug}"
}

clear
echo
shrugText "Installing the binaries straight up"
echo
for file in ./bin/*
do
  [ -f "${file}" ] || continue
  file_name=$(basename "${file}")
  cp -vn "$file" "/usr/local/bin/${file_name}"
  if [[ -n $( file "${file}" | grep 'text' ) ]]
  then
    file_path=$( which ${file_name} )
    checkForFile "${file}" "${file_path}"
  fi
done
for os_file in ./bin/${TARGET_OS}/*
do
  [ -f "${os_file}" ] || continue
  os_file_name=$(basename "${os_file}")
  cp -vn "$os_file" "/usr/local/bin/${os_file_name}"
  if [[ -n $( file "${os_file}" | grep 'text' ) ]]
  then
    os_file_path=$( which ${os_file_name} )
    checkForFile "${os_file}" "${os_file_path}"
  fi
done
echo

sleep "${SLEEP_DURATION}"
shrugText "Checking Lint files"
echo
checkForFile ./lint/eslintrc "${HOME}/.eslintrc"
echo

sleep "${SLEEP_DURATION}"
shrugText "Checking for git files"
echo
checkForFile ./git/gitconfig "${HOME}/.gitconfig"
checkForFile ./git/gitignore_global "${HOME}/.gitignore_global"
echo

sleep "${SLEEP_DURATION}"
shrugText "Copy git_template files straight up"
echo
cp -vr -n ./git/git_template "${HOME}/.git_template"
echo

sleep "${SLEEP_DURATION}"
shrugText "Checking custom terminal theme"
echo
checkForFile ./oh-my-zsh/custom/real.zsh-theme "${HOME}/.oh-my-zsh/custom/themes/real.zsh-theme"
echo

sleep "${SLEEP_DURATION}"
shrugText "Checking for Shell profiles"
echo
checkForFile ./rc/zshrc "${HOME}/.zshrc"
checkForFile ./rc/aliases "${HOME}/Developer/.aliases"
checkForFile ./rc/variables "${HOME}/Developer/.variables"
echo

sleep "${SLEEP_DURATION}"
shrugText "Checking for SSH configuration files"
echo
checkForFile ./ssh/config "${HOME}/.ssh/config"
echo

sleep "${SLEEP_DURATION}"
shrugText "Checking for Tmux configuration files"
echo
checkForFile ./tmux/tmux.conf "${HOME}/.tmux.conf"
checkForFile ./tmux/tmuxline.snapshot "${HOME}/.tmuxline.snapshot"
checkForFile ./tmux/tmuxlayout.default "${HOME}/.tmuxlayout.default"
echo

sleep "${SLEEP_DURATION}"
if [[ -x $NVIM_INSTALL ]]
then
  shrugText "Checking for NeoVim configuration files"
  echo
  cp -vr -n ./nvim/colors "${HOME}/.config/nvim/colors"
  cp -vr -n ./nvim/language-servers "${HOME}/.config/nvim/language-servers"
  cp -vr -n ./nvim/spell "${HOME}/.config/nvim/spell"
  checkForFile ./nvim/init.vim "${HOME}/.config/nvim/init.vim"
  checkForFile ./nvim/bundles.vim "${HOME}/.config/nvim/bundles.vim"
  checkForFile ./nvim/coc-settings.json "${HOME}/.config/nvim/coc-settings.json"
elif [[ -x $VIMDIFF_INSTALL ]]
  shrugText "Checking for Vim configuration files"
  echo
  cp -vr -n ./vim/colors "${HOME}/.vim/colors"
  cp -vr -n ./vim/spell "${HOME}/.vim/spell"
  checkForFile ./vim/vimrc "${HOME}/.vimrc"
  checkForFile ./vim/vimrc.bundles "${HOME}/.vimrc.bundles"
fi
echo

shrugText "Thanks for playing"
sleep "${SLEEP_DURATION}"
exit 0
