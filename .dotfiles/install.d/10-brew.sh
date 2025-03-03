#!/bin/bash

OS_TYPE=$1

if [[ "$OS_TYPE" == "mac" ]]; then
  echo "🔹 Instalando Homebrew..."

  if ! command -v brew &>/dev/null; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  else
    echo "✅ Homebrew já está instalado!"
  fi
fi
