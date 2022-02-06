#2
CPU:

node_cpu_seconds_total{cpu="0",mode="idle"} 1306.96

node_cpu_seconds_total{cpu="0",mode="system"} 8.38

node_cpu_seconds_total{cpu="0",mode="user"} 1402

Memory:

node_memory_MemAvailable_bytes 

node_memory_MemFree_bytes

Disk:

node_disk_io_time_seconds_total{device="sda"} 

node_disk_read_bytes_total{device="sda"} 

node_disk_read_time_seconds_total{device="sda"} 

node_disk_write_time_seconds_total{device="sda"}

Network:

node_network_receive_errs_total{device="eth0"} 

node_network_receive_bytes_total{device="eth0"} 

node_network_transmit_bytes_total{device="eth0"}

node_network_transmit_errs_total{device="eth0"}

#4
Да, можно.

#5
1048576

Это максимальное число открытых дескрипторов для ядра (системы).

ulimit -Hn жёсткий лимит на пользователя. Не может быть увеличен, только уменьшен.

#6
root@vagrant:~# ps -e |grep sleep

   107 pts/2    00:00:00 sleep

root@vagrant:~# nsenter --target 107 --pid --mount

root@vagrant:/# ps

    PID TTY          TIME CMD

     144 pts/0    00:00:00 bash

     247 pts/0    00:00:00 ps
#7
:(){ :|:& };: - это функция внутри "{}", судя по всему, с именем ":" ,

которая после опредения в строке запускает саму себя, "внутренняя часть" пораждает два фоновых процесса самой себя,

получается бинарное дерево плодящее процессы 

А функционал судя по всему этот:

[ 3099.973235] cgroup: fork rejected by pids controller in /user.slice/user-1000.slice/session-4.scope

[ 3103.171819] cgroup: fork rejected by pids controller in /user.slice/user-1000.slice/session-11.scope

Система на основании этих файлов в пользовательской зоне ресурсов имеет определенное ограничение на создаваемые рекурси 

и при превышении начинает блокировать создание числа 

Если установить ulimit -u x - число процессов будет ограниченно x для пользоователя.