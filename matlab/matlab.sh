#!/bin/bash
INSTALL=STOP
# initial /home/
if [ $INSTALL == "RUN" ]
then
sudo mount -o loop /media/zach/ZACH_WORK/Software/R2015b_glnxa64.iso ~/mount-point
cd ~/mount-point
sudo ./install
# standalone key 09806-07443-53955-64350-21751-41297
# step http://www.linuxidc.com/Linux/2015-11/125153.htm
fi


