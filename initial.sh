#!/bin/bash
INITIAL_HOME=STOP
INSTALL_TOOL=STOP
SET_VIMRC_CLIPBOARD=STOP
INSTALL_ROS=STOP
SET_ROS_ENV=STOP
INSTALL_ROS_PKG=RUN
INSTALL_ARDUINO=STOP


#echo "INITIAL_HOME=$INITIAL_HOME"
#echo "INSTALL_TOOL=$INSTALL_TOOL"
#echo "INSTALL_ROS=$INSTALL_ROS"

# initial /home/
if [ $INITIAL_HOME == "RUN" ]
then
cd ~/
rm Public -r
rm Videos -r 
rm Pictures -r
rm Templates -r
rm Music -r
rm Documents -r
fi


#install tool
if [ $INSTALL_TOOL == "RUN" ]
then
sudo apt-get install vim
sudo apt-get install vim-gtk
sudo apt-get install terminator
sudo apt-get install ibus-chewing
fi


# set vimrc clipboard
if [ $SET_VIMRC_CLIPBOARD == "RUN" ]
then
echo 'set nu' > ~/.vimrc
echo 'set clipboard=unnamed,unnamedplus' > ~/.vimrc
fi

# install ROS
if [ $INSTALL_ROS == "RUN" ]
then
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
sudo apt-key adv --keyserver hkp://ha.pool.sks-keyservers.net --recv-key 0xB01FA116
sudo apt-get update
sudo apt-get install ros-indigo-desktop-full
sudo rosdep init
rosdep update
echo "source /opt/ros/indigo/setup.bash" >> ~/.bashrc
source ~/.bashrc
source /opt/ros/indigo/setup.bash
sudo apt-get install python-rosinstall
sudo apt-get install ros-indigo-slam-
mkdir catkin_ws
mkdir -p ~/catkin_ws/src
cd ~/catkin_ws/src
catkin_init_workspace
cd ~/catkin_ws/
catkin_make

fi

#set SET_ROS_ENV
if [ $SET_ROS_ENV == "RUN" ]
then

echo "source ~/catkin_ws/devel/setup.bash" >> ~/.bashrc
fi



#install ROS_PACKAGE
if [ $INSTALL_ROS_PKG == "RUN" ]
then
sudo apt-get install ros-indigo-joy*

fi

#install ARDUINO
if [ $INSTALL_ARDUINO == "RUN" ]
then
sudo apt-get update && sudo apt-get install arduino arduino-core
cd ~/
wget https://downloads.arduino.cc/arduino-1.6.9-linux64.tar.xz
tar xvf arduino-1.6.9-linux64.tar.xz
cd arduino*
./install.sh
rm arduino*.tar.xz
fi

 
