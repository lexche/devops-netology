## H.W. 3.7

#1

# ip link -Linux 

# ipconfig - Windows

#2

# LLDP   lldpctl

#3

# VLAN Пакеты : vlan, iproute.

# sw1# show vlan brief

# VLAN Name                             Status    Ports

---- -------------------------------- --------- -------------------------------

1    default                          active    Fa0/6, Fa0/7, Fa0/8, Fa0/9, 

                                                Fa0/10, Fa0/11, Fa0/12, Fa0/13,

                                                Fa0/14, Fa0/15, Fa0/16, Fa0/17,  

                                                Fa0/18, Fa0/19, Fa0/20, Fa0/21,

                                                Fa0/22, Fa0/23, Fa0/24


2    test                             active    Fa0/1, Fa0/2

    

10   VLAN0010                         active    Fa0/4, Fa0/5

#4

# Статический и динамический

# mode=0 (balance-rr)  mode=1 (active-backup)  mode=2 (balance-xor)  mode=3 (broadcast)  

# mode=4 (802.3ad)  mode=5 (balance-tlb)  mode=6 (balance-alb)


sudo nano /etc/network/interfaces

# The primary network interface

auto bond0

iface bond0 inet static

    address x.x.x.x

    netmask 255.255.255.0    

    gateway x.x.x.x

    dns-nameservers x.x.x.x x.x.x.x

    dns-search domain.local

        slaves eth0 eth1

        bond_mode 0

        bond-miimon 100

        bond_downdelay 200

        bound_updelay 200

#5

# 8 IP-адресов  32 подсети

#6

100.64.0.1/26

#7

arp -a

ip neigh flush all - Linux  netsh interface ip delete arpcache - Windows

arp -d IP