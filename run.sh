#!/bin/bash

# --- SDGAMER BANNER ---
cat << "EOF"
  ____  ____   ____    _    __  __ _____ ____  
 / ___||  _ \ / ___|  / \  |  \/  | ____|  _ \ 
 \___ \| | | | |  _  / _ \ | |\/| |  _| | |_) |
  ___) | |_| | |_| |/ ___ \| |  | | |___|  _ < 
 |____/|____/ \____/_/   \_\_|  |_|_____|_| \_\
                                               
             Credit by HopingBoyz              
EOF
echo ""

vps_panels_menu() {

while true; do
clear

# --- Banner displayed again on reload ---
echo "  ____  ____   ____    _    __  __ _____ ____  "
echo " / ___||  _ \ / ___|  / \  |  \/  | ____|  _ \ "
echo " \___ \| | | | |  _  / _ \ | |\/| |  _| | |_) |"
echo "  ___) | |_| | |_| |/ ___ \| |  | | |___|  _ < "
echo " |____/|____/ \____/_/   \_\_|  |_|_____|_| \_\"
echo ""
echo "             Credit by HopingBoyz              "
echo ""

echo "-----------------------------"
echo "VPS Panels"
echo "-----------------------------"
echo "Server VPS Panel Manager"
echo "-----------------------------"
echo
echo "1. HVM & VPS Bot"
echo "2. HVM"
echo
echo "0. Back"
echo

read -p "Select option: " vps_choice

case $vps_choice in

1)
echo "Launching HVM Installer..."
bash <(curl -fsSL https://raw.githubusercontent.com/DreamHost2ws/HVM5.1/main/LP-Hvm-Installer.sh)
;;

2)
echo "Installing HVM Panel..."
# GitHub Clone link is kept exactly the same as provided
git clone https://github.com/sdgamer8263-sketch/Cv
cd Cv || exit
bash install.sh

echo "Extracting SVM..."
unzip Svm-v5.zip

echo "Starting SVM..."
python3 svm.py
;;

0)
echo "Exiting..."
sleep 1
exit 0
;;

*)
echo "Invalid option!"
sleep 1
;;

esac

done

}

# Run the menu function
vps_panels_menu
