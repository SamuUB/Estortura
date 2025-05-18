#!/bin/bash

# Nombre del archivo fuente sin extensión
FUENTE="CDV_Extraordinario"
ENS="$FUENTE.ens"
BIN="$FUENTE.bin"

# Paso 1: Ensamblar el archivo
echo "🛠 Ensamblando el archivo $ENS..."
88110e -e ppal -ml -o "$BIN" "$ENS"
if [ $? -ne 0 ]; then
    echo "❌ Error al ensamblar el código."
    exit 1
fi

# Paso 2: Ejecutar en el emulador
echo "🚀 Ejecutando en el emulador..."
mc88110 "$BIN" <<EOF
e             # Ejecutar el programa hasta STOP o breakpoint
r             # Ver registros en número (hex) y letra (ASCII)
q             # Salir del emulador
EOF
