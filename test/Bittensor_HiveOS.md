# Bittensor HiveOS

## Prérequis

### HiveOS #110, drivers Nvidia à jours et espace disque suffisant

**Rappel des commandes :**

Mise à jours/Réinstallation du Kernel de Hiveos :
```sh
hive-replace -y -s
```
Mise à jours de Hiveos :
```sh
selfupgrade
```
Mise à jours des drivers Nvidia :
```sh
nvidia-driver-update
```
Etendre au maximum l'espace disque aloué par HiveOS :
```sh
disk-expand
```

## Préparation

De base avec HiveOs, l'utilisateur principal est "root" ( un super administrateur ), hors Bittensor utilise comme language le Python et il est incompatible avec le "root", nous allons devoir créer un nouvel utilisateur avec les droits administrateurs, que je nommerais $pseudo dans mes commmandes et donc qui sera a remplacer par votre propre pseudo.

### Création et paramétrage du nouvel utilisateur 

Ajout utilisateur 
```sh
adduser $pseudo
```
*Exemple : adduser gddrig*

Donner les droit d'administrations
```sh
usermod -aG sudo $pseudo
```
*Exemple : usermod -aG sudo gddrig*

sélectionner le nouvel utilisateur
```sh
su $pseudo
```
*Exemple : su gddrig*

Vous devriez alors avoir quelque chose comme *gddrig@MonRig:/home/user$*, hors pour faire propre nous voulons travailler à la racine, donc :
```sh
cd
```
Et maintenant vous devriez avoir : *gddrig@MonRig:~$*

### Mise à jours Ubuntu
```sh
sudo apt-get update && sudo apt-get upgrade -y
```

### Installation et configuration de Python 3.8

De base avec HiveOs, Python est préinstallé en version 2.7 pour Python et 3.6 pour Python3, celui que l'on veux est Python3 mais en version 3.8, donc nous allons l'installer et dire a HiveOS que l'on veux utiliser la version 3.8 à la place de la version 3.6. 

Installation
```sh
sudo apt-get install python3.8 python3.8-dev python3-testresources python3-pip cargo -y
```

Configuration
```sh
sudo update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.6 1
```
```sh
sudo update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.8 2
```
```sh
sudo update-alternatives --config python3
```
*Prenez le choix 0*

## Installation de Bittensor

Pour que l'installation de Bittensor ce déroule sans problème, nous devons d'abord d'éclarer le chemin ($PATH) où va etre installé Bittensor, puis mettre à jour pip ( le gestionnaire de paquets Python ).

Déclaration du $PATH
```sh
export PATH="/home/$pseudo/.local/bin:$PATH"
```

*ATTENTION !!! Pensez a remplacer $pseudo ! Exemple :  export PATH="/home/gddrig/.local/bin:$PATH"*

Upgrade pip
```sh
python3 -m pip install -U pip
```

Installation de Bittensor
```sh
python3 -m pip install bittensor
```

## Création Wallets ( copier ligne par ligne )

Donnez un nom de wallet et un mot de passe
```sh
btcli new_coldkey
```
*ATTENTION !! Ici il va d'abord vous demander votre adresse de coldwallet PUIS APRES de votre hotwallet*
```sh
btcli new_hotkey
```
**Pensez a bien sauvegarder vos mnémoniques !**

**Dans les lignes de commandes ci-dessous vous pouvez rajouter --wallet.name MonNomdeWallet --wallet.hotkey MonNomdeHotWallet
Exemple : --wallet.name GddrigC --wallet.hotkey GddrigH**


## Test de l'enregistrement sur le réseau Nobunaga

On va enregistrer notre wallet sur le réseau de test pour voir si tout fonctionne bien. Cela doit prendre quelque minutes.

S'il vous demande d'utiliser le CUDA, répondez non.
```sh
btcli register --subtensor.network nobunaga

```
## Installation de Cubit ( Support CUDA )
```sh
python3 -m pip install https://github.com/opentensor/cubit/releases/download/v1.1.2/cubit-1.1.2-cp38-cp38-linux_x86_64.whl
```

## Mise à jours torch 2.0 ( necessaire pour les RTX3000 et plus )
```sh
python3 -m pip install numpy --pre torch --force-reinstall --index-url https://download.pytorch.org/whl/nightly/cu117
```

## Enregistrement sur le réseau Principal ( Nagamoto )

Là, nous allons enfin lancer le vraie enregistrement sur le réseau principal !

```sh
btcli register --cuda --subtensor.network nagamoto --subtensor.chain_endpoint wss://archivelb.nakamoto.opentensor.ai:9943 --cuda.TPB 512 --cuda.update_interval 70_000
```

*Exemple de commande complète : btcli register --cuda --subtensor.network nagamoto --subtensor.chain_endpoint wss://archivelb.nakamoto.opentensor.ai:9943 --cuda.TPB 512 --cuda.update_interval 70_000 --wallet.name GddrigC --wallet.hotkey GddrigH*

## Minage
```sh
btcli run --subtensor.network nagamoto --subtensor.chain_endpoint wss://archivelb.nakamoto.opentensor.ai:9943 --cuda.TPB 512 --cuda.update_interval 70_000
```

*Exemple de commande complète : btcli run --cuda --subtensor.network nagamoto --subtensor.chain_endpoint wss://archivelb.nakamoto.opentensor.ai:9943 --cuda.TPB 512 --cuda.update_interval 70_000 --wallet.name GddrigC --wallet.hotkey GddrigH*

# Linux Screen

Screen sert a creer une console virtuel qui ne se fermera pas si on ferme la fenetre de la console à distance.

Exemple simple, lorsque vous miner avec HiveOS, votre minage est en cours dans un screen, si vous taper miner vous vous retrouvez dans le screen de votre minage !

## Voir la liste des screens
```sh
screen -ls

## Creer un nouveau screen pour Bittensor
```sh
screen -S NomDuScreen
```
*Exemple : screen -S tensor

## Arreter Bittensor

Touche Ctrl+c  puis Ctrl+d, vous devriez voir [screen is terminating]






