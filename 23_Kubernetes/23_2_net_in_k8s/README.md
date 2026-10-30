# Домашнее задание к занятию «Сетевое взаимодействие в Kubernetes» - Федюнин Р.Ю.


## **Задание 1: Настройка Service (ClusterIP и NodePort)**
### **Задача**
Развернуть приложение из двух контейнеров (`nginx` и `multitool`) и обеспечить доступ к ним:
- Внутри кластера через **ClusterIP**.
- Снаружи через **NodePort**.

### **Шаги выполнения**
1. **Создать Deployment** с двумя контейнерами:
   - `nginx` (порт `80`).
   - `multitool` (порт `8080`).
   - Количество реплик: `3`.
2. **Создать Service типа ClusterIP**, который:
   - Открывает `nginx` на порту `9001`.
   - Открывает `multitool` на порту `9002`.
3. **Проверить доступность** изнутри кластера:
```bash
 kubectl run test-pod --image=wbitt/network-multitool --rm -it -- sh
 curl <service-name>:9001 # Проверить nginx
 curl <service-name>:9002 # Проверить multitool
```
4. **Создать Service типа NodePort** для доступа к `nginx` снаружи.
5. **Проверить доступ** с локального компьютера:
```bash
 curl <node-ip>:<node-port>
   ```
 или через браузер.

### **Что сдать на проверку**
- Манифесты:
  - `deployment-multi-container.yaml`
  - `service-clusterip.yaml`
  - `service-nodeport.yaml`
- Скриншоты проверки доступа (`curl` или браузер).


### Ответ

![img_1](https://github.com/rfedyunin/devops-netology/blob/main/23_Kubernetes/23_2_net_in_k8s/img/Screenshot_23_2_1.jpg)

![img_2](https://github.com/rfedyunin/devops-netology/blob/main/23_Kubernetes/23_2_net_in_k8s/img/Screenshot_23_2_2.jpg)

Ссылка на манифест: [deployment-multi-container](./files/deployment-multi-container.yaml)

Ссылка на манифест: [service-clusterip](./files/service-clusterip.yaml)

Ссылка на манифест: [service-nodeport](./files/service-nodeport.yaml)



---
## **Задание 2: Настройка Ingress**
### **Задача**
Развернуть два приложения (`frontend` и `backend`) и обеспечить доступ к ним через **Ingress** по разным путям.

### **Шаги выполнения**
1. **Развернуть два Deployment**:
   - `frontend` (образ `nginx`).
   - `backend` (образ `wbitt/network-multitool`).
2. **Создать Service** для каждого приложения.
3. **Включить Ingress-контроллер**:
```bash
 microk8s enable ingress
   ```
4. **Создать Ingress**, который:
   - Открывает `frontend` по пути `/`.
   - Открывает `backend` по пути `/api`.
5. **Проверить доступность**:
```bash
 curl <host>/
 curl <host>/api
   ```
 или через браузер.

### Ответ

![img_3](https://github.com/rfedyunin/devops-netology/blob/main/23_Kubernetes/23_2_net_in_k8s/img/Screenshot_23_2_3.jpg)

Ссылка на манифест: [deployment-backend](./files/deployment-backend.yaml)

Ссылка на манифест: [deployment-frontend](./files/deployment-frontend.yaml)

Ссылка на манифест: [ingress](./files/ingress.yaml)

Ссылка на манифест: [service-backend](./files/service-backend.yaml)

Ссылка на манифест: [service-frontend](./files/service-frontend.yaml)
