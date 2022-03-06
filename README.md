## H.W. 3.7

#1

# ip link -Linux 

# ipconfig - Windows

#2

# LLDP   lldpctl

#3

# VLAN Пакеты : vlan, iproute.


/etc/systemd/network/vlan20.network

[Match]

Name=vlan20

[Network]

VLAN=vlan20

[Address]

Address=10.10.40.2/24

[Route]

Destination=10.10.40.0/24

Gateway=10.10.40.1

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