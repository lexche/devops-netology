## H.W. 3.5

#2.
Hardlink это ссылка на тот же самый файл и имеет тот же inode то права будут одни и теже.

# touch 11

# ln 11 22

# ls -ilh

total 24K

2038 -rw-r--r-- 2 root root    0 Feb 14 20:15 11

2038 -rw-r--r-- 2 root root    0 Feb 14 20:15 22

#4

/dev/sdb1       8:17    0 2G   0 part

/dev/sdb2       8:18    0 511M 0 part

#5

# sfdisk -d /dev/sdb|sfdisk --force /dev/sdc

#6

# mdadm --create --verbose /dev/md1 -l 1 -n 2 /dev/sd{b1,c1}

#7

# mdadm --create --verbose /dev/md2 -l 0 -n 2 /dev/sd{b2,c2}

#8

# pvcreate /dev/md1 /dev/md2

#9

# vgcreate vg1 /dev/md1 /dev/md2

#10

# lvcreate -L 100M vg1 /dev/md2

#11

# mkfs.ext4 /dev/vg1/lvol0

#12

# mkdir /tmp/new

# mount /dev/vg1/lvol0 /tmp/new

#14

NAME                 MAJ:MIN RM  SIZE RO TYPE  MOUNTPOINT

sda                    8:0    0   64G  0 disk

├─sda1                 8:1    0    1M  0 part  /boot/efi

├─sda2                 8:2    0    1G  0 part

└─sda3                 8:3    0   63G  0 part

  └─ubuntu--vg-ubuntu  253:0  0 31.5G  0 lvm   /

sdb                    8:16   0  2.5G  0 disk  

├─sdb1                 8:17   0    2G  0 part  

│ └─md1                9:1    0    2G  0 raid1 

└─sdb2                 8:18   0  511M  0 part  

  └─md2                9:0    0 1018M  0 raid0 

    └─vg1-lvol0      253:2    0  100M  0 lvm   /tmp/new

sdc                    8:32   0  2.5G  0 disk  

├─sdc1                 8:33   0    2G  0 part  

│ └─md1                9:1    0    2G  0 raid1 

└─sdc2                 8:34   0  511M  0 part  

  └─md2                9:0    0 1018M  0 raid0 

    └─vg1-lvol0      253:2    0  100M  0 lvm   /tmp/new

#15

# gzip -t /tmp/new/test.gz && echo $?

0

#16

# pvmove /dev/md2

#17

# mdadm /dev/md1 --fail /dev/sdb1

#18

# dmesg |grep md1

md/raid1:md1: not clean -- starting background reconstruction

md/raid1:md1: active with 2 out of 2 mirrors

md1: detected capacity change from 0 to 2144337920

md: resync of RAID array md1

md: md1: resync done.

md/raid1:md1: Disk failure on sdb1, disabling device.

md/raid1:md1: Operation continuing on 1 devices

#19

# gzip -t /tmp/new/test.gz && echo $?

0
