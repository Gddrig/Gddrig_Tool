#!/bin/bash

log() {
  echo "$(date '+%Y-%m-%d %H:%M:%S') - $1" >> /home/user/gpu.log
}

sleep 60
Possible de Supprimer
Demarrage du Rig et Frequance init
log "Démarrage du Rig"
nvtool -i 0 --setclocks 1720
log "nvtool init GPU 0 ok "
nvtool -i 1 --setclocks 1720
log "nvtool init GPU 1 ok "
nvtool -i 2 --setclocks 1700
log "nvtool init GPU 2 ok "
nvtool -i 3 --setclocks 900
log "nvtool init GPU 3 ok "
nvtool -i 4 --setclocks 1700
log "nvtool init GPU 4 ok "
nvtool -i 5 --setclocks 1300
log "nvtool init GPU 5 ok "
nvtool -i 6 --setclocks 1700
log "nvtool init GPU 6 ok "

Attente apres demarrage
sleep 60

log "Démarrage du script"


Déterminer le nombre de GPU connectés
gpu_count=$(nvidia-smi --list-gpus | wc -l)

Boucle sur chaque carte graphique
for i in $(seq 0 $(($gpu_count - 1))); do
  # Récupérer la température du GPU
  temp=$(nvidia-smi --query-gpu=temperature.gpu --format=csv,noheader,nounits --id=$i)
  # Récupérer la fréquence du core
  freq=$(nvidia-smi --query-gpu=clocks.current.graphics --format=csv,noheader,nounits --id=$i)

  # Si la température est supérieure à 66 degrés
  if [ $temp -gt 65 ]; then
    # Réduire la fréquence du core de 100Mhz
    nvtool -i $i --setclocks $((freq-100))
    log "Modification sur le GPU $i - Temp $temp - Freq $((freq-100))"
    sleep 300

  # Sinon
  else
    # Si la température est inférieure à 57 degrés et que la fréquence du core est inférieure à 1600
    if [ $temp -lt 58 ] && [ $freq -lt 1600 ]; then
      # Augmenter la fréquence du core de 100 Mhz, sans jamais dépasser 1700
      nvtool -i $i --setclocks $((freq+100))
      log "Modification sur le GPU $i - Temp $temp - Freq $((freq+100))"
     sleep 300
    fi
  fi
done
