#!/bin/bash

# Color Variables
GREEN='\033[0;32m'
CYAN='\033[0;36m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# Clear the screen
clear

# SDGAMER Banner
echo -e "${CYAN}"
echo "  ____  ____   ____    _    __  __ _____ ____  "
echo " / ___||  _ \ / ___|  / \  |  \/  | ____|  _ \ "
echo " \___ \| | | | |  _  / _ \ | |\/| |  _| | |_) |"
echo "  ___) | |_| | |_| |/ ___ \| |  | | |___|  _ < "
echo " |____/|____/ \____/_/   \_\_|  |_|_____|_| \_\\"
echo "================================================="
echo "        Svm-Panel Auto-Installer Script"
echo "================================================="
echo -e "${NC}"

# Check for root privileges 
if [ "$EUID" -ne 0 ]; then
  echo -e "${RED}[!] Please run this script as root!${NC}"
  exit 1
fi

# 1. Download the panel
echo -e "${GREEN}[+] Navigating to /opt directory...${NC}"
cd /opt || { echo -e "${RED}[!] Failed to cd into /opt${NC}"; exit 1; }

echo -e "${GREEN}[+] Cloning Hvm-Panel repository...${NC}"
git clone https://github.com/sdgamer8263-sketch/vpsctrl1
cd vpsctrl1 || { echo -e "${RED}[!] Failed to cd into Svm-Panel${NC}"; exit 1; }

echo -e "${GREEN}[+] Installing unzip...${NC}"
apt update -y
apt install unzip -y

echo -e "${GREEN}[+] Extracting svm.zip...${NC}"
unzip -o svm.zip # -o overwrites without prompting
cd Svm-v1 || { echo -e "${RED}[!] Failed to cd into Svm-v1${NC}"; exit 1; }

# 2. Make install script executable
echo -e "${GREEN}[+] Making install.sh executable...${NC}"
chmod +x install.sh

# 3. Run installation
echo -e "${GREEN}[+] Running the installation script...${NC}"
./install.sh

echo -e "${CYAN}[+] HVM-Panel setup execution finished!${NC}"
