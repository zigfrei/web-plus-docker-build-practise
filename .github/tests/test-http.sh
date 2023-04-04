#!/bin/bash
URL=$1
EXPECTED_RESPONSE=$2

ACTUAL_RESPONSE=`curl -s $URL`

if [ "$EXPECTED_RESPONSE" = "$ACTUAL_RESPONSE" ]
then
    echo "Отличная работа. Сервер работает корректно! "
    exit 0
else
    echo "К сожалению, ответ сервера $ACTUAL_RESPONSE не совпадает с требуемым - $EXPECTED_RESPONSE"
    exit 1
fi