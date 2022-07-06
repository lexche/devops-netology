# Домашнее задание к занятию "6.5. Elasticsearch"


## Задача 1

Dockerfile:

    FROM centos:centos7
    
    RUN yum -y install wget; yum clean all && \
            groupadd --gid 1000 elasticsearch && adduser --uid 1000 --gid 1000 --home /usr/share/elasticsearch elasticsearch && \
            mkdir /var/lib/elasticsearch/ && chown -R 1000:1000 /var/lib/elasticsearch/

    USER 1000:1000

    WORKDIR /usr/share/elasticsearch

    ENV EL_VER=8.0.1

    RUN wget -q https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-${EL_VER}-linux-x86_64.tar.gz && \
	    tar -xzf elasticsearch-${EL_VER}-linux-x86_64.tar.gz && cp -rp elasticsearch-${EL_VER}/* ./ && \
            rm -rf elasticsearch-${EL_VER}*

    COPY ./elasticsearch.yml /usr/share/elasticsearch/config/

    EXPOSE 9200

    CMD ["bin/elasticsearch"]

Dockerhub's link: https://hub.docker.com/r/lexche/elsrch

Вывод ES:

    {
      "name" : "netology_test",
      "cluster_name" : "netology",
      "cluster_uuid" : "4mmFKIsjR92faDnA484tTg",
      "version" : {
        "number" : "8.0.1",
        "build_flavor" : "default",
        "build_type" : "tar",
        "build_hash" : "ed38g5c1b4c2182c9c1bbecc727003a907c0c7aa",
        "build_date" : "2022-07-04T16:13:40.601285296Z",
        "build_snapshot" : false,
        "lucene_version" : "9.0.0",
        "minimum_wire_compatibility_version" : "7.17.0",
        "minimum_index_compatibility_version" : "7.0.0"
      },
      "tagline" : "You Know, for Search"
    }

## Задача 2

Создание индексов

    curl -X PUT localhost:9200/ind-1 -H 'Content-Type: application/json' -d'{ "settings": { "number_of_shards": 1,  "number_of_replicas": 0 }}'
    curl -X PUT localhost:9200/ind-2 -H 'Content-Type: application/json' -d'{ "settings": { "number_of_shards": 2,  "number_of_replicas": 1 }}'
    curl -X PUT localhost:9200/ind-3 -H 'Content-Type: application/json' -d'{ "settings": { "number_of_shards": 4,  "number_of_replicas": 2 }}'

Список индексов

    $ curl -X GET 'http://localhost:9200/_cat/indices?v' 
    health status index uuid                   pri rep docs.count docs.deleted store.size pri.store.size
    green  open   ind-1 48X4_yJeScSJPdb6v1BzqQ   1   0          0            0       208b           208b
    yellow open   ind-3 Zas5bPmBS4ODzEgVNjw2_7   4   2          0            0       832b           832b
    yellow open   ind-2 5Rs4YZS9SmmKEsYTin3_wS   2   1          0            0       416b           416b

Состояние кластера

    {
      "cluster_name" : "netology",
      "status" : "yellow",
      "timed_out" : false,
      "number_of_nodes" : 1,
      "number_of_data_nodes" : 1,
      "active_primary_shards" : 9,
      "active_shards" : 9,
      "relocating_shards" : 0,
      "initializing_shards" : 0,
      "unassigned_shards" : 10,
      "delayed_unassigned_shards" : 0,
      "number_of_pending_tasks" : 0,
      "number_of_in_flight_fetch" : 0,
      "task_max_waiting_in_queue_millis" : 0,
      "active_shards_percent_as_number" : 45.738924031631563
    }

Состояние yellow по кластеру связано с тем, что есть unassigned шарды.

Удаление индексов:

    $ curl -X DELETE 'http://localhost:9200/ind-1?pretty' 
    {
      "acknowledged" : true
    }
    $ curl -X DELETE 'http://localhost:9200/ind-2?pretty' 
    {
      "acknowledged" : true
    }
    $ curl -X DELETE 'http://localhost:9200/ind-3?pretty' 
    {
      "acknowledged" : true
    }

## Задача 3

# Создайте директорию {путь до корневой директории с elasticsearch в образе}/snapshots.

В elasticsearch.yml была добавлена директива path.repo: /usr/share/elasticsearch/snapshots, сам запрос на регистрацию snapshot repo:

    $ curl --cacert /usr/share/elasticsearch/config/certs/http_ca.crt -u elastic -X PUT https://localhost:9200/_snapshot/netology_backup?pretty -H 'Content-Type: application/json' -d' { "type": "fs", "settings": { "location": "/usr/share/elasticsearch/snapshots"}}'
    Enter host password for user 'elastic':
    {
      "acknowledged" : true
    }

# Приведите в ответе запрос API и результат вызова API для создания репозитория.

    $ curl -XPOST localhost:9200/_snapshot/netology_backup?pretty -H 'Content-Type: application/json' -d'{"type": "fs", "settings": { "location":"/usr/share/elasticsearch/snapshots" }}'
    {
      "acknowledged" : true
    }

    {
      "netology_backup" : {
        "type" : "fs",
        "settings" : {
          "location" : "/usr/share/elasticsearch/snapshots"
        }
      }
    }

# Список индексов
	$ curl --cacert /usr/share/elasticsearch/config/certs/http_ca.crt -u elastic https://localhost:9200/_cat/indices?v
    Enter host password for user 'elastic':
    health status index uuid                   pri rep docs.count docs.deleted store.size pri.store.size
    green  open   test  s4duHjRTQBacJyWPGeNw4f   1   0          0            0       225b           225b

# Приведите в ответе список файлов в директории со snapshotами.

    drwxrwxr-x. 3 elasticsearch elasticsearch 4.0K Jul  5 13:28 .
    drwx------. 1 elasticsearch elasticsearch 4.0K Jul  5 13:04 ..
    -rw-r--r--. 1 elasticsearch elasticsearch 1.1K Jul  5 13:28 index-0
    -rw-r--r--. 1 elasticsearch elasticsearch    8 Jul  5 13:28 index.latest
    drwxr-xr-x. 5 elasticsearch elasticsearch 4.0K Jul  5 13:28 indices
    -rw-r--r--. 1 elasticsearch elasticsearch  18K Jul  5 13:28 meta-YCONu7qjRemBquBUkalV2g.dat
    -rw-r--r--. 1 elasticsearch elasticsearch  396 Jul  5 13:28 snap-YCONu7qjRemBquBUkalV2g.dat

# Список индексов после удаления и создания.

    health status index  uuid                   pri rep docs.count docs.deleted store.size pri.store.size
    green  open   test-2 s3Q6OZ7YTkuk6LfE2cTCs4   1   0          0            0       225b           225b

# Запрос к API восстановления и итоговый список индексов.

    $ curl -X POST localhost:9200/_snapshot/netology_backup/elasticsearch/_restore?pretty -H 'Content-Type: application/json' -d'{"include_global_state":true}'
    {
      "accepted" : true
    }


    health status index  uuid                   pri rep docs.count docs.deleted store.size pri.store.size
    green  open   test-2 s3Q6OZ7YTkuk6LfE2cTCs4   1   0          0            0       225b           225b
    green  open   test   HzFsM8gwT1WPFxzDLl0Uew   1   0          0            0       225b           225b
