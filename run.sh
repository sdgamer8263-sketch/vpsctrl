Vps_panels_menu() {

while true; do
clear

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

echo "-----------------------------"
echo "VPS Panels"
echo "-----------------------------"
echo "Server VPS Panel Manager"
echo "-----------------------------"
echo
echo "1. HVM & VPS Bot"
echo "2. HVM (6.1)"
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
git clone https://github.com/sdgamer8263-sketch/Cv
cd Cv || exit
bash install.sh

echo "Extracting SVM..."
unzip Svm-v5.zip

echo "Starting SVM..."
python3 svm.py
;;

0)
break
;;

*)
echo "Invalid option!"
sleep 1
;;

esac

done

}

# 👇 THIS LINE FIXES EVERYTHING
vps_panels_menu
