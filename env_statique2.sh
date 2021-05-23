# Collection Mongodb du capteur
export COLLECTION=sensor_statique2

# Nom du capteur
export NAME=sensor_statique2

# Collection Mongodb des données du capteur
export INPUT_COL=$COLLECTION

# Collection Mongodb de stockage des estimations
export OUTPUT_COL=formula_statique2

# URL à utiliser pour les tests
export URL_TEST=http://localhost/statique/grav.html


# Fichier CSV de stockage des estimations
export FICHIER=../data_statique2_selenium8.csv

echo $NAME
