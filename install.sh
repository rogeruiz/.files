#!/bin/bash

set -u

TARGET_OS=$( uname -s | awk '{ print tolower($0) }' )
SLEEP_DURATION=1

DIFF_TOOL=""
NVIM_INSTALL=$( which nvim )
VIMDIFF_INSTALL=$( which vimdiff )
OPENDIFF_INSTALL=$( which opendiff )

# Sets the DIFF_TOOL variable to nvim, vimdiff, or opendiff before executing any
# further into the script. This check favors the DIFF_TOOL in the order
# previously mentioned.
if [[ -x $NVIM_INSTALL ]]
then
  DIFF_TOOL="${NVIM_INSTALL} -d"
else
  echo >&2 "Bichu: \`nvim\` no se encuentra, probando \`vimdiff\` como alternativa."
  sleep "${SLEEP_DURATION}"
  if [[ -x $VIMDIFF_INSTALL ]]
  then
    DIFF_TOOL=$VIMDIFF_INSTALL
  else
    echo >&2 "Bichu: \`vimdiff\` no se encuentra, probando \`opendiff\` como alternativa."
    sleep "${SLEEP_DURATION}"
    if [[ -x $OPENDIFF_INSTALL ]]
    then
      DIFF_TOOL=$OPENDIFF_INSTALL
    else
      echo >&2 "Bichu: no se encontró ningún \${DIFF_TOOL}. Por favor instale nvim, vimdiff, or opendiff."
      sleep "${SLEEP_DURATION}"
      exit 1
    fi
  fi
fi

# checkForFile Function takes two arguments, the first is the source filename
# and the second is the destination filename.
checkForFile () {
  local src=$1
  local dest=$2
  if [[ -f $dest ]]
  then
    echo "Comprobando $src y $dest"
    sleep "${SLEEP_DURATION}"
    $DIFF_TOOL $src $dest
  else
    echo "Copiando $src a $dest"
    sleep "${SLEEP_DURATION}"
    cp -v $src $dest
  fi
}

# shrugText Function takes a single argument as a string and concatenates shruggies.
shrugText () {
  body=$1
  shrug="¯\_(ツ)_/¯"
  echo "${shrug} ${body} ${shrug}"
}

clear
if [ ! -e $(which brew) ]
then
  shrugText "Instalando Homebrew"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  brew bundle --file=./homebrew/Brewfile
else
  shrugText "Homebrew ya está instalado entonces lo vamos a omitir"
fi
echo

