# Домашнее задание к занятию 14 «Средство визуализации Grafana» - Федюнин Р.Ю.



## Задание 1

1. Используя директорию [help](./help) внутри этого домашнего задания, запустите связку prometheus-grafana.
1. Зайдите в веб-интерфейс grafana, используя авторизационные данные, указанные в манифесте docker-compose.
1. Подключите поднятый вами prometheus, как источник данных.
1. Решение домашнего задания — скриншот веб-интерфейса grafana со списком подключенных Datasource.

### Ответ на заданий 1

![Задание 21_2_1](https://github.com/rfedyunin/devops-netology/blob/main/21_Mon/21_2_Grafana/img/21_2_1.jpg)

## Задание 2

Изучите самостоятельно ресурсы:

1. [PromQL tutorial for beginners and humans](https://valyala.medium.com/promql-tutorial-for-beginners-9ab455142085).
1. [Understanding Machine CPU usage](https://www.robustperception.io/understanding-machine-cpu-usage).
1. [Introduction to PromQL, the Prometheus query language](https://grafana.com/blog/2020/02/04/introduction-to-promql-the-prometheus-query-language/).

Создайте Dashboard и в ней создайте Panels:

- утилизация CPU для nodeexporter (в процентах, 100-idle);
- CPULA 1/5/15;
- количество свободной оперативной памяти;
- количество места на файловой системе.

Для решения этого задания приведите promql-запросы для выдачи этих метрик, а также скриншот получившейся Dashboard.

### Ответ на заданий 2

* утилизация CPU для nodeexporter (в процентах, 100-idle)
```promql
100 - (avg by (instance) (rate(node_cpu_seconds_total{mode="idle"}[5m])) * 100)
```
* CPULA 1/5/15
```promql
node_load1
node_load5
node_load15
```
* количество свободной оперативной памяти
```promql
node_memory_MemAvailable_bytes / 1024 / 1024 / 1024
```
* количество места на файловой системе
```promql
node_filesystem_avail_bytes{mountpoint="/"} / 1024 / 1024 / 1024
```

![Задание 21_2_2](https://github.com/rfedyunin/devops-netology/blob/main/21_Mon/21_2_Grafana/img/21_2_2.jpg)

## Задание 3

1. Создайте для каждой Dashboard подходящее правило alert — можно обратиться к первой лекции в блоке «Мониторинг».
1. В качестве решения задания приведите скриншот вашей итоговой Dashboard.

### Ответ на заданий 3

![Задание 21_2_3](https://github.com/rfedyunin/devops-netology/blob/main/21_Mon/21_2_Grafana/img/21_2_3.jpg)


## Задание 4

1. Сохраните ваш Dashboard.Для этого перейдите в настройки Dashboard, выберите в боковом меню «JSON MODEL». Далее скопируйте отображаемое json-содержимое в отдельный файл и сохраните его.
1. В качестве решения задания приведите листинг этого файла.


### Ответ на заданий 4

Файл с листингом JSON-содержимого дашборда.
[Файл](./dashboard.json)

---
