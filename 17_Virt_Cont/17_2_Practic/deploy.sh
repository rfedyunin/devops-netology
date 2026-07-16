#!/bin/bash

REPO_URL="https://github.com/rfedyunin/shvirtd-example-python.git"
DEPLOY_DIR="/opt/shvirtd-example-python"


echo "Клонирование репозитория в /opt..."
sudo rm -rf $DEPLOY_DIR
sudo git clone $REPO_URL $DEPLOY_DIR

cd $DEPLOY_DIR

echo "Запуск Docker Compose..."
sudo docker compose up -d

echo "Проект запущен."