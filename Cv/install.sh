#!/bin/bash

# ==============================================================================
# Title: HVM Panel v6 - Ultimate Rainbow Edition
# Developer: SDGAMER
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
        " _   _  ___  ____ ___ _   _  ____ ____   _____   __________ "
        "| | | |/ _ \\|  _ \\_ _| \\ | |/ ___| __ ) / _ \\ \\ / /__  /  _ \\"
        "| |_| | | | | |_) | ||  \\| | |  _|  _ \\| | | \\ V /  / /| |_) |"
        "|  _  | |_| |  __/| || |\\  | |_| | |_) | |_| || |  / /_|  __/"
        "|_| |_|\\___/|_|  |___|_| \\_|\\____|____/ \\___/ |_| /____|_|  "
        "                                                                "
        "                         HVM PANEL V6                           "
        "                      POWERED BY SDGAMER                        "
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
sudo apt install -y unzip snapd bridge-utils uidmap lxc-utils python3-pip python3-venv git

# 2. Extracting Files via Git Clone
echo -e "${C4}--> [2/7] Cloning repository and unzipping assets...${NC}"
# Remove existing vpsctrl folder if the script is run multiple times
rm -rf vpsctrl 
git clone https://github.com/sdgamer8263-sketch/vpsctrl.git
cd vpsctrl/Cv || { echo -e "${C1}✖ Error: Repository directory not found!${NC}"; exit 1; }

if [ -f "Svm-v5.zip" ]; then
    unzip -o Svm-v5.zip
    echo -e "${C3}✔ Files extracted successfully from clone.${NC}"
else
    echo -e "${C1}✖ Error: Svm-v5.zip not found in the cloned repository!${NC}"
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
echo -e " ${C3}✅ INSTALLATION FINISHED BY SDGAMER${NC}"
echo -e " ${WHITE}🌐 PORT:${NC} ${C2}3000${NC}"
echo -e " ${C6}🚀 STARTING HVM PANEL V6 NOW...${NC}"
echo -e "${C4}================================================================================${NC}"
echo ""

# Run the panel
# Note: Ensure svm.py is configured to listen on port 3000
./venv/bin/python3 svm.py
