#!/bin/bash

OS_TYPE=$1
DISTRO=$2

echo "🔹 Instalando ferramentas de AI..."

# 🔹 GitHub Copilot CLI
echo "🔹 Instalando GitHub Copilot CLI..."
if command -v gh &>/dev/null; then
  gh extension install github/gh-copilot
  echo "✅ GitHub Copilot CLI instalado!"
else
  echo "⚠️ GitHub CLI não encontrado. Instale antes de usar o Copilot CLI."
fi

# 🔹 Instalar Ollama (para rodar LLMs locais)
echo "🔹 Instalando Ollama (LLM local)..."
if [[ "$OS_TYPE" == "mac" ]]; then
  brew install ollama
elif [[ "$DISTRO" == "ubuntu" || "$DISTRO" == "debian" ]]; then
  curl -fsSL https://ollama.ai/install.sh | sh
elif [[ "$DISTRO" == "arch" ]]; then
  yay -S ollama
elif [[ "$DISTRO" == "fedora" ]]; then
  sudo dnf install ollama -y
fi
echo "✅ Ollama instalado!"

echo "✅ Ferramentas de AI configuradas com sucesso!"
