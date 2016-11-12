#!/bin/bash
#REF http://blog.csdn.net/itas109/article/details/50790139

INITIAL_TOOL=STOP

if [ $INITIAL_TOOL == "RUN" ]
then
sudo apt-get install libprotobuf-dev libleveldb-dev libsnappy-dev libopencv-dev libhdf5-serial-dev protobuf-compiler
sudo apt-get install --no-install-recommends libboost-all-dev

sudo install ATLAS by sudo apt-get install libatlas-base-dev
sudo apt-get install libgflags-dev libgoogle-glog-dev liblmdb-dev

git clone https://github.com/BVLC/caffe.git
cd caffe
mkdir build
cd build
cmake ..
make all
make install
make runtest
export PYTHONPATH=~/3d_party/caffe/python:$PYTHONPATH
sudo apt-get install python-protobuf
fi

