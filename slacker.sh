#!bin/bash

# Written by Cj in y-modify
# 
# version 0.0.1
Version=0.0.1
source ./func/settingfunc.sh

#test wheather initialization is in need
if [ $1 -eq "init" ] || [ -f .basicconf ] && [ $# -ne 0 ]
then
 echo "you need to setup your slacker first."
 setup first      #this is in settingfunc.sh file.
fi

# with no arg,show version
if [ $# -eq 1 ]
then
 echo "version: ${Version}"