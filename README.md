# Script pour évaluer la consommation électrique d'un serveur web dans différents scénarios.

Le script principal, `cid.sh`, exécute le test individuel, `script_test.sh`, pour chacun des scénarios, décrits dans les fichiers `env...`.

## Fonctionnement
- Le script `cid.sh` commence par exécuter `env.sh` qui définit des variables d'environnement applicable à l'ensemble du test (par exemple, nom de la base de données Mongo qui sera utilisée pour stocker les données de PowerAPI, nombre de requêtes envoyées au serveur, temps d'attente en début et en fin de test etc.). Le rôle de chacune des ces variables d'environnement est indiqué en commentaire dans le fichier `env.sh`.

- Les cgroups sont alors créés et peuplés dynamiquement avec les identifiants de processus d'Apache et de MySQL. Il n'y a pas d'inconvénient à répéter ces étapes plusieurs fois.

- Ensuite, pour chaque scénario défini, le fichier d'environnement `env_NOM_DU_SCENARIO.sh` est exécuté. Il initialise des variables d'environnement spécifiques à ce scénario (par exemple, nom de la collection Mongodb à utiliser, url cible pour le scénario, nom du fichier CSV à créer pour stocker les données etc.).

- Le test en lui-même peut alors être exécuté (`script_test.sh`).

**NB : dans son état actuel, ce script est prévu pour être lancé sur une seule machine, qui exécute à la fois le client et le serveur. Il est néanmoins facile de l'adapter en séparant les parties "client" et "serveur".**

## Prérequis

- Les prérequis de PowerAPI (voir http://www.powerapi.org/)

- Le script de test utilise un petit programme en Python (3.x) qui a recours à la bibliothèque `Selenium` (https://www.selenium.dev/) pour manipuler un navigateur, qui lui aussi doit être installé sur la machine. Le code ici déposé appelle le navigateur Firefox mais peut facilement être modifié pour fonctionner avec un autre navigateur (voir pour cela [la documentation de `Selenium`](https://www.selenium.dev/documentation/en/)).

Pour installer `Selenium` :

```bash
$ pip install selenium
```

## Comment utiliser ces scripts ?

- Modifier les valeurs dans les scripts `env.sh` et les `env_XXX.sh`. Le rôle de chaque variable d'environnement est précisé en commentaire.

- Si vous souhaitez ajouter un ou plusieurs autres scénarios, créez un fichier `env_NOM_DU_SCENARIO.sh` pour chacun (vous pouvez copier le contenu d'un des fichiers existants comme modèle avant de l'adapter). Ajoutez ensuite une section dans `cid.sh` :

```bash
. ./env_NOM_DU_SCENARIO.sh
sh script_test.sh
```

(Attention de ne pas oublier le point en début de première ligne.)

- Activez la suppression des collections au début du script `script_test.sh` en enlevant les `#` au début des deux lignes :

```bash
#mongo --host $ADDR --eval "db.$COLLECTION.drop()" $DB
#mongo --host $ADDR --eval "db.$OUTPUT_COL.drop()" $OUTPUT_DB
```

**Ces lignes sont mises en commentaire par défaut pour éviter toute suppression accidentelle de données, mais la suite du script (en particulier l'export CSV) suppose que les collections ne contiennent pas d'autres données que celles du test en cours.**

- Lancer le test en exécutant `cid.sh` :

```bash
$ sh cid.sh
```
- Les résultats des tests seront enregistrés dans des fichiers CSV (dont les noms sont définis dans le fichier de chaque scénario).
