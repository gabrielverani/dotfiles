#!/bin/bash

OS_TYPE=$1
DISTRO=$2

echo "🔹 Instalando Fish Shell..."

# Instala Fish conforme o sistema operacional
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

# Instalar Fisher (Gerenciador de Plugins do Fish)
if [[ ! -f "$HOME/.config/fish/functions/fisher.fish" ]]; then
  echo "🔹 Instalando Fisher..."
  fish -c 'curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher'
else
  echo "✅ Fisher já está instalado!"
fi

# Instalar plugins essenciais do Fish
echo "🔹 Instalando plugins do Fish..."
fish -c "
    fisher install PatrickF1/fzf.fish         # Integração com FZF
    fisher install jethrokuan/z               # Navegação rápida entre diretórios
    fisher install edc/bass                   # Suporte a scripts Bash no Fish
    fisher install danhper/fish-ssh-agent
    fisher install pure-fish/pure
    fisher takashabe/fish-peco
    "

echo "✅ Fish Shell configurado com sucesso!"
