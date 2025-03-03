#!/bin/bash

echo "🔹 Configurando Git Bare Repository..."

if [ ! -d "$HOME/.dotfiles" ]; then
  git clone --bare git@github.com:SEU-USUARIO/dotfiles.git $HOME/.dotfiles
  alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
  dotfiles checkout
  dotfiles config --local status.showUntrackedFiles no
fi
