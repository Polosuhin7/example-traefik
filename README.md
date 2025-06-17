# Настройка VPS
Используемые приложение:
* traefik
* portainer

## Установка зависимостей (docker) в Ubuntu 22
Запускаем скрипт
```sh
sudo chmod +x ./installer.sh && bash ./installer.sh
sudo chmod +x ./init.sh && bash ./init.sh
```


## Добавление прокси для docker hub (опционально)
1. ```echo "{ "registry-mirrors" : [ "https:\/\/huecker.io" ] }" > /etc/docker/daemon.json```
2. ```sudo systemctl restart docker```


## Запуск
1. Старт ```docker compose up -d```

## Добавление приложений
Что бы traefik увидел новое приложение нужно добавить секцию labels в docker-compose.yml(см. пример в ./docker-compose.example.yml)
Добавлять приложение можно через portainer в разделе stacks
