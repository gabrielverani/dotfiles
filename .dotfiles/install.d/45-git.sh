#!/bin/bash

OS_TYPE=$1
DISTRO=$2

echo "🔹 Instalando e configurando Git..."

# Instalação do Git conforme o sistema operacional
if ! command -v git &>/dev/null; then
  if [[ "$OS_TYPE" == "mac" ]]; then
    brew install git
  elif [[ "$DISTRO" == "ubuntu" || "$DISTRO" == "debian" ]]; then
    sudo apt install -y git
  elif [[ "$DISTRO" == "arch" ]]; then
    sudo pacman -S --noconfirm git
  elif [[ "$DISTRO" == "fedora" ]]; then
    sudo dnf install -y git
  else
    echo "⚠️ Distribuição não suportada para Git."
  fi
else
  echo "✅ Git já está instalado!"
fi

echo "✅ Git configurado com sucesso!"

# Instalando Delta para melhorar o diff do Git
echo "🔹 Instalando Delta para um diff aprimorado..."
if [[ "$OS_TYPE" == "mac" ]]; then
  brew install git-delta
elif [[ "$DISTRO" == "ubuntu" || "$DISTRO" == "debian" ]]; then
  sudo apt install -y git-delta
elif [[ "$DISTRO" == "arch" ]]; then
  sudo pacman -S --noconfirm git-delta
elif [[ "$DISTRO" == "fedora" ]]; then
  sudo dnf install -y git-delta
fi
echo "✅ Delta instalado!"

# Instalando CLI do GitHub (gh)
echo "🔹 Instalando GitHub CLI (gh)..."
if [[ "$OS_TYPE" == "mac" ]]; then
  brew install gh
elif [[ "$DISTRO" == "ubuntu" || "$DISTRO" == "debian" ]]; then
  sudo apt install -y gh
elif [[ "$DISTRO" == "arch" ]]; then
  sudo pacman -S --noconfirm github-cli
elif [[ "$DISTRO" == "fedora" ]]; then
  sudo dnf install -y gh
fi
echo "✅ GitHub CLI instalado!"

# Instalando CLI do GitLab
echo "🔹 Instalando GitLab CLI..."
if [[ "$OS_TYPE" == "mac" ]]; then
  brew install glab
elif [[ "$DISTRO" == "ubuntu" || "$DISTRO" == "debian" ]]; then
  sudo apt install -y glab
elif [[ "$DISTRO" == "arch" ]]; then
  sudo pacman -S --noconfirm glab
elif [[ "$DISTRO" == "fedora" ]]; then
  sudo dnf install -y glab
fi
echo "✅ GitLab CLI instalado!"

# Autenticando GitHub CLI
echo "🔹 Autenticando GitHub CLI..."
gh auth login

echo "✅ Configuração do Git, GitHub e GitLab finalizada!"
