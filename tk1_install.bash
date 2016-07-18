#!/bin/bash
JETPACK=RUN

# initial /home/
if [ $JETPACK == "RUN" ]
then
#mkdir -p ~/tk1/jetpack 
#cd ~/tk1/jetpack
#https://developer.nvidia.com/embedded/dlc/jetpack-l4t-2_2     JetPack-L4T-2.2-linux-x64.run
cd ~/tk1/jetpack
sudo chmod +x JetPack*.run
./JetPack*.run

fi



