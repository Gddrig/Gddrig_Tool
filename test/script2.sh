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

function start_script1() {

		#·TCC
		echo -e "${GREEN}Minage Taichicoin ${NC}"
		nvtool --setclocks 1200 --setmem 5000 & /hive/miners/wildrig-multi/0.36.6/wildrig-multi --algo=ghostrider --url aidepremium.ddns.net:3056 --user TrVoa4io2JUjb6Mer36KTnuoFK18mnXKMt.Gddrig --pass x & pid1=$!
        echo -e "pid = $pid1"
		sleep 600
		#kill -9 $pid1
		kill -9 $(pgrep wildrig-multi)
		echo -e "${RED}Minage Taichicoin terminé !${NC}"
		sleep 5
		}
		
function start_script2() {
		#BTSC
		echo -e "${GREEN}Minage Bitfishcoin ${NC}"
		nvtool --setclocks 1200 --setmem 5000 & /hive/miners/wildrig-multi/0.36.6/wildrig-multi --algo=ghostrider --url aidepremium.ddns.net:3053 --user BcdBtfBbh2uWJtMZ2jmTfovxCpm9WUBnUn.Gddrig --pass x & pid2=$!
        echo -e "pid = $pid2"
		sleep 600
		#kill -9 $pid2
		kill -9 $(pgrep wildrig-multi)
		echo -e "${RED}Minage Bitfishcoin terminé !${NC}"
		sleep 5
		}

function start_script3() {
		#LTRM
		echo -e "${GREEN}Minage Litpreum ${NC}"
		nvtool --setclocks 1200 --setmem 5000 & /hive/miners/wildrig-multi/0.36.6/wildrig-multi --algo=ghostrider --url aidepremium.ddns.net:3054 --user LQG5qJxcsCamPYb5iQMiEVrxrRdBDdV9fb.Gddrig --pass x & pid3=$!
        echo -e "pid = $pid3"
		sleep 600
		#kill -9 $pid3
		kill -9 $(pgrep wildrig-multi)
		echo -e "${RED}Minage Litoreum terminé !${NC}"
		sleep 5
		       
}


if ! figlet -v > /dev/null 2>&1
then
sudo apt-get update -y > /dev/null 2>&1
sudo apt-get install -y figlet > /dev/null 2>&1
fi

echo -e "${BLUE}"
figlet -f big "Gddrig Script"
echo -e "${YELLOW}================================================================${NC}"
echo -e "${GREEN}Version: $dversion ${NC}"
echo -e ""
echo -e "${GREEN}Démarrage du script : ${NC}"


for ((i = 0; i < 1000; i++ ))
do
start_script1
start_script2
start_script3
done

exit 0
