#!/bin/bash
if ! command -v nc >/dev/null 2>&1; then
    echo "[*] Instalando netcat..."
sudo apt update
sudo apt install netcat -y
fi
echo "[*] Escuchando en el puerto 4444..."
nc -lvc 4444