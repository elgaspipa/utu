sudo apt update
sudo apt install lshw dmidecode pciutils
sudo apt install mailutils
sudo apt install msmtp msmtp-mta mailutils
#instala complementos necesarios
user=$(whoami)
lscpu > cpu.txt #crea o sobreescribe el archivo cpu.txt con la informacion del procesador

{
free -h
cat /proc/meminfo
} > ram.txt #crea o sobreescribe el archivo ram.txt con la informacion de la memoria RAM

{
lsblk
df -h
}> disk.txt #crea o sobreescribe el archivo disk.txt con la informacion del disco duro o la unidad de almacenamiento

sudo dmidecode -t baseboard > mobo.txt #crea o sobreescribe el archivo mobo.txt con la informacion de la placa madre

lspci | grep -i 'vga\|3d' > gpu.txt #crea o sobreescribe el archivo gpu.txt con la informacion de la tarjeta grafica

{
uname -a
hostnamectl
} > sysinf.txt #crea o sobreescribe el archivo sysinf.txt con la informacion del kernel, arquitectura, nombre del sistema y host.

sudo lshw -short > summary.txt #crea o sobreescribe el archivo summary.txt con un resumen de la informacion del hardware

tar -czvf hw.tar.gz cpu.txt gpu.txt ram.txt disk.txt sysinf.txt mobo.txt summary.txt

mail -s "Hardware $user" -A hw.tar.gz gaspar.castro.utu@gmail.com
