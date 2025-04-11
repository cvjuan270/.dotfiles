#!/bin/bash

# --- 1. Verificar/Instalar dependencias ---
echo "🔍 Verificando dependencias..."
# Lista de paquetes a enlazar

# Lista de paquetes necesarios (ajusta según tu setup)
DEPENDENCIES=(
  "dconf-cli" # Configuration storage system
  "dbus-x11"
  "stow"  # Para gestionar dotfiles
  "git"   # Para clonar el repositorio (si es necesario)
  "nvim"  # Editor (opcional)
  "tilix" # Terminal emulator
)

# Verificar e instalar dependencias faltantes
MISSING_DEPS=()
for dep in "${DEPENDENCIES[@]}"; do
  if ! command -v "$dep" &>/dev/null; then
    MISSING_DEPS+=("$dep")
  fi
done

# Función para instalar paquetes según la distro
install_dependencies() {
  sudo apt update && sudo apt install "${MISSING_DEPS[@]}" -y
}

# Instalando dependencias
if [ ${#MISSING_DEPS[@]} -gt 0 ]; then
  echo "📦 Instalando dependencias faltantes: ${MISSING_DEPS[*]}"
  install_dependencies
else
  echo "📦 Dependencias Completas"
fi

# stow
# Listar paquetes a enlazar
packages=("nvim" "tilix")

for pkg in "${packages[@]}"; do
  echo "Installing ${pkg}"
  stow -vt ~ $pkg
done

# dconf
echo "Instalando dconf"
dconf load /com/gexperts/Tilix/ <tilix/tilix.dconf
