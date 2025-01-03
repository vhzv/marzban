#!/bin/bash
port=$(netstat -tunlp | grep 'python' | awk '{split($4, a, ":"); print a[2]}')

# // Code for service
export RED='\033[0;31m';
export GREEN='\033[0;32m';
export YELLOW='\033[0;33m';
export BLUE='\033[0;34m';
export PURPLE='\033[0;35m';
export CYAN='\033[0;36m';
export LIGHT='\033[0;37m';
export NC='\033[0m';

# // Export Banner Status Information
export ERROR="[${RED} ERROR ${NC}]";
export INFO="[${YELLOW} INFO ${NC}]";
export OKEY="[${GREEN} OKEY ${NC}]";
export PENDING="[${YELLOW} PENDING ${NC}]";
export SEND="[${YELLOW} SEND ${NC}]";
export RECEIVE="[${YELLOW} RECEIVE ${NC}]";

# // VAR
if [[ $(netstat -ntlp | grep -i nginx | grep -i 0.0.0.0:443 | awk '{print $4}' | cut -d: -f2 | xargs | sed -e 's/ /, /g') == '443' ]]; then
    NGINX="${GREEN}ON${NC}";
else
    NGINX="${RED}Not Okay${NC}";
fi
if [[ $(netstat -ntlp | grep -i python | grep -i "0.0.0.0:${port}" | awk '{print $4}' | cut -d: -f2 | xargs | sed -e 's/ /, /g') == "${port}" ]]; then
    MARZ="${GREEN}ON${NC}";
else
    MARZ="${RED}Not Okay${NC}";
fi
if [[ $(systemctl status ufw | grep -w Active | awk '{print $2}' | sed 's/(//g' | sed 's/)//g' | sed 's/ //g') == 'active' ]]; then
    UFW="${GREEN}ON${NC}";
else
    UFW="${RED}Not Okay${NC}";
fi

echo ""
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo -e "\E[44;1;39m            Informasi Layanan               \E[0m"
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo -e "</> Xray              : $NGINX"
echo -e "</> Nginx             : $NGINX"
echo -e "</> Apikey            : $MARZ"
echo -e "</> HAProxy           : $MARZ"
echo -e "</> Routing           : $MARZ"
echo -e "</> Firewall          : $UFW"
echo -e "</> Dashboard         : $MARZ"
echo -e "</> LoadBalance       : $MARZ"
echo -e "</> Torrent Blocker   : $MARZ"
echo -e "</> Notification Bot  : $MARZ"
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo -e "Development Angga Alfarizi"
echo -e "Private Script By t.me/anggaalfarizi"
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo ""

