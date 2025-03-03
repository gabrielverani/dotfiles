#!/bin/bash

OS_TYPE=$1
DISTRO=$2

echo "🔹 Instalando JetBrainsMono Nerd Font..."

# Define diretório de fontes
FONT_DIR="$HOME/.local/share/fonts"
mkdir -p "$FONT_DIR"

# URL da fonte Nerd Font
FONT_URL="https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.zip"

# Função para instalar fontes manualmente
install_fonts() {
  echo "🔹 Baixando JetBrainsMono Nerd Font..."
  curl -fLo "$FONT_DIR/JetBrainsMono.zip" "$FONT_URL"
  unzip -o "$FONT_DIR/JetBrainsMono.zip" -d "$FONT_DIR"
  rm "$FONT_DIR/JetBrainsMono.zip"
  fc-cache -fv
}

# Instalação baseada no SO/Distro
if [[ "$OS_TYPE" == "mac" ]]; then
  echo "🔹 Instalando manualmente em macOS..."
  brew install unzip
  install_fonts
elif [[ "$DISTRO" == "ubuntu" || "$DISTRO" == "debian" ]]; then
  echo "🔹 Instalando manualmente em Debian/Ubuntu..."
  sudo apt install -y unzip curl
  install_fonts
elif [[ "$DISTRO" == "arch" ]]; then
  echo "🔹 Instalando via Pacman/AUR..."
  sudo pacman -S --noconfirm ttf-jetbrains-mono-nerd
elif [[ "$DISTRO" == "fedora" ]]; then
  echo "🔹 Instalando manualmente em Fedora..."
  sudo dnf install -y unzip curl
  install_fonts
else
  echo "⚠️ Distribuição não suportada, tentando instalação manual..."
  install_fonts
fi

echo "✅ JetBrainsMono Nerd Font instalada com sucesso!"
