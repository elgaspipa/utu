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
El script lo que hace es que al ejecutarse verifica si cuenta con las herramientas necesarias para funcionar correctamente, algunas de esas herramientas son "netcat", "lshw"lscpu",  "mailutils",  "msmtp-mta mailutils", estas mismas son importantes para la ejecución del programa.
Recolecta información del sistema:
CPU (lscpu)
Hardware en general (lshw)
Memoria ( free -h)
Disco ( df -h)
Red (ip a)
Guarda información en un archivo (datos.txt) envía el archivo al servidor remoto usando netcat y luego a un correo electrónico el cual esta configurado con msmtp.

—------------------------------------------------------------------------------------------------------------------------
Instalación y uso
—------------------------------------------------------------------------------------------------------------------------
Este programa debe ser ejecutado con permisos sudo, por lo tanto antes de ejecutarlo debemos otorgarle permisos usando el siguiente comando:
chmod +x bash.sh
Para ejecutar el script usaremos el siguiente comando:
./bash.sh  
Permitiendo al script ejecutarse y recopilar dicha información para posteriormente ser enviada mediante correo electrónico.
—------------------------------------------------------------------------------------------------------------------------
Ejemplos de uso:
—------------------------------------------------------------------------------------------------------------------------
Diagnóstico Remoto de Sistemas:
 Un técnico o equipo de soporte usa el script para diagnosticar problemas de rendimiento en servidores remotos. El script recopila la información sobre hardware del servidor, memoria, y red, lo que permite identificar cuales son los posibles cuellos de botella o configuraciones incorrectas. Este diagnóstico rápido facilita la resolución de problemas sin necesidad de acceso físico.


Ejercicio Controlado de Pentesting:
 En un ejercicio de pentesting autorizado, un atacante simula un ataque para evaluar cómo un sistema maneja la exfiltración de datos y la fiabilidad y seguridad que este posee. Usando este script, se puede obtener y enviar datos de hardware, red y sistema operativo, probando las defensas del sistema ante posibles ataques reales de exfiltración para así evaluarlo y de ser necesario mejorarlo.
