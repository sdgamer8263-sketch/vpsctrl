#!/bin/bash

# ==============================================================================
# Title: Svm Panel v5 - Ultimate Rainbow Edition
# Developer: ANKIT DEV
# ==============================================================================

# Color Definitions
C1='\033[0;31m' # Red
C2='\033[0;33m' # Yellow
C3='\033[0;32m' # Green
C4='\033[0;36m' # Cyan
C5='\033[0;34m' # Blue
C6='\033[0;35m' # Magenta
WHITE='\033[1;37m'
NC='\033[0m' # No Color

clear

# --- Rainbow Header Logic ---
print_rainbow() {
    local lines=(
        "################################################################################"
        "  ____ __     __ __  __   ____   _      _   _  _____  _      "
        " / ___|\\ \\   / /|  \\/  | |  _ \\ / \\    | \\ | || ____|| |     "
        " \\___ \\ \\ \\ / / | |\\/| | | |_) / _ \\   |  \\| ||  _|  | |     "
        "  ___) | \\ V /  | |  | | |  __/ ___ \\  | |\\  || |___ | |___  "
        " |____/   \\_/   |_|  |_| |_| /_/   \\_\\ |_| \\_||_____||_____| "
        "                                                                "
        "                      VERSION 5.0 - ULTIMATE                    "
        "                   --- MADE BY ANKIT DEV ---                    "
        "################################################################################"
    )
    local colors=($C1 $C2 $C3 $C4 $C5 $C6)
    for i in "${!lines[@]}"; do
        echo -e "${colors[$i % ${#colors[@]}]}${lines[$i]}${NC}"
    done
}

print_rainbow
echo ""

# 1. Update System
echo -e "${C3}--> [1/7] Updating system and core tools...${NC}"
sudo apt update && sudo apt upgrade -y
sudo apt install -y unzip snapd bridge-utils uidmap lxc-utils python3-pip python3-venv

# 2. Extracting Files (Updated to Svm-v5.zip)
echo -e "${C4}--> [2/7] Unzipping Svm-v5.zip assets...${NC}"
if [ -f "Svm-v5.zip" ]; then
    unzip -o Svm-v5.zip
    echo -e "${C3}✔ Svm-v5 Files extracted successfully.${NC}"
else
    echo -e "${C1}✖ Error: Svm-v5.zip not found! Upload the file first.${NC}"
fi

# 3. LXD Setup
echo -e "${C5}--> [3/7] Setting up LXD Virtualization...${NC}"
sudo snap install lxd
sudo usermod -aG lxd $USER

# 4. Network Init
echo -e "${C6}--> [4/7] Configuring Network Bridge...${NC}"
sudo lxd init --auto

# 5. Venv Setup
echo -e "${C2}--> [5/7] Preparing Virtual Environment...${NC}"
if [ ! -d "venv" ]; then
    python3 -m venv venv
fi

# 6. Dependencies
echo -e "${C4}--> [6/7] Installing requirements...${NC}"
./venv/bin/pip install --upgrade pip
if [ -f "requirements.txt" ]; then
    ./venv/bin/pip install -r requirements.txt
else
    echo -e "${C2}⚠ Warning: requirements.txt missing!${NC}"
fi

# 7. Final Launch (Port 3000)
echo ""
echo -e "${C4}================================================================================${NC}"
echo -e " ${C3}✅ INSTALLATION FINISHED BY ANKIT DEV${NC}"
echo -e " ${WHITE}🌐 PORT:${NC} ${C2}3000${NC}"
echo -e " ${C6}🚀 STARTING SVM-V5 PANEL NOW...${NC}"
echo -e "${C4}================================================================================${NC}"
echo ""

# Run the panel
# Note: Ensure svm.py is configured to listen on port 3000
./venv/bin/python3 svm.py
