# Домашнее задание к занятию "6.4. PostgreSQL"


## Задача 1

    \l - список БД
    \c[onnect] {[DBNAME|- USER|- HOST|- PORT|-] | conninfo} connect to new database (currently "postgres") - подключение к БД
    \dt[S+] [PATTERN] - список таблиц
    \d[S+]  NAME - описание содержимого таблиц
    \q - выход из psql

## Задача 2

Создание базы

    postgres=# CREATE DATABASE test_database;
    CREATE DATABASE

Восстановление базы

    $ psql -U postgres -f /backup/dump.sql test_database


    test_database=# ANALYZE VERBOSE public.orders;
    INFO:  analyzing "public.orders"
    INFO:  "orders": scanned 1 of 1 pages, containing 8 live rows and 0 dead rows; 8 rows in sample, 8 estimated total rows
    ANALYZE

Использование таблицы pg_stats

    postgres=# select avg_width from pg_stats where tablename='orders';
     avg_width 
    -----------
             4
            16
             4
    (3 rows)

## Задача 3

Да, можно было, необходимо было определить тип на моменте проектирования и создания - partitioned table.

    postgres=# 
    begin;
        create table orders_simple (
            id integer NOT NULL,
            title varchar(80) NOT NULL,
            price integer) partition by range(price);
        create table orders_less499 partition of orders_new for values from (0) to (499);
        create table orders_more499 partition of orders_new for values from (499) to (99999);
        insert into orders_simple (id, title, price) select * from orders;
    commit;
    BEGIN
    CREATE TABLE
    CREATE TABLE
    CREATE TABLE
    INSERT 0 8
    COMMIT

## Задача 4

    # pg_dump -U postgres -d test_database >test_database_dump.sql

Для уникальности можно добавить индекс или первичный ключ.
