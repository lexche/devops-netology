# H.W.3.8

#1. Routing entry for 188.35.16.0/21

  Known via "bgp 6447", distance 20, metric 0
  
  Tag 6939, type external
  
  Last update from 64.71.137.241 1d22h ago
  
  Routing Descriptor Blocks:
  
  * 64.71.137.241, from 64.71.137.241, 1d22h ago
  * 
      Route metric is 0, traffic share count is 1
      
      AS Hops 3
      
      Route tag 6939
      
      MPLS label: none

#2. Destination     Gateway         Genmask         Flags Metric Ref    Use Iface

#default          *              0.0.0.0         UG    0      0        0 eth0

#172.22.144.0    0.0.0.0         255.255.240.0   U     0      0        0 eth0

#10.10.10.0       *              255.255.255.0   U     0      0        0 dummy0

#169.254.0.0      *              255.255.240.0   U     0      0        0 dummy0

root@itpbt001:/home/lexo# ip route add 10.10.10.0 via 192.168.18.150

root@itpbt001:/home/lexo# ip route

10.10.10.0 via 192.168.18.150 dev dummy0



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
