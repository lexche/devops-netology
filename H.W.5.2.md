# Домашнее задание к занятию "5.2. Применение принципов IaaC в работе с виртуальными машинами."


## Задача 1
IaaC - новый подход к ведению дел в Ops. Это техническая реализация поставленной задачи, документирование действий и настроек одновременно при помощи написания кода. Кодинг для описания инфраструктуры приводит нас к необходимости разбираться в программировании. Применение паттернов IaaC опоравдано оптимизационно и функционально. Основополагающем принципом, в рамках IaaC, является обеспечение идемпотентности, которая обеспечивает стабильность получения предсказуемого постоянного результата.

## Задача 2
Ansible использует метод push, что не требует установки демонов, агентов. Использует SSH без необходимости дополнительно настраивать PKI.

## Задача 3
```
[lexo@ubnttest ~]$ vboxmanage --version
6.1.32_Ubuntur149290
```
```
[lexo@ubnttest ~]$ vagrant -v
Vagrant 2.2.6
```
```
[lexo@ubnttest ~]$ ansible --version
ansible 2.9.6
  config file = /etc/ansible/ansible.cfg
  configured module search path = ['/home/lexo/.ansible/plugins/modules', '/usr/share/ansible/plugins/modules']
  ansible python module location = /usr/lib/python3/dist-packages/ansible
  executable location = /usr/bin/ansible
  python version = 3.8.10 (default, Mar 15 2022, 12:22:08) [GCC 9.4.0]
```
```
