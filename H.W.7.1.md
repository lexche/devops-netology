# Домашнее задание к занятию "7.1. Инфраструктура как код."


## Задача 1

Какой тип инфраструктуры будем использовать для этого проекта: изменяемый или не изменяемый?

Оба варианта,так как систему необходимо развернуть, а так же планируются частые доработкаи\релизы.

Будет ли центральный сервер для управления инфраструктурой?

Нет.

Будут ли агенты на серверах?

Нет, так как использовал бы Ansible, а он не использует агенты.

Будут ли использованы средства для управления конфигурацией или инициализации ресурсов?

Да, при использовании изменяемой и неизменяемой инфраструктуры, с учетом частых обновлений и последующего расширения логично использовать оба средства и для управления конфигурацией и для инициализации ресурсов.

Какие инструменты из уже используемых вы хотели бы использовать для нового проекта?

Ansible, Terraform.

Хотите ли рассмотреть возможность внедрения новых инструментов для этого проекта?

Нет, так как конечный вид системы ещё непонятен, то использовал бы, на первом этапе, то, что есть.

## Задача 2

    $ terraform -v
    Terraform v1.1.9
    on linux_amd64

    Your version of Terraform is out of date! The latest version
    is 1.2.3. You can update by downloading from https://www.terraform.io/downloads.html

## Задача 3

Скачал второй Бинарник из архива версий

    $ terraform0.12.31 -v
    Terraform v0.12.31

    Your version of Terraform is out of date! The latest version
    is 1.2.3. You can update by downloading from https://www.terraform.io/downloads.html