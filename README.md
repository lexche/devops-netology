## H.W. 3.3
#1.
CD -> chdir("/tmp")

#2
/usr/share/misc/magic.mgc

#3
echo '' >/proc/#PID/fd/#desc

#4
Зомби процессы освобождают свои ресурсы, но не запись в таблице процессов.

#5
root@vagrant:~# dpkg -L bpfcc-tools | grep sbin/opensnoop

/usr/sbin/opensnoop-bpfcc

root@vagrant:~# /usr/sbin/opensnoop-bpfcc

PID    COMM               FD ERR PATH

848    vminfo              4   0 /var/run/utmp

633    dbus-daemon        -1   2 /usr/local/share/dbus-1/system-services

633    dbus-daemon        20   0 /usr/share/dbus-1/system-services

633    dbus-daemon        -1   2 /lib/dbus-1/system-services

633    dbus-daemon        20   0 /var/lib/snapd/dbus-1/system-services/

#6
Cистемный вызов uname()

Part of the utsname information is also accessible  via  /proc/sys/kernel/{ostype, hostname, osrelease, version, domainname}.

#7
&& -  условный оператор, 
а ;  - разделитель последовательных команд

Использовать &&  вместе с set -e не имеет смысла, так как при ошибке , выполнение команд прекратиться.

#8
-e прерывает выполнение исполнения при ошибке любой команды кроме последней в последовательности

-x вывод трейса простых команд

-u неустановленные/не заданные параметры и переменные считаются как ошибки, 

с выводом в stderr текста ошибки и выполнит завершение неинтерактивного вызова

-o pipefail возвращает код возврата набора/последовательности команд, 

ненулевой при последней команды или 0 для успешного выполнения команд.

Для сценария , повышает деталезацию вывода ошибок(логирования) и завершит сценарий при наличии ошибок, 

на любом этапе выполнения сценария, кроме последней завершающей команды

#9
S*(S,S+,Ss,Ssl,Ss+) - Процессы ожидающие завершения

I*(I,I<) - фоновые(бездействующие) процессы ядра

Дополнительные символы - это дополнительные характеристики.