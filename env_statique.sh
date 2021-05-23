# Collection Mongodb du capteur
export COLLECTION=sensor_statique

# Nom du capteur
export NAME=sensor_statique

# Collection Mongodb des données du capteur
export INPUT_COL=$COLLECTION

# Collection Mongodb de stockage des estimations
export OUTPUT_COL=formula_statique

# URL à utiliser pour les tests
export URL_TEST=http://localhost/statique/page_statique.html


# Fichier CSV de stockage des estimations
export FICHIER=../data_statique_selenium8.csv

echo $NAME
