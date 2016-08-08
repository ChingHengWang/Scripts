#!/bin/bash
#REF http://blog.csdn.net/itas109/article/details/50790139

INITIAL_TOOL=STOP
INSTALL_LIB=STOP
INSTALL_TORCH=STOP
INSTALL_TORCH_DEP=STOP
INSTALL_OPENCV_2_4_11=STOP
INSTALL_DLIB_18_16=STOP
INSTALL_OPENFACE=RUN


if [ $INITIAL_TOOL == "RUN" ]
then
sudo apt-get install build-essential -y  
sudo apt-get install cmake -y  
sudo apt-get install curl -y  
sudo apt-get install gfortran -y  
sudo apt-get install git -y  
sudo apt-get install libatlas-dev -y  
sudo apt-get install libavcodec-dev -y  
sudo apt-get install libavformat-dev -y  
sudo apt-get install libboost-all-dev -y  
sudo apt-get install libgtk2.0-dev -y  
sudo apt-get install libjpeg-dev -y  
sudo apt-get install liblapack-dev -y  
sudo apt-get install libswscale-dev -y  
sudo apt-get install pkg-config -y  
sudo apt-get install python-dev -y  
sudo apt-get install python-pip -y  
sudo apt-get install wget -y  
sudo apt-get install zip -y
fi

if [ $INSTALL_LIB == "RUN" ]
then
# data analysis library 
# scientific computing
sudo pip2 install numpy scipy pandas  
#sckikit-learn machine learning
sudo pip2 install scikit-learn 
#scikit-image
# or 
sudo apt-get install python-skimage
fi


# install Torch
# Lua script LuaJIT
# for deep learning
if [ $INSTALL_TORCH == "RUN" ]
then
cd ~/
curl -s https://raw.githubusercontent.com/torch/ezinstall/master/install-deps | bash -e  
#curl -s https://raw.githubusercontent.com/torch/ezinstall/master/install-all | bash -e  

git clone https://github.com/torch/distro.git ~/torch --recursive  
cd ~/torch 
bash install-deps
sudo ./install.sh 
source ~/.bashrc
fi


if [ $INSTALL_TORCH_DEP == "RUN" ]
then
cd ~/

sudo ~/torch/install/bin/luarocks install dpnn  
sudo ~/torch/install/bin/luarocks install nn  
sudo ~/torch/install/bin/luarocks install optim  
sudo ~/torch/install/bin/luarocks install csvigo  
sudo ~/torch/install/bin/luarocks install cunn  
sudo ~/torch/install/bin/luarocks install fblualib  
sudo ~/torch/install/bin/luarocks install torchxfi
sudo ~/torch/install/bin/luarocks install argcheck

cd ~/torch
git config --global user.email "qoogood1234@gmail.com" 
git config --global user.name "ChingHengWang"
./update.sh
fi

if [ $INSTALL_OPENCV_2_4_11 == "RUN" ]
then
mkdir -p ~/opencv 
cd  ~/opencv
curl  -L https://github.com/Itseez/opencv/archive/2.4.11.zip -o ocv.zip  
unzip  ocv.zip  
cd  opencv-2.4.11  
mkdir  release  
cd  release  
cmake -D CMAKE_BUILD_TYPE=RELEASE -D CMAKE_INSTALL_PREFIX=/usr/local ..  
make  -j8  
sudo make  install  
rm ../../ocv.zip
fi


if [ $INSTALL_DLIB_18_16 == "RUN" ]
then
mkdir -p ~/dlib 
cd ~/dlib 
wget https://github.com/davisking/dlib/releases/download/v18.16/dlib-18.16.tar.bz2
tar xf dlib-18.16.tar.bz2  
cd dlib-18.16/python_examples  
mkdir build  
cd build  
cmake ../../tools/python  
cmake --build . --config Release  
sudo cp dlib.so /usr/local/lib/python2.7/dist-packages  
cd ~/dlib && rm dlib-18.16.tar.bz2
fi

if [ $INSTALL_OPENFACE == "RUN" ]
then
cd ~/
git clone https://github.com/cmusatyalab/openface.git && cd openface
git submodule init  
git submodule update  
sudo python2 setup.py install
cd models
./get-models.sh
fi 
