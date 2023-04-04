#!/bin/bash
# Наивная реализация для примера
# Альтерантивный вариант - парсинг истории сборки по слоям - docker history my-app --no-trunc --format="table{{.CreatedBy}}"
DOCKERFILE_PATH=$1
if grep -q "npm ci" $DOCKERFILE_PATH; then
    echo "Для установки используется npm ci"
    exit 0
else
    echo "Не найдена команда npm ci в Dockerfile"
    exit 1
fi 