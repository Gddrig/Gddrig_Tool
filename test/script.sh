#!/bin/bash

#version
dversion="0.1"

#color codes
RED='\033[1;31m'
YELLOW='\033[1;33m'
BLUE="\\033[38;5;27m"
SEA="\\033[38;5;49m"
GREEN='\033[1;32m'
CYAN='\033[1;36m'
NC='\033[0m'

function start_script() {

		#·TCC
		echo -e "${GREEN}Minage Taichicoin ${NC}"
        nvtool --setclocks 1200 --setmem 5000 & /hive/miners/wildrig-multi/0.36.6/wildrig-multi --algo=ghostrider --url aidepremium.ddns.net:3056 --user TdaZ1bcksSFyK5uY44njUyZY9kETq4TqwE.Gddrig --pass x & pid=$!
        echo -e "pid = $pid"
		sleep 60
		kill $pid
		#pkill /hive/miners/wildrig-multi/0.36.6/wildrig-multi
		#BTSC
		echo -e "${GREEN}Minage Bitfishcoin ${NC}"
		nvtool --setclocks 1200 --setmem 5000 & /hive/miners/wildrig-multi/0.36.6/wildrig-multi --algo=ghostrider --url aidepremium.ddns.net:3053 --user BbZ17LWBHZTmWEnQgQ3JaKzRsuyj1NyjMd.Gddrig --pass x & pid2=$!
        echo -e "pid = $pid"
		sleep 60
		kill $pid2
		#pkill /hive/miners/wildrig-multi/0.36.6/wildrig-multi
		#LTRM
		echo -e "${GREEN}Minage Litpreum ${NC}"
		nvtool --setclocks 1200 --setmem 5000 & /hive/miners/wildrig-multi/0.36.6/wildrig-multi --algo=ghostrider --url aidepremium.ddns.net:3054 --user LVpxKRTjRZKeM6WDkhtNASnZimhMHqNu5M.Gddrig --pass x & pid3=$!
        echo -e "pid = $pid"
		sleep 60
		kill $pid3
		#pkill /hive/miners/wildrig-multi/0.36.6/wildrig-multi
       
}


if ! figlet -v > /dev/null 2>&1
then
sudo apt-get update -y > /dev/null 2>&1
sudo apt-get install -y figlet > /dev/null 2>&1
fi

echo -e "${BLUE}"
figlet -f big "Gddrig Sript"
echo -e "${YELLOW}================================================================${NC}"
echo -e "${GREEN}Version: $dversion ${NC}"
echo -e ""
echo -e "${GREEN}Démarrage du script : ${NC}"

start_script
