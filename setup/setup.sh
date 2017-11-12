#!/bin/bash
cd ~
env=$1

function doIt() {
  # install neobundle (vim plugin manager)
  curl https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh | sh

  # install antigen
  curl -L https://raw.githubusercontent.com/zsh-users/antigen/master/antigen.zsh > antigen.zsh

  # install
  pip install virtualenvwrapper
  git clone git://github.com/zsh-users/zsh-autosuggestions ~/dotfiles/.zsh-autosuggestions
  git clone https://github.com/tarjoilija/zgen.git ~/dotfiles/.zgen

  # setup symlinks
  ln -sfv {~/dotfiles/,./}antigen.zsh
  ln -sfv {~/dotfiles/,./}.exports
  ln -sfv {~/dotfiles/,./}.functions
  ln -sfv {~/dotfiles/,./}.aliases
  ln -sfv {~/dotfiles/,./}.zshrc
  ln -sfv {~/dotfiles/,./}.vimrc
  ln -sfv {~/dotfiles/,./}.slate.js
  ln -sfv {~/dotfiles/,./}.osx
  ln -sfv {~/dotfiles/,./}.vim
  ln -sfv {~/dotfiles/,./}.zsh-autosuggestions
  ln -sfv {~/dotfiles/,./}.zgen
  # ln -sfv {~/dotfiles/,./}.gitconfig
  ln -sfv {~/dotfiles/extra/${env}.sh,./.extra}
  # ln -sfv {~/dotfiles/,./}.extra

  # change shell to zsh
  chsh -s /bin/zsh

  # install utils
  brew install tree
  brew install wget
  brew install MacVim
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
  doIt
else
  read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1
  echo
  if [[ $REPLY =~ ^[Yy]$ ]]; then
    doIt
  fi
fi
unset doIt
