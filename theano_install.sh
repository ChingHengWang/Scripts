#!/bin/bash
THEANO=RUN
DOCKER=STOP


#sudo apt-get install nvidia-cuda-toolkit #dangerous

if [ $THEANO == "RUN" ]
then
sudo pip install Theano
sudo pip install nose-parameterized
sudo pip install nose
sudo pip install --upgrade --no-deps theano
sudo pip install --upgrade theano
fi

if [ $DOCKER == "RUN" ]
then
sudo docker run -it kaixhin/theano
sudo docker run -it --device /dev/nvidiactl --device /dev/nvidia-uvm --device /dev/nvidia0 kaixhin/cuda-theano:7.0
fi


