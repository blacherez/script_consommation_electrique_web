# Collection Mongodb du capteur
export COLLECTION=sensor_wp

# Nom du capteur
export NAME=sensor_wp

# Collection Mongodb des données du capteur
export INPUT_COL=$COLLECTION

# Collection Mongodb de stockage des estimations
export OUTPUT_COL=formula_wp

# URL à utiliser pour les tests
export URL_TEST=http://localhost/powerwp/


# Fichier CSV de stockage des estimations
export FICHIER=../data_wp_selenium8.csv

echo $NAME
