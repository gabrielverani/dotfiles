#!/bin/bash

OS_TYPE=$1
DISTRO=$2

echo "🔹 Instalando ferramentas de desenvolvimento..."

if [[ "$OS_TYPE" == "mac" ]]; then
  brew install python node docker
elif [[ "$DISTRO" == "ubuntu" || "$DISTRO" == "debian" ]]; then
  sudo apt install -y python3 python3-pip nodejs docker.io
elif [[ "$DISTRO" == "arch" ]]; then
  sudo pacman -S python nodejs docker --noconfirm
elif [[ "$DISTRO" == "fedora" ]]; then
  sudo dnf install -y python3 python3-pip nodejs docker
else
  echo "⚠️ Distribuição não suportada para ferramentas de desenvolvimento."
fi
