# Bittensor ( Version simple ET uniquement CPU ) 

- [Installation](#installation)
- [Prérequis](#prérequis)
- [Création Wallets](#création-wallets)
- [Test de l'enregistrement sur le réseau Nobunaga](#test-de-lenregistrement-sur-le-réseau-nobunaga)
- [Enregistrement sur le réseau Principal ( Nagamoto )](#enregistrement-sur-le-réseau-principal--nagamoto-)
- [Minage](#minage)
- [Anydesk sur Ubuntu](#anydesk-sur-ubuntu)

## Installation 

Testé sur ubuntu 20.04 

### Prérequis

Super utilisateur
```sh
sudo su
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
**Pensez a bien sauvegarder vos mnémoniques !**

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

## Erreur PYTHONIOENCODING=utf-8
```sh
export PYTHONIOENCODING=utf-8
```

# Autre

## Anydesk sur Ubuntu
```sh
wget -qO - https://keys.anydesk.com/repos/DEB-GPG-KEY | apt-key add -
echo "deb http://deb.anydesk.com/ all main" > /etc/apt/sources.list.d/anydesk-stable.list
apt update
apt install anydesk
```
