# Домашнее задание к занятию 15 «Система сбора логов Elastic Stack» - Федюнин Р.Ю.

## Задание 1

Вам необходимо поднять в докере и связать между собой при необходимости:

- elasticsearch (hot и warm ноды);
- logstash;
- kibana;
- filebeat.

Logstash следует сконфигурировать для приёма по tcp json-сообщений.

Filebeat следует сконфигурировать для отправки логов docker вашей системы в logstash.

В директории [help](./help) находится манифест docker-compose и конфигурации filebeat/logstash для быстрого
выполнения этого задания.

## Ответ на задание 1

- скриншот `docker ps` через 5 минут после старта всех контейнеров (их должно быть 5);
![Задание 21_3_1](https://github.com/rfedyunin/devops-netology/blob/main/21_Mon/21_3_ELK/img/21_3_1.jpg)


- скриншот интерфейса kibana;
![Задание 21_3_2](https://github.com/rfedyunin/devops-netology/blob/main/21_Mon/21_3_ELK/img/21_3_2.jpg)


## Задание 2

Перейдите в меню [создания index-patterns  в kibana](http://localhost:5601/app/management/kibana/indexPatterns/create) и создайте несколько index-patterns из имеющихся.

Перейдите в меню просмотра логов в kibana (Discover) и самостоятельно изучите, как отображаются логи и как производить поиск по логам.

В манифесте директории help также приведенно dummy-приложение, которое генерирует рандомные события в stdout-контейнера.
Эти логи должны порождать индекс logstash-* в elasticsearch. Если этого индекса нет — воспользуйтесь советами и источниками из раздела «Дополнительные ссылки» этого задания.

## Ответ на задание 2
![Задание 21_3_3](https://github.com/rfedyunin/devops-netology/blob/main/21_Mon/21_3_ELK/img/21_3_3.jpg)

---
