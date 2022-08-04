# Домашнее задание к занятию "08.01 Введение в Ansible."


1

![img.png](screenshots/8.1.1.png)

2

![img.png](screenshots/8.1.2.png)

4

![img.png](screenshots/8.1.3.png)

5-6

![img.png](screenshots/8.1.4.png)

7

    ansible-vault encrypt group_vars/deb/examp.yml && ansible-vault encrypt group_vars/el/examp.yml

8

    ansible-playbook -i inventory/prod.yml site.yml --ask-vault-pass

9

local

10

    local:
  
    hosts:
    
      localhost:
      
        ansible_connection: local

11

![img.png](screenshots/8.1.6.png)