#!/bin/bash
THEANO=RUN
DOCKER=RUN

if [ $THEANO == "RUN" ]
then
sudo pip install Theano
fi

if [ $DOCKER == "RUN" ]
then
sudo docker run -it kaixhin/theano
sudo docker run -it --device /dev/nvidiactl --device /dev/nvidia-uvm --device /dev/nvidia0 kaixhin/cuda-theano:7.0
fi


