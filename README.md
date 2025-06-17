# Настройка VPS

Используемые приложение:

- traefik
- portainer

## Установка зависимостей (docker) в Ubuntu 22

Запускаем скрипт

```sh
sudo chmod +x ./installer.sh && bash ./installer.sh
sudo chmod +x ./init.sh && bash ./init.sh
```

## Добавление прокси для docker hub (опционально)

1. `echo "{ "registry-mirrors" : [ "https:\/\/huecker.io" ] }" > /etc/docker/daemon.json`
2. `sudo systemctl restart docker`

## Запуск

1. Старт `docker compose up -d`

## Добавление приложений

Что бы traefik увидел новое приложение нужно добавить секцию labels в docker-compose.yml(см. пример в ./docker-compose.example.yml)
Добавлять приложение можно через portainer в разделе stacks

## Переменные окружения

После деплоя приложения добавь переменые окружения через UI Portainer

## 🧪 Добавь GitHub Secrets

В репозитории перейди:
`Settings → Secrets → Actions → New repository secret`

| Название          | Значение                                   |
| ----------------- | ------------------------------------------ |
| `SERVER_HOST`     | IP VPS                                     |
| `SERVER_SSH_USER` | SSH-пользователь (`root`, `ubuntu` и т.д.) |
| `SERVER_SSH_KEY`  | Приватный SSH-ключ (весь, с BEGIN/END)     |

## 🔐 Генерация SSH-ключа

На VPS:

```bash
ssh-keygen -t rsa -b 4096 -C "github-deploy" -f ~/.ssh/github_deploy_key
```

Добавь ключ в `authorized_keys`:

```bash
cat ~/.ssh/github_deploy_key.pub >> ~/.ssh/authorized_keys
chmod 600 ~/.ssh/authorized_keys
```

Скопируй приватный ключ:

```bash
cat ~/.ssh/github_deploy_key
```

---

## GitHub Workflow

Шаблоны ci/cd в паке github-template. Можешь добавить кнопку запуска деплоя в readme.md в корне своего проекта

```md
[![Deploy](https://img.shields.io/badge/🚀_Deploy_to_VPS-blue?style=for-the-badge)](../../actions/workflows/cd.yml)
```
