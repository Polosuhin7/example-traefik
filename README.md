# Настройка VPS
Используемые приложение:
* traefik
* portainer
* docker-registry

## Установка зависимостей (docker, ) в Ubuntu 22
Запускаем скрипт 
```sh
sudo chmod +x ./installer.sh && sh ./installer.sh
```

##   Настройка traefik
Что нужно сделать:
<!-- * Создать  docker network 'traefik-servicenet' (`docker network create traefik-servicenet`) -->
<!-- * chmod 600 config/acme.json -->
* docker-compose.yml: изменить 'foobar.example.invalid' на настоящий хост
* docker-compose.yml: изменить пароль!! (см коммент)
* config/traefik.yml: изменить email
* config/dynamic.yaml: добавь пользователя

## Добавление прокси для docker hub
1. ```echo "{ "registry-mirrors" : [ "https:\/\/huecker.io" ] }" > /etc/docker/daemon.json```
2. ```sudo systemctl restart docker```


## Запуск
1. Старт ```docker compose up -d```

## Добавление приложений
Что бы traefik увидел новое приложение нужно добавить секцию label в docker-compose.yml(см. пример в ./wp-example-docker-compose.yml)
Добавлять приложение можно через portainer в разделе stacks