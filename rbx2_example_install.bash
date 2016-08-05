#!/bin/bash
#REF https://drive.google.com/drive/folders/0B134T1DTCk6tenJtaGZwV0NLZ2c
INITIAL_TOOL=STOP

if [ $INITIAL_TOOL == "RUN" ]
then
cd ~/catkin_ws
wget https://raw.githubusercontent.com/pirobot/rbx2/indigo-devel/rbx2-prereq.sh
chmod +x rbx2-prereq.sh
sh rbx2-prereq.sh

cd ~/catkin_ws/src
git clone https://github.com/pirobot/rbx1.git
cd rbx1
git checkout indigo-devel
cd ~/catkin_ws/src
git clone https://github.com/pirobot/rbx2.git
cd rbx2
git checkout indigo-devel
cd ~/catkin_ws
catkin_make
source ~/catkin_ws/devel/setup.bash
fi


