#!/bin/bash
EXPECTED_WORKDIR=$1
ACTUAL_WORKDIR=`docker image inspect --format='{{.Config.WorkingDir}}' $2`

if [ "$EXPECTED_WORKDIR" = "$ACTUAL_WORKDIR" ]
then
    echo "Отличная работа. Рабочая директория $ACTUAL_WORKDIR совпадает с требуемой - $EXPECTED_WORKDIR"
    exit 0
else
    echo "К сожалению, рабочая директория $ACTUAL_WORKDIR не совпадает с требуемой - $EXPECTED_WORKDIR"
    exit 1
fi