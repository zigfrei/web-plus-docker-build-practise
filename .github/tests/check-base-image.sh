#!/bin/bash
EXPECTED_IMAGE=$1
ACTUAL_IMAGE=$2

EXPECTED_IMAGE_LAYERS=`docker image inspect -f "{{ len .RootFS.Layers }}" "$EXPECTED_IMAGE"`
ACTUAL_IMAGE_LAYERS=`docker image inspect -f "{{ len .RootFS.Layers }}" "$ACTUAL_IMAGE"`
EXPECTED_SHA=`docker image inspect -f "{{ index .RootFS.Layers $[$EXPECTED_IMAGE_LAYERS-1]}}" "$EXPECTED_IMAGE"`
ACTUAL_SHA=`docker image inspect -f "{{ index .RootFS.Layers $[$ACTUAL_IMAGE_LAYERS-1]}}" "$ACTUAL_IMAGE"`


if [ "$EXPECTED_SHA" = "$ACTUAL_SHA" ]
then
    echo "Отличная работа. Хэши последних слоев вашего и базового образов совпали - значит вы все сделали правильно"
    exit 0
else
    echo "К сожалению, хэш образа $EXPECTED_IMAGE - $EXPECTED_SHA, а вашего ($ACTUAL_IMAGE) - $ACTUAL_SHA. Т.к они не совпадают вы где-то ошиблись"
    exit 1
fi