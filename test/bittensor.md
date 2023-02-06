# Bittensor ( Version simple ET uniquement CPU ) 

## Installation 

Testé sur ubuntu 20.04 

### Prérequis

Super utilisateur
```sh
Sudo su
```

Mise à jours Ubuntu 
```sh
apt update
apt upgrade
cd
apt install python3-testresources
apt install python3-pip
```

Installation de Bittensor
```sh
pip3 install bittensor
```

## Création Wallets
```sh
btcli new_coldkey
btcli new_hotkey
```

## Enregistrement sur le réseau
```sh
btcli register --subtensor.network nagamoto --subtensor.chain_endpoint wss://archivelb.nakamoto.opentensor.ai:9943
```

## Minage
```sh
btcli run --subtensor.network nagamoto --subtensor.chain_endpoint wss://archivelb.nakamoto.opentensor.ai:9943
```
