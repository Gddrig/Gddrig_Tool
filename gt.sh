#!/bin/bash

#version
dversion="v0.1"
vkernel=""

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

if ! figlet -v > /dev/null 2>&1
then
sudo apt-get update -y > /dev/null 2>&1
sudo apt-get install -y figlet > /dev/null 2>&1
fi

if cat /proc/version | grep 110 > /dev/null 2>&1

then
vkernel="${WORNING}${GREEN}Votre version de Kernel est à jours${NC}"
else
vkernel="${WORNING}${RED}Votre version de Kernel n'est pas à jours${NC}"

fi

clear
echo -e "${BLUE}"
figlet -f big "Gddrig Tool"
echo -e "${YELLOW}================================================================${NC}"
echo -e "${GREEN}Version: $dversion${NC}"
echo -e "${GREEN}Dernière version OS: HiveOS 5.10.0-hiveos #110${NC}"
echo -e "$vkernel"
echo -e "${YELLOW}================================================================${NC}"
echo -e "${CYAN}1  - Mise à jours${NC}"
echo -e "${CYAN}2  - Voir le mineur${NC}"
echo -e "${CYAN}3  - Voir les OC Nvidia${NC}"
echo -e "${CYAN}4  - Version du driver Nvidia${NC}"
echo -e "${CYAN}5  - Mise à jours Driver Nvidia${NC}"
echo -e "${CYAN}6  - Forcer la mémoire à 5001 (utile pour certains algos)${NC}"
echo -e "${CYAN}7  - Remettre la mémoire par défaut${NC}"
echo -e ""
echo -e "${RED}9  - * Attention * Mise à Jours Kernel${NC}"
echo -e ""
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
    run_oc
 ;;
  4)  
    clear
    sleep 1
    run_nv  
 ;;
 
 5)  
    clear
    sleep 1
    run_nu    
 ;;
  6)  
    clear
    sleep 1
    run_setmem5001     
 ;; 
  7)
    clear
    sleep 1
    run_setmem0
 ;;
   8)
    clear
    sleep 1
    
 ;;
 9)
   clear
   sleep 1
   run_kernel
   
 ;;
 
 
    esac
