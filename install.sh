#!/bin/bash

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
echo "¯\_(ツ)_/¯ Diffing Lint files ¯\_(ツ)_/¯"
echo
vimdiff ./lint/eslintrc "$HOME/.eslintrc"
echo

sleep 1
echo "¯\_(ツ)_/¯ Diffing git files ¯\_(ツ)_/¯"
echo
vimdiff  ./git/gitconfig "$HOME/.gitconfig"
vimdiff  ./git/gitignore_global "$HOME/.gitignore_global"
echo

sleep 1
echo "¯\_(ツ)_/¯ Copying git_template files straight up ¯\_(ツ)_/¯"
echo
cp -vr -n ./git/git_template "$HOME/.git_template"
echo

sleep 1
echo "¯\_(ツ)_/¯ Copying custom terminal theme ¯\_(ツ)_/¯"
echo
cp -vn ./oh-my-zsh/custom/real.zsh-theme "$HOME/.oh-my-zsh/custom/real.zsh-theme"
echo

sleep 1
echo "¯\_(ツ)_/¯ Diffing Shell profiles ¯\_(ツ)_/¯"
echo
vimdiff ./rc/zshrc "$HOME/.zshrc"
vimdiff ./rc/aliases "$HOME/Developer/.aliases"
vimdiff ./rc/variables "$HOME/Developer/.variables"
echo

sleep 1
echo "¯\_(ツ)_/¯ Diffing ssh configuration ¯\_(ツ)_/¯"
echo
vimdiff ./ssh/config "$HOME/.ssh/config"
echo

sleep 1
echo "¯\_(ツ)_/¯ Diffing tmux configuration ¯\_(ツ)_/¯"
echo
vimdiff ./tmux/tmux.conf "$HOME/.tmux.conf"
vimdiff ./tmux/tmuxline.snapshot "$HOME/.tmuxline.snapshot"
vimdiff ./tmux/tmuxlayout.default "$HOME/.tmuxlayout.default"
echo

sleep 1
echo "¯\_(ツ)_/¯ Diffing vim configuration ¯\_(ツ)_/¯"
echo
cp -vr -n ./vim/colors "$HOME/.vim/colors"
vimdiff ./vim/vimrc "$HOME/.vimrc"
vimdiff ./vim/vimrc.bundles "$HOME/.vimrc.bundles"
echo

echo "¯\_(ツ)_/¯ Thanks for playing ¯\_(ツ)_/¯"
sleep 1
exit 0
