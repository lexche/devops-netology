# H.W.3.8

#1. Не удалось подключиться к удалённому роутеру.

#2.

# Destination     Gateway         Genmask         Flags Metric Ref    Use Iface

#default          *              0.0.0.0         UG    0      0        0 eth0

#172.22.144.0    0.0.0.0         255.255.240.0   U     0      0        0 eth0

#10.10.10.0       *              255.255.255.0   U     0      0        0 dummy0

#169.254.0.0      *              255.255.240.0   U     0      0        0 dummy0

#3
#ss -pt

#Recv-Q      Send-Q           Local Address:Port             Peer Address:Port     Process                       

#0           511                       [::]:http                     [::]:*         users:(("nginx",pid=8914,fd=7),("nginx",pid=8913,fd=7))      

#0           128                       [::]:ssh                      [::]:*         users:(("sshd",pid=973,fd=4))                                

#4

#ss -ulnp

#State       Recv-Q     Send-Q       Local Address:Port          Peer Address:Port     Process

#UNCONN      0          0            127.0.0.1:323               0.0.0.0:*             users:(("chronyd",pid=867,fd=6))

#UNCONN      0          0            0.0.0.0:49595               0.0.0.0:*             users:(("httpd",pid=104119,fd=20))

# Сhrony NTP

#Apache 2.4 HTTP
