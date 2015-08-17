#!/bin/bash

clear
echo
echo "¯\_(ツ)_/¯ Installing the following scripts ¯\_(ツ)_/¯"
echo
cp -v ./bin/mov2gif /usr/local/bin/mov2gif
cp -v ./bin/z /usr/local/bin/z
cp -v ./bin/tux /usr/local/bin/tux
echo
cp -v ./lint/csslintrc $HOME/.csslintrc
cp -v ./lint/jslintrc $HOME/.jslintrc
cp -v ./lint/eslintrc $HOME/.eslintrc
echo
cp -v ./git/gitconfig $HOME/.gitconfig
cp -v ./git/gitignore_global $HOME/.gitignore_global
cp -vr ./git/git_template $HOME/.git_template
echo
cp -v ./oh-my-zsh/custom/pure.zsh-theme $HOME/.oh-my-zsh/custom/pure.zsh-theme
cp -v ./rc/zshrc $HOME/.zshrc
cp -v ./rc/aliases $HOME/Developer/.aliases
cp -v ./rc/variables $HOME/Developer/.variables
echo
cp -v ./ssh/config $HOME/.ssh/config
echo
cp -v ./tmux/tmux.conf $HOME/.tmux.conf
cp -v ./tmux/tmuxline.snapshot $HOME/.tmuxline.snapshot
echo
cp -vr ./vim/colors $HOME/.vim/colors
cp -v ./vim/vimrc $HOME/.vimrc
echo
echo "¯\_(ツ)_/¯ Make sure to install all the necessary things you need to install ¯\_(ツ)_/¯"

sleep 1
exit 0

# An example of recursively looping through files in this directory. Look into
# how to best do this so that this install.sh is easier to maintain.
#DIRS=`ls -1F ./**/*| grep -e "[^\.].\+/\?" --color=never`
#for i in $DIRS
#do
  #echo "`echo ${i:0}` BUTTS"
#done

