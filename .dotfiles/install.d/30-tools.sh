#!/bin/bash

OS_TYPE=$1
DISTRO=$2

echo "🔹 Instalando ferramentas essenciais..."

TOOLS=(
  git
  curl
  tmux
  fzf
  ripgrep
  bat
  eza
  tree
)

if [[ "$OS_TYPE" == "mac" ]]; then
  brew install ${TOOLS[@]}
elif [[ "$DISTRO" == "ubuntu" || "$DISTRO" == "debian" ]]; then
  sudo apt install -y ${TOOLS[@]}
elif [[ "$DISTRO" == "arch" ]]; then
  sudo pacman -S ${TOOLS[@]} --noconfirm
elif [[ "$DISTRO" == "fedora" ]]; then
  sudo dnf install -y ${TOOLS[@]}
else
  echo "⚠️ Distribuição não suportada para instalação de ferramentas."
fi
