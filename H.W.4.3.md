H.W.4.3

#1

Было:

   { "info" : "Sample JSON output from our service\t",
        "elements" :[
            { "name" : "first",
            "type" : "server",
            "ip" : 7175 
            }
            { "name" : "second",
            "type" : "proxy",
            "ip : 71.78.22.43
            }
        ]
    }

Стало:
   { "info" : "Sample JSON output from our service",
        "elements" :[
            { "name" : "first",
            "type" : "server",
            "ip" : "7.1.7.5"
            }
            { "name" : "second",
            "type" : "proxy",
            "ip" : "71.78.22.43"
            }
        ]
    }


#2
  #!/usr/bin/env python3

import socket as s

import time as t

import datetime as dt

import json

import yaml

# set variables 

i     = 1

wait  = 2 # интервал проверок в секундах

srv   = {'drive.google.com':'0.0.0.0', 'mail.google.com':'0.0.0.0', 'google.com':'0.0.0.0'}

init  = 0

fpath = "/home/lexo/python/" #путь к файлам конфигов

flog  = "/home/lexo/python/error.log" #путь к файлам логов

# start script workflow

print('*** start script ***')

print(srv)

print('********************')


while 1 == 1 : # для бесконечного цикла, else  установить условие i >= чилу треуемых итераций

  for host in srv:

    is_error = False 

    ip = s.gethostbyname(host)

    if ip != srv[host]:

      if i==1 and init !=1: # выведем ошибку, если нет инициализации или есть иниц. и не первый шаг

        is_error=True

        # вывод ошибок в файл

        with open(flog,'a') as fl:

          print(str(dt.datetime.now().strftime("%Y-%m-%d %H:%M:%S")) +' [ERROR] ' + str(host) +' IP mistmatch: '+srv[host]+' '+ip,file=fl)

        # решение 4.3 - п2



        # json

        with open(fpath+host+".json",'w') as jsf:

          json_data= json.dumps({host:ip})

          jsf.write(json_data) 

        # yaml

        with open(fpath+host+".yaml",'w') as ymf:

          yaml_data= yaml.dump([{host : ip}])

          ymf.write(yaml_data) 

    # в один общий файл     

    if is_error:

      data = []  

      for host in srv:  

        data.append({host:ip})

      with open(fpath+"services_conf.json",'w') as jsf:

        json_data= json.dumps(data)

        jsf.write(json_data)

      with open(fpath+"services_conf.yaml",'w') as ymf:

        yaml_data= yaml.dump(data)

        ymf.write(yaml_data)

        #^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

      srv[host]=ip

  #print(i) # выведем шаг итерации для отладки

  i+=1 # счетчик итераций для отладки, закомментировать для бесконечного цикла

  if i >=50 : # число итераций для выхода из цикла для отладки

    break

  t.sleep(wait) # задержка на итерации



#2.1

*** start script ***

{'drive.google.com': '0.0.0.0', 'mail.google.com': '0.0.0.0', 'google.com': '0.0.0.0'}

********************

2022-04-26 18:09:24 [ERROR] drive.google.com IP mistmatch: 0.0.0.0 74.125.131.194

2022-04-26 18:09:24 [ERROR] mail.google.com IP mistmatch: 0.0.0.0 173.194.221.19

2022-04-26 18:09:24 [ERROR] google.com IP mistmatch: 0.0.0.0 173.194.222.113

#2.2

{

  "drive.google.com": "74.125.131.194",

  "mail.google.com": "173.194.221.19",

  "google.com": "173.194.222.113"

}

#2.3

---

drive.google.com: 74.125.131.194

google.com: 173.194.221.19

mail.google.com: 173.194.221.19

...
