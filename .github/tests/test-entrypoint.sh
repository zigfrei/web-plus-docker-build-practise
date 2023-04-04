#!/bin/bash
EXPECTED_ENTRYPOINT=$1
ACTUAL_ENTRYPOINT=`docker image inspect --format='{{.Config.Entrypoint}}' "$2"`

if [ "$EXPECTED_ENTRYPOINT" = "$ACTUAL_ENTRYPOINT" ]
then
    echo "Отличная работа. Команда запуска $ACTUAL_ENTRYPOINT совпадает с требуемой - $EXPECTED_ENTRYPOINT"
    exit 0
else
    echo "К сожалению, команда запуска $ACTUAL_ENTRYPOINT не совпадает с требуемой - $EXPECTED_ENTRYPOINT"
    exit 1
fi