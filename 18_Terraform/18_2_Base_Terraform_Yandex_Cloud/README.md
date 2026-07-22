# Домашнее задание к занятию «Основы Terraform. Yandex Cloud» - Федюнин Руслан


### Задание 1
В качестве ответа всегда полностью прикладывайте ваш terraform-код в git.
Убедитесь что ваша версия **Terraform** ~>1.12.0

1. Изучите проект. В файле variables.tf объявлены переменные для Yandex provider.
2. Создайте сервисный аккаунт и ключ. [service_account_key_file](https://terraform-provider.yandexcloud.net).
3. Сгенерируйте новый или используйте свой текущий ssh-ключ. Запишите его открытую(public) часть в переменную **vms_ssh_public_root_key**.
4. Инициализируйте проект, выполните код. Исправьте намеренно допущенные синтаксические ошибки. Ищите внимательно, посимвольно. Ответьте, в чём заключается их суть.
5. Подключитесь к консоли ВМ через ssh и выполните команду ``` curl ifconfig.me```.
Примечание: К OS ubuntu "out of a box, те из коробки" необходимо подключаться под пользователем ubuntu: ```"ssh ubuntu@vm_ip_address"```. Предварительно убедитесь, что ваш ключ добавлен в ssh-агент: ```eval $(ssh-agent) && ssh-add``` Вы познакомитесь с тем как при создании ВМ создать своего пользователя в блоке metadata в следующей лекции.;
6. Ответьте, как в процессе обучения могут пригодиться параметры ```preemptible = true``` и ```core_fraction=5``` в параметрах ВМ.

В качестве решения приложите:

- скриншот ЛК Yandex Cloud с созданной ВМ, где видно внешний ip-адрес;
- скриншот консоли, curl должен отобразить тот же внешний ip-адрес;
- ответы на вопросы.

## Ответ:

1,2,3 - выполнено

4. Ошибки заключались:
- в неверном занчении параметра platform_id = "standart-v4"
Согласно документации, верное занчение - standard-v3
Ссылка на документацию: [ссылка](https://yandex.cloud/ru/docs/compute/concepts/vm-platforms).
- В неверном значении параметра core_fraction = 5, допустимо 20, 50 или 100
- В неверном значении числа ядер cores = 1, допуситимо 2 или 4
 ![Задание 1_4](https://github.com/rfedyunin/devops-netology/blob/main/18_Terraform/18_2_Base_Terraform_Yandex_Cloud/img/18_2_1.jpg)

5.
![Задание 1_5](https://github.com/rfedyunin/devops-netology/blob/main/18_Terraform/18_2_Base_Terraform_Yandex_Cloud/img/curl.jpg)
![Задание 1_5](https://github.com/rfedyunin/devops-netology/blob/main/18_Terraform/18_2_Base_Terraform_Yandex_Cloud/img/yc_ip_vm.jpg)

6. preemptible = true означает, что виртуальная машина создаётся в прерываемом режиме

core_fraction определяет, какую долю вычислительной мощности ядра (в процентах) будет использовать виртуальная машина

Оба эти параметра позволяют экономить на стоимости ресурсов, так как для обучения не важжна вычислительная мощность и не критично прерывание виртуальной машины в любой момент.


### Задание 2

1. Замените все хардкод-**значения** для ресурсов **yandex_compute_image** и **yandex_compute_instance** на **отдельные** переменные. К названиям переменных ВМ добавьте в начало префикс **vm_web_** .  Пример: **vm_web_name**.
2. Объявите нужные переменные в файле variables.tf, обязательно указывайте тип переменной. Заполните их **default** прежними значениями из main.tf.
3. Проверьте terraform plan. Изменений быть не должно.

## Ответ:
![Задание 2](https://github.com/rfedyunin/devops-netology/blob/main/18_Terraform/18_2_Base_Terraform_Yandex_Cloud/img/18_2_2.jpg)



### Задание 3

1. Создайте в корне проекта файл 'vms_platform.tf' . Перенесите в него все переменные первой ВМ.
2. Скопируйте блок ресурса и создайте с его помощью вторую ВМ в файле main.tf: **"netology-develop-platform-db"** ,  ```cores  = 2, memory = 2, core_fraction = 20```. Объявите её переменные с префиксом **vm_db_** в том же файле ('vms_platform.tf').  ВМ должна работать в зоне "ru-central1-b"
3. Примените изменения.


## Ответ:

![Задание 3](https://github.com/rfedyunin/devops-netology/blob/main/18_Terraform/18_2_Base_Terraform_Yandex_Cloud/img/18_2_3.jpg)




### Задание 4

1. Объявите в файле outputs.tf **один** output , содержащий: instance_name, external_ip, fqdn для каждой из ВМ в удобном лично для вас формате.(без хардкода!!!)
2. Примените изменения.

В качестве решения приложите вывод значений ip-адресов команды ```terraform output```.

## Ответ:

![Задание 4](https://github.com/rfedyunin/devops-netology/blob/main/18_Terraform/18_2_Base_Terraform_Yandex_Cloud/img/18_2_4.jpg)






### Задание 5

1. В файле locals.tf опишите в **одном** local-блоке имя каждой ВМ, используйте интерполяцию ${..} с НЕСКОЛЬКИМИ переменными по примеру из лекции.
2. Замените переменные внутри ресурса ВМ на созданные вами local-переменные.
3. Примените изменения.


## Ответ:

![Задание 5](https://github.com/rfedyunin/devops-netology/blob/main/18_Terraform/18_2_Base_Terraform_Yandex_Cloud/img/18_2_5.jpg)




### Задание 6

1. Вместо использования трёх переменных  ".._cores",".._memory",".._core_fraction" в блоке  resources {...}, объедините их в единую map-переменную **vms_resources** и  внутри неё конфиги обеих ВМ в виде вложенного map(object).
   ```
   пример из terraform.tfvars:
   vms_resources = {
     web={
       cores=2
       memory=2
       core_fraction=5
       hdd_size=10
       hdd_type="network-hdd"
       ...
     },
     db= {
       cores=2
       memory=4
       core_fraction=20
       hdd_size=10
       hdd_type="network-ssd"
       ...
     }
   }
   ```
3. Создайте и используйте отдельную map(object) переменную для блока metadata, она должна быть общая для всех ваших ВМ.
   ```
   пример из terraform.tfvars:
   metadata = {
     serial-port-enable = 1
     ssh-keys           = "ubuntu:ssh-ed25519 AAAAC..."
   }
   ```

5. Найдите и закоментируйте все, более не используемые переменные проекта.
6. Проверьте terraform plan. Изменений быть не должно.



## Ответ:

![Задание 6](https://github.com/rfedyunin/devops-netology/blob/main/18_Terraform/18_2_Base_Terraform_Yandex_Cloud/img/18_2_6.jpg)



------
