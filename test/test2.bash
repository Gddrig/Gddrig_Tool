#!/bin/bash

# Variables
banane=10
billet=50

# Couleurs
RED='\033[1;31m'
YELLOW='\033[1;33m'
BLUE="\\033[38;5;27m"
SEA="\\033[38;5;49m"
GREEN='\033[1;32m'
CYAN='\033[1;36m'
NC='\033[0m'

clear
echo -e "${GREEN}=================================================================================${NC}"

echo -e "${BLUE}"
figlet -f big "chluxe"

echo -e "${GREEN}=================================================================================${NC}"

echo -e "Salut, voici pour premier script sous Linux"

echo -e "${RED}"
figlet -f big "merci patron".

echo -e "${RED}"
figlet -f big "merci patron".

echo -e "${YELLOW}================================================================${NC}"

echo -e "Combien coûte la banane sur Exbitron Amin ?"
echo -e "1) 100000 usdt"
echo -e "2) 3000000usdt"
read -p "Saisissez 1 ou 2 : " reponse

if [ $updateterue==1 ]  

then
echo -e "louper la banane coûte un bras."

else
echo -e "bigo mon petit comptable ?"

fi

echo -e "serrai tu interessé pour plus d'info ?/n1)"

read -p "saisissez 1 ou 2 : " reponse2

if [$updateterue==1]
then
echo -e "ok , passe au bureau ."

else
echo -e "tu c'est pas ce que tu loupe mdr "

fi


echo -e "${YELLOW}================================================================${NC}"