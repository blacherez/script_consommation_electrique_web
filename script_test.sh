echo $NAME

echo Lancement des containers
SENSOR_ID=`docker run --net=host --privileged --name powerapi-sensor -d -v /sys:/sys -v /var/lib/docker/containers:/var/lib/docker/containers:ro -v /tmp/powerapi-sensor-reporting:/reporting powerapi/hwpc-sensor:latest -n "$NAME" -r "mongodb" -U "mongodb://localhost" -D "powerapi" -C "$COLL_SENSOR" -s "rapl" -o -e "RAPL_ENERGY_PKG" -s "msr" -e "TSC" -e "APERF" -e "MPERF" -c "core" -e "CPU_CLK_THREAD_UNHALTED:REF_P" -e "CPU_CLK_THREAD_UNHALTED:THREAD_P" -e "LLC_MISSES" -e "INSTRUCTIONS_RETIRED"`
echo $SENSOR_ID
FORMULA_ID=`docker run -td --net=host --name powerapi-formula powerapi/smartwatts-formula -s --input mongodb --model HWPCReport -u mongodb://localhost -d powerapi -c $COLL_SENSOR --output mongodb --name power --model PowerReport -u mongodb://localhost -d powerapi -c $COLL_FORMULA --output mongodb --name formula --model FormulaReport -u mongodb://localhost -d powerapi -c frep --formula smartwatts --cpu-ratio-base 27 --cpu-ratio-min 4 --cpu-ratio-max 35 --cpu-error-threshold 2.0 --dram-error-threshold 2.0 --disable-dram-formula`
echo $FORMULA_ID


echo Attente
sleep 60
echo Test
ab -n $NB $URL_TEST

echo Attente
sleep 60

echo Arrêt et suppression des containers
docker stop $SENSOR_ID $FORMULA_ID
docker rm $SENSOR_ID $FORMULA_ID

echo Sauvegarde des données
mongoexport --db=powerapi --collection=$COLL_FORMULA --type=csv --fields=timestamp,power,target --out="$FICHIER"
