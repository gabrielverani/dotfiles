#!/bin/bash

OS_TYPE=$1
DISTRO=$2

echo "🔹 Instalando Neovim e LazyVim..."

# Instalação do Neovim conforme o sistema operacional
if ! command -v nvim &>/dev/null; then
  if [[ "$OS_TYPE" == "mac" ]]; then
    brew install neovim
  elif [[ "$DISTRO" == "ubuntu" || "$DISTRO" == "debian" ]]; then
    sudo apt install -y neovim
  elif [[ "$DISTRO" == "arch" ]]; then
    sudo pacman -S --noconfirm neovim
  elif [[ "$DISTRO" == "fedora" ]]; then
    sudo dnf install -y neovim
  else
    echo "⚠️ Distribuição não suportada para Neovim."
  fi
else
  echo "✅ Neovim já está instalado!"
fi

# Criar diretório de configuração do Neovim
NVIM_CONFIG="$HOME/.config/nvim"
if [[ ! -d "$NVIM_CONFIG" ]]; then
  echo "🔹 Configurando LazyVim..."
  git clone https://github.com/LazyVim/starter "$NVIM_CONFIG"
  rm -rf "$NVIM_CONFIG/.git"
else
  echo "✅ LazyVim já está configurado!"
fi

# Instalar dependências essenciais para LSP, Treesitter e Debugging
echo "🔹 Instalando dependências para LSP e Treesitter..."
if [[ "$OS_TYPE" == "mac" ]]; then
  brew install ripgrep fd lua-language-server stylua tree-sitter wget unzip node python3 clang-format npm
elif [[ "$DISTRO" == "ubuntu" || "$DISTRO" == "debian" ]]; then
  sudo apt install -y ripgrep fd-find lua-language-server tree-sitter-cli wget unzip nodejs python3 clang-format npm
elif [[ "$DISTRO" == "arch" ]]; then
  sudo pacman -S --noconfirm ripgrep fd lua-language-server tree-sitter wget unzip nodejs python clang npm
elif [[ "$DISTRO" == "fedora" ]]; then
  sudo dnf install -y ripgrep fd-find lua-language-server tree-sitter wget unzip nodejs python3 clang-tools-extra npm
fi

echo "✅ Neovim e LazyVim configurados com sucesso!"
