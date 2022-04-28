# H.W.4.1

#1

# c = "a+b" - так как указали текст, а не переменные.

# d = "1+3" - команда преобразовала вывела значения переменных, но не выполнила арифметическйо операции, так как по умолчанию это строки.

# e = "3"   - так как теперь за счет скобок мы дали команду на выполнение арифметической операции со значениями переменных.

#2

    while (( 1 == 1 ))

    do curl https://localhost:4757

    if (($? != 0))

        then date >> curl.log

        else exit

        fi

        sleep 10

    done
# Первая строка добавлена закрывающая скобка. Добавлена строка else exit ,

# чтобы выйти из цикла в случае успешного выполнения. Добавлена строка sleep 10, чтобы был интервал опроса.

#3

cat check_hosts

hosts=(192.168.0.1 173.194.222.113 87.250.250.24)

timeout=5

for i in {1..5}

do date >>hosts.log

    for h in ${hosts[@]}

    do curl -Is --connect-timeout $timeout $h:80 >/dev/null

        echo "check" $h status=$? >>hosts.log

    done

done

#4

# Добавлено в начало указание списка хостов через переменную, таймаут на ожидания коннекта для курла

# в цикле выполнять пока переменная res = 0 (в которой результат curl)

cat check2_hosts

hosts=(192.168.0.1 173.194.222.113 87.250.250.24)

timeout=5

res=0

while (($res == 0))

do for h in ${hosts[@]}

    do curl -Is --connect-timeout $timeout $h:80 >/dev/null

    res=$?

    if (($res != 0))

    then echo "ERROR on " $h status=$res >>hosts2.log

    fi

    done

done
