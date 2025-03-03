#!/bin/bash

echo "🚀 Iniciando a instalação do ambiente de desenvolvimento..."

# Define a raiz do repositório
DOTFILES_DIR="$HOME/.dotfiles"
INSTALL_DIR="$DOTFILES_DIR/install.d"

# Garante que a pasta de módulos existe
if [ ! -d "$INSTALL_DIR" ]; then
  echo "❌ Erro: Pasta install.d não encontrada em $DOTFILES_DIR"
  exit 1
fi

# Detecta e exporta o sistema operacional (executa o 00-os.sh)
source "$INSTALL_DIR/00-os.sh"

# Executa todos os módulos em ordem numérica
for script in "$INSTALL_DIR"/*.sh; do
  if [ "$script" != "$INSTALL_DIR/00-os.sh" ]; then
    echo "🔹 Executando $(basename "$script")..."
    source "$script" "$OS_TYPE"
  fi
done

echo "✅ Instalação concluída!"
