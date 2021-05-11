# Collection Mongodb du capteur
export COLLECTION=sensor_grav

# Nom du capteur
export NAME=sensor_grav

# Collection Mongodb des données du capteur
export INPUT_COL=$COLLECTION

# Collection Mongodb de stockage des estimations
export OUTPUT_COL=formula_grav

# URL à utiliser pour les tests
export URL_TEST=http://localhost/grav/


# Fichier CSV de stockage des estimations
export FICHIER=../data_grav.csv

echo $NAME
