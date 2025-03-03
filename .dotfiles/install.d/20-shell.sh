#!/bin/bash

OS_TYPE=$1
DISTRO=$2

echo "🔹 Instalando Fish Shell..."

if ! command -v fish &>/dev/null; then
  if [[ "$OS_TYPE" == "mac" ]]; then
    brew install fish
  elif [[ "$DISTRO" == "ubuntu" || "$DISTRO" == "debian" ]]; then
    sudo apt install fish -y
  elif [[ "$DISTRO" == "arch" ]]; then
    sudo pacman -S fish --noconfirm
  elif [[ "$DISTRO" == "fedora" ]]; then
    sudo dnf install fish -y
  else
    echo "⚠️ Distribuição não suportada para Fish."
  fi
else
  echo "✅ Fish já está instalado!"
fi

# Define Fish como shell padrão
if [[ "$SHELL" != "$(command -v fish)" ]]; then
  echo "🔹 Definindo Fish como shell padrão..."
  chsh -s $(command -v fish)
fi

# Instala Fisher (Gerenciador de Plugins do Fish)
if [[ ! -f "$HOME/.config/fish/functions/fisher.fish" ]]; then
  echo "🔹 Instalando Fisher..."
  fish -c 'curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher'
else
  echo "✅ Fisher já está instalado!"
fi
