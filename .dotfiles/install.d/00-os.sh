#!/bin/bash

# Detecta o sistema operacional
OS="$(uname -s)"
case "$OS" in
Linux*) OS_TYPE="linux" ;;
Darwin*) OS_TYPE="mac" ;;
*)
  echo "❌ Sistema operacional não suportado"
  exit 1
  ;;
esac

# Se for Linux, tenta identificar a distribuição
if [[ "$OS_TYPE" == "linux" ]]; then
  if [[ -f /etc/os-release ]]; then
    # Obtém o nome da distribuição a partir do os-release
    DISTRO=$(grep "^ID=" /etc/os-release | cut -d= -f2 | tr -d '"')
  elif command -v lsb_release &>/dev/null; then
    # Método alternativo (para distribuições com lsb_release)
    DISTRO=$(lsb_release -si | tr '[:upper:]' '[:lower:]')
  else
    echo "⚠️ Não foi possível identificar a distribuição Linux."
    DISTRO="unknown"
  fi
else
  DISTRO="macOS"
fi

# Exporta as variáveis para serem usadas nos módulos
export OS_TYPE DISTRO

echo "🔹 Sistema operacional detectado: $OS_TYPE"
echo "🔹 Distribuição identificada: $DISTRO"
