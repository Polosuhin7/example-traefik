#  Развертывание приложений с traefik v3
Что нужно сделать:
* chmod 600 config/acme.json
* docker-compose.yaml: изменить 'foobar.example.invalid' на настоящий хост
* example-app/docker-compose.yaml: изменить 'foobar.example.invalid' на настоящий хост
* docker-compose.yaml: изменить пароль!! (см коммент)
* config/traefik.yaml: изменить email
* Создать  docker network 'traefik-servicenet' (`docker network create traefik-servicenet`)

# Установка docker и docker-compose в Ubuntu 22
Запускаем скрипт 
```sh
sudo chmod +x ./docker-installer.sh && sh ./docker-installer.sh
```

# Запуск докер контейнера
1. Добавляем службу при старте ```sudo systemctl enable docker```
2. Указываем свойство ```restart: always```в docker-compose.yml 
3. Старт ```docker compose up -d```