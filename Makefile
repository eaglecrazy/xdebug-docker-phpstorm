DEFAULT_GOAL := help

help:
	@awk 'BEGIN {FS = ":.*##"; printf "\nUsage:\n  make \033[36m<target>\033[0m\n"} /^[a-zA-Z0-9_-]+:.*?##/ { printf "  \033[36m%-27s\033[0m %s\n", $$1, $$2 } /^##@/ { printf "\n\033[1m%s\033[0m\n", substr($$0, 5) } ' $(MAKEFILE_LIST)

##@ [Docker] Build / Infrastructure

.PHONY: init
init: docker-down-clear docker-pull docker-build docker-up  ## остановка, удаление контейнеров и запуск докера

.PHONY: up
up: docker-up ## запускает docker-up

.PHONY: down
down: docker-down  ## запускает docker-down

.PHONY: restart
restart: docker-down docker-up  ## запускает docker-down docker-up

.PHONY: docker-up
docker-up:  ## запускает docker-compose
	docker-compose up -d

.PHONY: docker-down
docker-down:  ## останавливает docker-compose
	docker-compose down --remove-orphans

.PHONY: docker-down-clear
docker-down-clear:  ## останавливает docker-compose c удалением томов
	docker-compose down -v --remove-orphans

.PHONY: docker-pull
docker-pull:  ## скачивает нужные образы
	docker-compose pull

.PHONY: docker-build
docker-build:  ## создаёт образы
	docker-compose build

.PHONY: connect
connect:  ## открыть консоль контейнера php
	docker exec -i -t xdebug-docker-phpstorm_php_1 bash

