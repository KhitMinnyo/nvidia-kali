#!/bin/bash
#NVIDIA Driver Complete installation script
######################################################################################
#                _  ___     _ _     __  __ _                                         #
#       __/\__  | |/ / |__ (_) |_  |  \/  (_)_ __  _ __  _   _  ___     __/\__       #
#       \    /  | ' /| '_ \| | __| | |\/| | | '_ \| '_ \| | | |/ _ \    \    /       #
#       /_  _\  | . \| | | | | |_  | |  | | | | | | | | | |_| | (_) |   /_  _\       #
#         \/    |_|\_\_| |_|_|\__| |_|  |_|_|_| |_|_| |_|\__, |\___/      \/         #
#                                                        |___/                       #
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
#@@@@@@@@@@@@@  Instructor  @@@@@@@@@@@@@@ All in One Hacking Training  @@@@@@@@@@@@@#
#*************** Viber 09 976 41 3560 && Mail khitminnyo@khitminnyo.com *************#
######################################################################################

#This script will install NVIDIA Graphic Driver & OpenCL loaders

#Color Coding
#Colors 
RED="\e[31m"
ORANGE="\e[33m"
BLUE="\e[94m"
GREEN="\e[92m"
STOP="\e[0m"
PURPLE="\e[35m"
YELLOW="\e[33m"
RED="\e[31m"
CYAN="\e[36m"
WHITE="\e[37m"
Text='\033[1;32m'
NC='\033[0m'
STOP="\e[0m"

#Animations
BLINK="\e[5m"


#Inform dependencies ..........
echo -e "${RED}This script will install NVIDIA Graphic Driver & OpenCL loaders. Be sure your computer has NVIDIA Graphic card. ${STOP}"
while true; do
	printf ${Text}
    read -p "Do you want to install it now (y/n)  " yn
    printf ${STOP}
    case $yn in
        [Yy]* ) 

#Updating ........ 
				sudo apt update ;
echo -e "${GREEN} If you  see upgradable packages above, please upgrade your system first.${STOP}"
echo -e "You can use ${BLUE}  apt full-upgrade -y${STOP}"
read
				 sleep 1.5 
				 clear

#info
				lspci | grep -i nvidia ;
                                lspci -s 07:00.0 -v ;
echo -e "${GREEN} This is your Graphic information, but it may be missing.${STOP}"
echo -e "${BLUE} Press Enter to continue."
read
				 sleep 1.5 
				 clear

#Installing .......
echo -e "${GREEN} Now, system will install NVIDIA driver && CUDA toolkit.${STOP}"
echo -e "${GREEN} It may take a moment epending on your connection.${STOP}"
echo -e "${BLUE} Press Enter to continue.${STOP}"
read
				sudo apt install -y nvidia-driver nvidia-cuda-toolkit clinfo nvidia-xconfig ; 

				 sleep 1.5
				 clear

#Testing 
echo -e "${GREEN} This will verify your installed drivers. ${STOP}"
				nvidia-smi ; 
echo -e "${BLUE} Press enter to continue.${STOP}"
read
				 sleep 1.5
				 clear


#Checking client information
echo -e "${GREEN} This will check client information.${STOP}"
				clinfo; 
echo -e "${BLUE} Press enter to continue.${STOP}"
read
				 sleep 1.5
				 clear

#OpenCL loader
echo -e "${GREEN} It may be necessary to check for additional packages that may be conflicting with our setup. Let’s first check to see what OpenCL Loader we have installed. The NVIDIA OpenCL Loader and the generic OpenCL Loader will both work for our system. ${STOP}"

				dpkg -l |  grep -i icd; 
echo -e "${BLUE} Press enter to continue.${STOP}"
read
				 sleep 1.5
				 clear
# removing unnecessaries ..... 
echo -e "${GREEN} Now checking unnecessary drivers that you should remove.${STOP}"
                                dpkg -l |  grep -i mesa-opencl-icd
echo -e "${GREEN} If you see any package above, you should remove them. ${STOP}"
echo -e "${GREEN} You have to remove manually with ${RED}sudo apt remove ${GREEN}package-name in another Terminal .${STOP}"
echo -e "${BLUE} Press enter to continue.${STOP}"
read
echo -e "${BLUE}Since we have determined that we have a compatible ICD loader installed, we can easily determine which loader is currently being used. ${STOP}"
                                 clinfo | grep -i "icd loader"
echo -e "${BLUE} Press enter to continue.${STOP}"
read
				 sleep 1.5
				 clear

#Checking Graphic information
echo -e "${GREEN} This will show your details Graphic information.${STOP}"
				nvidia-smi -i 0 -q; 
echo -e "${BLUE} Press enter to continue.${STOP}"
read
				 sleep 1.5
				 clear

#3D rendering
echo -e "${GREEN}It looks like our GPU is being recognized correctly, so let’s use glxinfo to determine if 3D Rendering is enabled. ${STOP}"
                                 sudo apt install -y mesa-utils  ;
                                 glxinfo | grep -i "direct rendering"   ;
				 sleep 1.5
				 clear

echo "Have a nice time! " 
printf "${GREEN}"
echo "====================================================================================="
printf "${ORANGE}"
echo ""
echo "                _  ___     _ _     __  __ _                                  "
echo "       __/\__  | |/ / |__ (_) |_  |  \/  (_)_ __  _ __  _   _  ___     __/\__ "
echo "       \    /  | ' /| '_ \| | __| | |\/| | | '_ \| '_ \| | | |/ _ \    \    / "
echo "       /_  _\  | . \| | | | | |_  | |  | | | | | | | | | |_| | (_) |   /_  _\ "
echo "         \/    |_|\_\_| |_|_|\__| |_|  |_|_|_| |_|_| |_|\__, |\___/      \/   "
echo "                                                        |___/                 "

printf "${RED}"
echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
echo -e "\e[33m@@@@@@@@@@@@@ \e[0m \e[5mInstructor \e[0m \e[33m@@@@@@@@@@@@@@\e[0m \e[5mAll in One Hacking Training \e[0m \e[33m@@@@@@@@@@@@@@"
printf "${STOP}"
printf "${CYAN}"
echo "*************** Viber 09 976 41 3560 && Mail khitminnyo@khitminnyo.com **************"
printf "${LPURPLE}"
echo -e "\e[95m#####################################################################################"

printf "${STOP}"


				break;;
        [Nn]* ) echo "OK! Now you can exit."
			exit;;
        * ) echo "Please answer yes or no.";;
    esac
done
