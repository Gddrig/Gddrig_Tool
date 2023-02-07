# Bittensor avec support CUDA

## Installation 

Testé sur ubuntu 20.04 

### Prérequis

Avoir installé la version "simple" : https://github.com/Gddrig/Gddrig_Tool/blob/main/test/bittensor.md

Super utilisateur
```sh
sudo su
```


Etre à la racine 
```sh
cd
```


### Installation de CUDA Toolkit 11.3
```sh
wget https://developer.download.nvidia.com/compute/cuda/11.3.1/local_installers/cuda_11.3.1_465.19.01_linux.run
sudo sh cuda_11.3.1_465.19.01_linux.run
```

Ajouter Cuda Toolkit a l'envirenement de l'OS
```sh
export PATH=/usr/local/cuda-11.3/bin${PATH:+:${PATH}}
export LD_LIBRARY_PATH=/usr/local/cuda-11.3/lib64\
                 ${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}
```



### Installation de Cubit
```sh
pip install https://github.com/opentensor/cubit/releases/download/v1.1.2/cubit-1.1.2-cp38-cp38-linux_x86_64.whl
```


Relancer le Miner 

Voir : https://github.com/Gddrig/Gddrig_Tool/blob/main/test/bittensor.md#minage

