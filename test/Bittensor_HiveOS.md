# Bittensor HiveOS

## Prérequis

### HiveOS #110 et driver Nvidia à jours

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

## Préparation

De base avec HiveOs, l'utilisateur principal est "root" ( un super administrateur ), hors Bittensor utilise comme language le Python et il est incompatible avec le "root", nous allons devoir créer un nouvel utilisateur avec les droits administrateurs, que je nommerais $pseudo dans mes commmandes et donc qui sera a remplacer par votre propre pseudo.

### Création et paramétrage du nouvel utilisateur 

Ajout utilisateur 
```sh
adduser $pseudo
```
*Exemple : adduser gdddrig*

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

Configuration ( copier ligne par ligne )
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

Pour que l'installation de Bittensor ce déroule sans problème, nous devons d'abord d'éclarer le chemin ($PATH) où va etre installé Bittensor, puis mettre a jour pip ( le gestionnaire de paquets Python ).

Déclaration du $PATH
```sh
export PATH="/home/gddrig/.local/bin:$PATH"
```

Upgrade pip
```sh
python3 -m pip install -U pip
```
```sh
python3 -m pip install bittensor
```

**En cas d'erreur espace disque, taper : disk-expand**

## Création Wallets ( copier ligne par ligne )
```sh
btcli new_coldkey
btcli new_hotkey
```
**Pensez a bien sauvegarder vos mnémoniques !**

**Dans les lignes de commandes ci-dessous vous pouvez rajouter --wallet.name MonNomdeWallet --wallet.hotkey MonNomdeHotWallet
Exemple : --wallet.name GddrigC --wallet.hotkey GddrigH**


## Test de l'enregistrement sur le réseau Nobunaga
```sh
btcli register --subtensor.network nobunaga
```


## Enregistrement sur le réseau Principal ( Nagamoto )
```sh
btcli register --subtensor.network nagamoto --subtensor.chain_endpoint wss://archivelb.nakamoto.opentensor.ai:9943
```


## Minage
```sh
btcli run --subtensor.network nagamoto --subtensor.chain_endpoint wss://archivelb.nakamoto.opentensor.ai:9943
```

## Installation de Cubit ( Support CUDA )
```sh
pip install https://github.com/opentensor/cubit/releases/download/v1.1.2/cubit-1.1.2-cp38-cp38-linux_x86_64.whl
```

### Optimisation 

Rajouter les arguments :
```sh
--cuda.TPB 512 --cuda.update_interval 70_000
```
**Exemple : btcli register --subtensor.network nagamoto --subtensor.chain_endpoint wss://archivelb.nakamoto.opentensor.ai:9943 --cuda.TPB 512 --cuda.update_interval 70_000**

### Mise à jours torch
```sh
pip install torch==1.12.1+cu116 torchvision==0.13.1+cu116 torchaudio==0.12.1 --extra-index-url https://download.pytorch.org/whl/cu116
```

### Mise à jours torch 2.0
```sh
pip3 install numpy --pre torch --force-reinstall --index-url https://download.pytorch.org/whl/nightly/cu117
```