echo
shrugText "Instalando ejecutables como son..."
echo
# Check for files in ./bin and copy or diff them.
for file in ./bin/*
do
  [ -f "${file}" ] || continue
  file_name=$(basename "${file}")
  if [[ -n $( file "${file}" | grep 'text' ) ]]
  then
    shrugText "Comprobando ASCII-text ejecutables..."
    file_path=$( which ${file_name} )
    if [ $? -ne 0 ]; then file_path="/usr/local/bin/"; fi
    checkForFile "${file}" "${file_path}"
  else
    cp -vn "$file" "/usr/local/bin/${file_name}"
  fi
done
shrugText "Instalando ${TARGET_OS} ejecutables como son..."
echo
# Check for OS-specific files in ./bin and copy or diff them.
for os_file in ./bin/${TARGET_OS}/*
do
  [ -f "${os_file}" ] || continue
  os_file_name=$(basename "${os_file}")
  if [[ -n $( file "${os_file}" | grep 'text' ) ]]
  then
    shrugText "Comprobando ASCII-text ejecutables de ${TARGET_OS}..."
    os_file_path=$( which ${os_file_name} )
    if [ $? -ne 0 ]; then os_file_path="/usr/local/bin/"; fi
    checkForFile "${os_file}" "${os_file_path}"
  else
    cp -vn "$os_file" "/usr/local/bin/${os_file_name}"
  fi
done
echo

sleep "${SLEEP_DURATION}"
shrugText "Instalando Cargo ejecutables si es posible"
echo
if [[ -x $(which cargo) ]] && \
   [[ -x $(which rustc) ]] && \
   [[ -x $(which rustup) ]]
then
  cargo install lolcat
else
  echo >&2 "Bichu: Rustup y Cargo no estan instalado"
fi

sleep "${SLEEP_DURATION}"
shrugText "Comprobando archivos para EditorConfig..."
echo
checkForFile ./editorconfig/editorconfig "${HOME}/.editorconfig"
echo

sleep "${SLEEP_DURATION}"
shrugText "Comprobando archivos para Linting..."
echo
checkForFile ./lint/eslintrc "${HOME}/.eslintrc"
checkForFile ./lint/tflint.hcl "${HOME}/.tflint.hcl"
echo

# Terminator is a Linux-only terminal emulator.
if [[ "${TARGET_OS}" == "linux" ]]
then
  sleep "${SLEEP_DURATION}"
  shrugText "Comprobando archivos para aplicación Terminator..."
  echo
  checkForFile ./terminator/config "${HOME}"/.config/terminator/config
  echo
fi

sleep "${SLEEP_DURATION}"
shrugText "Comprobando archivoes para Git..."
echo
checkForFile ./git/gitconfig "${HOME}/.gitconfig"
checkForFile ./git/gitignore_global "${HOME}/.gitignore_global"
echo

sleep "${SLEEP_DURATION}"
shrugText "Comprobando archives de git_template como son..."
echo
cp -vr -n ./git/git_template "${HOME}/.git_template"
echo

sleep "${SLEEP_DURATION}"
shrugText "Comprobando tema de terminal personalizado..."
echo
checkForFile ./oh-my-zsh/custom/real.zsh-theme "${HOME}/.oh-my-zsh/custom/themes/real.zsh-theme"
echo

sleep "${SLEEP_DURATION}"
shrugText "Comprobando archivos de recursos ZSH..."
echo
checkForFile ./rc/zshrc "${HOME}/.zshrc"
checkForFile ./rc/aliases "${HOME}/Developer/.aliases"
checkForFile ./rc/variables "${HOME}/Developer/.variables"
echo

sleep "${SLEEP_DURATION}"
shrugText "Comprobando archivos de configuración SSH..."
echo
checkForFile ./ssh/config "${HOME}/.ssh/config"
echo

sleep "${SLEEP_DURATION}"
shrugText "Comprobando archivos de configuración Tmux..."
echo
mkdir -p ~/.tmux/
if [ ! -d ~/.tmux/tmux-weather ]
then
  git clone https://github.com/xamut/tmux-weather ~/.tmux/tmux-weather
fi
if [ ! -d ~/.tmux/tmux-network-bandwidth ]
then
  git clone https://github.com/xamut/tmux-network-bandwidth ~/.tmux/tmux-network-bandwidth
fi
checkForFile ./tmux/tmux.conf "${HOME}/.tmux.conf"
checkForFile ./tmux/tmuxline.snapshot "${HOME}/.tmuxline.snapshot"
checkForFile ./tmux/tmuxlayout.default "${HOME}/.tmuxlayout.default"
echo

sleep "${SLEEP_DURATION}"
# Try to install configuration for NeoVim first, otherwise fall back to
# configuring Vim if it's installed.
if [[ -x $NVIM_INSTALL ]]
then
  mkdir -p ~/.config/nvim
  shrugText "Comprobando archivos de configuración NeoVim..."
  echo
  cp -vr -n ./nvim/colors "${HOME}/.config/nvim/colors"
  cp -vr -n ./nvim/language-servers "${HOME}/.config/nvim/language-servers"
  cp -vr -n ./nvim/spell "${HOME}/.config/nvim/spell"
  checkForFile ./nvim/init.vim "${HOME}/.config/nvim/init.vim"
  checkForFile ./nvim/bundles.vim "${HOME}/.config/nvim/bundles.vim"
  checkForFile ./nvim/coc-settings.json "${HOME}/.config/nvim/coc-settings.json"
elif [[ -x $VIMDIFF_INSTALL ]]
then
  mkdir -p ~/.vim
  shrugText "Considere instalar NeoVim ya que estos archivos de configuración de Vim pueden estar desactualizados"
  sleep "${SLEEP_DURATION}"
  shrugText "Comprobando archivos de configuración Vim..."
  echo
  cp -vr -n ./vim/colors "${HOME}/.vim/colors"
  cp -vr -n ./vim/spell "${HOME}/.vim/spell"
  checkForFile ./vim/vimrc "${HOME}/.vimrc"
  checkForFile ./vim/vimrc.bundles "${HOME}/.vimrc.bundles"
fi
echo

shrugText "¡Feliz configurando!"
sleep "${SLEEP_DURATION}"
exit 0
