#!/bin/bash

echo "Compilando programas COBOL..."

#Default route instalation
COB_CONFIG="/usr/share/gnucobol/config/default.conf"

# Folders
SRC_DIR="src"
BIN_DIR="bin"
COPY_DIR="copybooks"

if [ ! -d "$BIN_DIR" ]; then
    mkdir -p "$BIN_DIR"
fi

for file in "$SRC_DIR"/*.cob; do
    filename=$(basename "$file" .cob)
    
    echo "Compilando $filename.cob ..."
    
    # cobc
    # -x: executable
    # -free: recomendado para evitar errores de margenes en Linux
    # -o: salida
    #cobc -x -free \
    cobc -x
         -o "$BIN_DIR/$filename" \
         "$file" \
         -I "$COPY_DIR"

    # Verification
    if [ $? -eq 0 ]; then
        echo "Exito: $BIN_DIR/$filename generado"
    else
        echo "Error al compilar $filename"
    fi
done

echo ""
echo "Compilación finalizada"