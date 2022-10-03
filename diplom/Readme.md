# Дипломный практикум в YandexCloud

## Цели:

1. Зарегистрировать доменное имя (любое на ваш выбор в любой доменной зоне).
2. Подготовить инфраструктуру с помощью Terraform на базе облачного провайдера YandexCloud.
3. Настроить внешний Reverse Proxy на основе Nginx и LetsEncrypt.
4. Настроить кластер MySQL.
5. Установить WordPress.
6. Развернуть Gitlab CE и Gitlab Runner.
7. Настроить CI/CD для автоматического развёртывания приложения.
8. Настроить мониторинг инфраструктуры с помощью стека: Prometheus, Alert Manager и Grafana.


#### 1.
Регистрирую домен lexanar.ru на nic.ru. Прописываю DNS-серверы YC.

![img.png](scrnshts/1.png)

#### 2.

В cилу ограниченности по ресурсам выбрал путь с одним workspace.

В Terraform Cloud создаю workspace:

![img.png](scrnshts/2.png)

Развёртывание инфраструктуры в YC будет осуществляться при помощи Terraform. Конфигурационные файлы доступны по [ссылке.](https://github.com/lexche/devops-netology/tree/master/diplom/terraform)

Вывод команды   `terraform init`:

``` Initializing Terraform Cloud...

Initializing provider plugins...
- Finding yandex-cloud/yandex versions matching "0.75.0"...
- Installing yandex-cloud/yandex v0.75.0...
- Installed yandex-cloud/yandex v0.75.0 (self-signed, key ID E40F590B50BB8E40)

Partner and community providers are signed by their developers.
If you'd like to know more about provider signing, you can read about it here:
https://www.terraform.io/docs/cli/plugins/signing.html

Terraform has created a lock file .terraform.lock.hcl to record the provider
selections it made above. Include this file in your version control repository
so that Terraform can guarantee to make the same selections by default when
you run "terraform init" in the future.

Terraform Cloud has been successfully initialized!

You may now begin working with Terraform Cloud. Try running "terraform plan" to
see any changes that are required for your infrastructure.

If you ever set or change modules or Terraform Settings, run "terraform init"
again to reinitialize your working directory.

terraform validate:
Success! The configuration is valid.     
```

Далее terraform apply --auto-approve. Проверяю создануую инфраструктуру в YC:

![img.png](scrnshts/3.png)

![img.png](scrnshts/5.png)

Успех.

#### 3-5.

Далее использую Ansible. Конфигурации ролей доступны по [ссылке.](https://github.com/lexche/devops-netology/tree/master/diplom/ansible)

Добавляю значения output-переменных Terraform в ~/.ssh/config .

Очищаю  файл known_hosts.

Добавляю IP-адреса серверов в variables.yml





