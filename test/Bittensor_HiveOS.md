# Bittensor HiveOS

## Préparation

Super utilisateur
```sh
sudo su
```

Etre à la racine 
```sh
cd
```

Mise à jours Ubuntu 
```sh
apt update
apt upgrade
```

### Installation et configuration de Python 3.8

Installation
```sh
apt install python3.8 python3.8-dev
```

Configuration
```sh
update-alternatives --install /usr/bin/python python /usr/bin/python2.7 1
update-alternatives --install /usr/bin/python python /usr/bin/python3.8 2
update-alternatives --config python

update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.6 1
update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.8 2
update-alternatives --config python3
```

### Dépendences et Upgrade

Dépendences
```sh
apt install python3-testresources python3-pip cargo
```

Upgrade
```sh
pip3 install -U pip
```

## Installation de Bittensor
```sh
pip3 install bittensor --ignore-installed httplib2
```

**En cas d'erreur espace disque, taper :
Disk-expand**

## Création Wallets
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
