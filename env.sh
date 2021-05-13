# Voir la documentation du projet PowerAPI pour les précisions sur ces paramètres
# https://powerapi-ng.github.io/howto_monitor_process/deploy_sensor.html
# et https://powerapi-ng.github.io/howto_monitor_process/deploy_formula.html

# Adresse du serveur Mongodb
export ADDR=localhost

# Nom de la base de données
export DB=powerapi

# Base de données de stockage des données du capteur
export INPUT_DB=$DB

# BDD Mongodb dans laquelle la formule écrit les estimations
export OUTPUT_DB=$INPUT_DB

# Données relatives au CPU
export BASE_CPU_RATIO=27
export MIN_CPU_RATIO=4
export MAX_CPU_RATIO=35


# Temps d'attente (en secondes) entre le lancement des containers et les tests
export ATTENTE_INITIALE=60

# Temps d'attente (en secondes) entre la fin des tests et l'arrêt des containers
export ATTENTE_FINALE=60


# Nombre de requêtes à envoyer
export NB=1000
