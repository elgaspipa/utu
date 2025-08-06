—------------------------------------------------------------------------------------------------------------------------
Descripción del programa
—------------------------------------------------------------------------------------------------------------------------
Este script recopila información detallada del sistema, y la envía a través de netcat a una IP remota y también envía la misma información mediante correo electrónico.

—------------------------------------------------------------------------------------------------------------------------
Importante
—------------------------------------------------------------------------------------------------------------------------
 Este script fue realizado simplemente con fines educativos, el mal uso del mismo puede llegar a ser peligroso, violando leyes de privacidad y ciberseguridad.

—------------------------------------------------------------------------------------------------------------------------
Funcionalidad
—------------------------------------------------------------------------------------------------------------------------
El primer script (bash.sh) lo que hace es que al ejecutarse verifica si cuenta con las herramientas necesarias para funcionar correctamente, algunas de esas herramientas son "netcat", "lshw"lscpu",  "mailutils",  "msmtp-mta mailutils", estas mismas son importantes para la ejecución del programa.
Recolecta información del sistema:
CPU (lscpu)
Hardware en general (lshw)
Memoria ( free -h)
Disco ( df -h)
Red (ip a)
Guarda información en un archivo (datos.txt) envía el archivo al servidor remoto usando netcat y luego a un correo electrónico el cual esta configurado con msmtp.

El segundo script (atacante.sh) actúa como receptor de la información enviada desde el equipo remoto (víctima), permitiendo al usuario escuchar conexiones entrantes en el puerto 4444 mediante Netcat.


—------------------------------------------------------------------------------------------------------------------------
Instalación y uso
—------------------------------------------------------------------------------------------------------------------------
Este programa debe ser ejecutado con permisos, por lo tanto antes de ejecutarlo debemos otorgarle permisos usando los siguientes comandos:
sudo bash.sh
sudo atacante.sh
chmod +x bash.sh
chmod +x atacante.sh
Para ejecutar el programa usaremos los siguientes comandos:
./atacante.sh
Escucha en el puerto 4444 con Netcat, instalándolo si es necesario, para recibir y mostrar datos enviados desde otro sistema.
./bash.sh  
Esto ejecuta y recopila la información para posteriormente ser enviada mediante correo electrónico y a la maquina del atacante.

—------------------------------------------------------------------------------------------------------------------------
Ejemplos de uso:
—------------------------------------------------------------------------------------------------------------------------
Diagnóstico Remoto de Sistemas:
 Un técnico o equipo de soporte usa el script para diagnosticar problemas de rendimiento en servidores remotos. El script recopila la información sobre hardware del servidor, memoria, y red, lo que permite identificar cuales son los posibles cuellos de botella o configuraciones incorrectas. Este diagnóstico rápido facilita la resolución de problemas sin necesidad de acceso físico.


Ejercicio Controlado de Pentesting:
 En un ejercicio de pentesting autorizado, un atacante simula un ataque para evaluar cómo un sistema maneja la exfiltración de datos y la fiabilidad y seguridad que este posee. Usando este script, se puede obtener y enviar datos de hardware, red y sistema operativo, probando las defensas del sistema ante posibles ataques reales de exfiltración para así evaluarlo y de ser necesario mejorarlo.
