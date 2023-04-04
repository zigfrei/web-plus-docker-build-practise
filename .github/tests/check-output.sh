ACTUAL_OUTPUT=`docker run $1`
EXPECTED_OUTPUT="$2"

if [ "$EXPECTED_OUTPUT" = "$ACTUAL_OUTPUT" ]
then
    echo "Отличная работа.Вывод контейнера $ACTUAL_OUTPUT совпадает с требуемым - $EXPECTED_OUTPUT"
    exit 0
else
    echo "К сожалению, рабочая директория $ACTUAL_OUTPUT не совпадает с требуемым - $EXPECTED_OUTPUT"
    exit 1
fi