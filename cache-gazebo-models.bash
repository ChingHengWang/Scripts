#!/bin/bash

MODEL_DIR="$HOME/.gazebo/models/"

# create model dir
mkdir -p "$MODEL_DIR"


cd $HOME/.gazebo

wget -l 2 -nc -r "http://models.gazebosim.org/" --accept gz

cd $HOME/.gazebo/models.gazebosim.org


#Extract all model archives
for i in *
do
  tar -zvxf "$i/model.tar.gz"
done

# Copy extracted files to the local model folder
cp -vfR * "$HOME/.gazebo/models/"
