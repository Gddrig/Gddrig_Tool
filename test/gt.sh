#!/bin/bash

#version
dversion="0.4"
versiontxt=""
updatetrue=""
kernel="110"
driver="525.85"
vkernel=""
vdriver=""

#color codes
RED='\033[1;31m'
YELLOW='\033[1;33m'
BLUE="\\033[38;5;27m"
SEA="\\033[38;5;49m"
GREEN='\033[1;32m'
CYAN='\033[1;36m'
NC='\033[0m'

function run_selfupgrade() {

        echo -e "${ARROW} ${CYAN}Running Selfupgrade...${NC}"
        selfupgrade
        echo -e "${ARROW} ${CYAN}Sefupgrade finish...${NC}"
        sleep 5
        ./gt.sh
}

function run_mw() {

        echo -e "${ARROW} ${CYAN}Touche échap pour quitter${NC}"
                sleep 3
                motd watch
        ./gt.sh
}

function run_rminer() {

        echo -e "${ARROW} ${CYAN}Redémarrage du mineur${NC}"
                miner restart
                echo -e "${ARROW} ${CYAN}Redémarrage éffectué${NC}"
                sleep 5
        ./gt.sh
}

function run_oc() {

        echo -e "${ARROW} ${CYAN}Running Nvtool...${NC}"
        nvtool --clocks
        echo -e "${ARROW} ${CYAN}Nvtool finish...${NC}"
                sleep 5
                ./gt.sh

}

function run_nv() {

        echo -e "${ARROW} ${CYAN}Running Nvtool...${NC}"
        nvtool --driver
        echo -e "${ARROW} ${CYAN}Nvtool finish...${NC}"
                sleep 5
                ./gt.sh

}

function run_nu() {

        echo -e "${ARROW} ${CYAN}Running Nvidia driver update...${NC}"
        nvidia-driver-update
        echo -e "${ARROW} ${CYAN}Nvidia driver update finish....${NC}"
        sleep 5
        ./gt.sh
}

function run_setmem5001() {

        echo -e "${ARROW} ${CYAN}Running Nvtool...${NC}"
        nvtool --setmem 5001
        echo -e "${ARROW} ${CYAN}Nvtool finish....${NC}"
        sleep 5
        ./gt.sh
}

function run_setmem0() {

        echo -e "${ARROW} ${CYAN}Running Nvtool...${NC}"
        nvtool --setmem 0
        echo -e "${ARROW} ${CYAN}Nvtool finish....${NC}"
        sleep 5
        ./gt.sh
}

function run_kernel() {

        hive-replace -y -s
}

clear
echo -e "${BLUE}"
figlet -f big "Gddrig Tool"
echo -e "${YELLOW}================================================================${NC}"
wget -q https://raw.githubusercontent.com/Gddrig/Gddrig_Tool/main/test/versiongt.txt
versiontxt=$(cat versiongt.txt)
#echo -e "${GREEN}$versiontxt${NC}"
updatetrue=$(echo "$versiontxt>$dversion" |bc )
#echo -e "${GREEN}$updatetrue${NC}"

if  [ $updatetrue == 1 ]
then 
echo -e "${GREEN}Votre version de Gddrig Tool est $dversion${NC}"
sleep 1
echo -e "${GREEN}La dernière version de Gddrig Tool est $versiontxt${NC}"
sleep 1
echo -e "${GREEN}Mise a jours de Gddrig Tool${NC}"
rm versiongt.txt
rm gt.sh
wget -q https://raw.githubusercontent.com/Gddrig/Gddrig_Tool/main/test/gt.sh
chmod +rwx gt.sh
sleep 1
echo -e "${GREEN}Mise a jours de Gddrig Tool effectuée !${NC}"
./gt.sh
else
rm versiongt.txt
fi

if ! figlet -v > /dev/null 2>&1
then
sudo apt-get update -y > /dev/null 2>&1
sudo apt-get install -y figlet > /dev/null 2>&1
fi

if cat /proc/version | grep $kernel > /dev/null 2>&1
then
vkernel="${WORNING}${GREEN}Votre version est à jours${NC}"
else
vkernel="${WORNING}${RED}Votre version n'est pas à jours${NC}"
fi

if cat /proc/driver/nvidia/version | grep $driver > /dev/null 2>&1
then
vdriver="${WORNING}${GREEN}Votre version est à jours${NC}"
else
vdriver="${WORNING}${RED}Votre version n'est pas à jours${NC}"
fi

clear
echo -e "${BLUE}"
figlet -f big "Gddrig Tool"
echo -e "${YELLOW}================================================================${NC}"
echo -e "${GREEN}Version: $dversion${NC}"
echo -e ""
echo -e "${GREEN}\e[4mKernel\e[0m${NC}"
echo -e "${GREEN}Dernière version : HiveOS 5.10.0-hiveos #110${NC}"
echo -e "$vkernel"
echo -e ""
echo -e "${GREEN}\e[4mDriver Nvidia\e[0m${NC}"
echo -e "${GREEN}Dernière version : 525.85.05${NC}"
echo -e "$vdriver"
echo -e ""
echo -e "${YELLOW}================================================================${NC}"
echo -e "${CYAN}1  - Mise à jours HiveOS${NC}"
echo -e "${CYAN}2  - Voir le mineur${NC}"
echo -e "${CYAN}3  - Redémarrer le mineur${NC}"
echo -e "${CYAN}4  - Voir les OC Nvidia${NC}"
echo -e "${CYAN}5  - Version du driver Nvidia${NC}"
echo -e "${CYAN}6  - Mise à jours Driver Nvidia${NC}"
echo -e "${CYAN}7  - Forcer l'oc de la mémoire à 5001 (utile pour certains algos)${NC}"
echo -e "${CYAN}8  - Remettre l'oc de la mémoire par défaut${NC}"
echo -e "${RED}9  - Mise à Jours Kernel${NC}"
echo -e "${CYAN}Enter - Exit${NC}"
echo -e "${YELLOW}================================================================${NC}"

read -rp "Pick an option and hit ENTER: "

  case "$REPLY" in
   1)  
    clear
    sleep 1
    run_selfupgrade
 ;;
 2) 
    clear
    sleep 1
    run_mw
 ;;
 3)
    clear
    sleep 1
    run_rminer
 ;;
 4)  
    clear
    sleep 1
    run_oc
 ;;
  5)  
    clear
    sleep 1
    run_nv  
 ;;
 
 6)  
    clear
    sleep 1
    run_nu    
 ;;
  7)  
    clear
    sleep 1
    run_setmem5001     
 ;; 
 8)
    clear
    sleep 1
    run_setmem0
 ;;
   
 9)
   clear
   sleep 1
   run_kernel
   
 ;;
 
 
    esac
  
      
