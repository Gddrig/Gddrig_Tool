# Bittensor HiveOS

## Prérequis

HiveOS #110 et driver Nvidia à jours

## Préparation

Mise à jours Ubuntu ( copier ligne par ligne )
```sh
sudo apt-get update && sudo apt-get upgrade -y
```

### Installation et configuration de Python 3.8

Installation
```sh
sudo apt-get install python3.8 python3.8-dev python3-testresources python3-pip cargo -y
```

Configuration ( copier ligne par ligne )
```sh
update-alternatives --install /usr/bin/python python /usr/bin/python2.7 1
update-alternatives --install /usr/bin/python python /usr/bin/python3.8 2
update-alternatives --config python

update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.6 1
update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.8 2
update-alternatives --config python3
```

Upgrade
```sh
python3 -m pip install install -U pip
```

## Installation de Bittensor
```sh
python3 -m pip install install bittensor --ignore-installed httplib2
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
