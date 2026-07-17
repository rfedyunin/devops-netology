# Домашнее задание к занятию «Введение в Terraform» - Федюнин Руслан

### Цели задания

1. Установить и настроить Terrafrom.
2. Научиться использовать готовый код.

------

### Чек-лист готовности к домашнему заданию

1. Скачайте и установите **Terraform** версии >=1.12.0 . Приложите скриншот вывода команды ```terraform --version```.
2. Скачайте на свой ПК этот git-репозиторий. Исходный код для выполнения задания расположен в директории **01/src**.
3. Убедитесь, что в вашей ОС установлен docker.

------

### Инструменты и дополнительные материалы, которые пригодятся для выполнения задания

1. Репозиторий с ссылкой на зеркало для установки и настройки Terraform: [ссылка](https://github.com/netology-code/devops-materials).
2. Установка docker: [ссылка](https://docs.docker.com/engine/install/ubuntu/).
------
### Внимание!! Обязательно предоставляем на проверку получившийся код в виде ссылки на ваш github-репозиторий!
------

### Задание 1

1. Перейдите в каталог [**src**](https://github.com/netology-code/ter-homeworks/tree/main/01/src). Скачайте все необходимые зависимости, использованные в проекте.
2. Изучите файл **.gitignore**. В каком terraform-файле, согласно этому .gitignore, допустимо сохранить личную, секретную информацию?(логины,пароли,ключи,токены итд)
3. Выполните код проекта. Найдите  в state-файле секретное содержимое созданного ресурса **random_password**, пришлите в качестве ответа конкретный ключ и его значение.
4. Раскомментируйте блок кода, примерно расположенный на строчках 29–42 файла **main.tf**.
Выполните команду ```terraform validate```. Объясните, в чём заключаются намеренно допущенные ошибки. Исправьте их.
5. Выполните код. В качестве ответа приложите: исправленный фрагмент кода и вывод команды ```docker ps```.
6. Замените имя docker-контейнера в блоке кода на ```hello_world```. Не перепутайте имя контейнера и имя образа. Мы всё ещё продолжаем использовать name = "nginx:latest". Выполните команду ```terraform apply -auto-approve```.
Объясните своими словами, в чём может быть опасность применения ключа  ```-auto-approve```. Догадайтесь или нагуглите зачем может пригодиться данный ключ? В качестве ответа дополнительно приложите вывод команды ```docker ps```.
8. Уничтожьте созданные ресурсы с помощью **terraform**. Убедитесь, что все ресурсы удалены. Приложите содержимое файла **terraform.tfstate**.
9. Объясните, почему при этом не был удалён docker-образ **nginx:latest**. Ответ **ОБЯЗАТЕЛЬНО НАЙДИТЕ В ПРЕДОСТАВЛЕННОМ КОДЕ**, а затем **ОБЯЗАТЕЛЬНО ПОДКРЕПИТЕ** строчкой из документации [**terraform провайдера docker**](https://library.tf/providers/kreuzwerker/docker/latest).  (ищите в классификаторе resource docker_image )


## Ответ:
1. ![Задание 1_1](https://github.com/rfedyunin/devops-netology/blob/main/18_Terraform/17_1_In_Terraform/img/18_1_1.jpg)

2. В файле personal.auto.tfvars можно хранить секретные переменные, потому что он явно исключён из Git.

3. "result": "VGxtnktdixTJ4Kkp",

4. Ошибки заключаются в неверном нейминге.
resource "docker_image" { - тут необходимо было указать имя ресурса - resource "docker_image" "nginx" {

resource "docker_container" "1nginx" { - имя не должно начинаться с цифры, можно использовать - resource "docker_container" "nginx" {

name = "example_${random_password.random_string_FAKE.resulT}" - тут заглавные буквы нужно изменить на строчные, и верное написание "name": "random_string", _FAKE лишнее

![Задание 1_4](https://github.com/rfedyunin/devops-netology/blob/main/18_Terraform/17_1_In_Terraform/img/18_1_4.jpg)

5.
``` bash
resource "docker_image" "nginx" {
  name         = "nginx:latest"
  keep_locally = true
}

resource "docker_container" "nginx" {
  image = docker_image.nginx.image_id
  name  = "example_${random_password.random_string.result}"

```

![Задание 1_5](https://github.com/rfedyunin/devops-netology/blob/main/18_Terraform/17_1_In_Terraform/img/18_1_5.jpg)

6. Terraform перед применением изменений показывает план (preview) и запрашивает подтверждение пользователя (ввод yes). Ключ -auto-approve пропускает этот шаг подтверждения, автоматически применяя изменения без предварительного просмотра или запроса согласия. Если в коде Terraform есть ошибки, использование -auto-approve не даст возможности заметить их до применения. Это может привести к созданию некорректной инфраструктуры или сбою в процессе применения.
Данный ключ будет полезен в автоматизированных пайплайнах непрерывной интеграции и доставки (CI/CD), его использование позволяет применять изменения без необходимости интерактивного ввода

![Задание 1_6](https://github.com/rfedyunin/devops-netology/blob/main/18_Terraform/17_1_In_Terraform/img/18_1_6.jpg)

7. Содержимое файла terraform.tfstate
```bash
{
  "version": 4,
  "terraform_version": "1.13.5",
  "serial": 13,
  "lineage": "b4d308e9-024a-c5ac-f6dd-af4d8b3fed65",
  "outputs": {},
  "resources": [],
  "check_results": null
}
```

8. Параметр keep_locally = true указывает Terraform, что при уничтожении ресурса образ должен быть сохранён локально, а не удалён.
Пункт из документации:
keep_locally (Boolean) If true, then the Docker image won't be deleted on destroy operation. If this is false, it will delete the image from the docker local storage on destroy operation.

------
