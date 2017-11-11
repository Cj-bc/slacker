#!bin/bash
#
# slacker
#
# copyright (c) 2017Cj_bc
# 
# This software is released under MIT License.
# http://opensource.org/license/mit-license.php
# version 0.0.1

# source textfiles,functions
Version=0.0.1
source ./func/*
source ./texts/*
source .basicconf

# test wheather initialization is in need
if [ $1 -eq "init" ] || [ -f .basicconf ] && [ $# -ne 0 ]
then
 echo "you need to setup your slacker first."
 setup first      #this is in settingfunc.sh file.
 exit 0
fi

# with no arg,show version
if [ $# -eq 0 ]
then
 echo "version: ${Version}"
 exit 0
fi

#
# test all arg and call function
# Functions are here:
# settingfunc.sh --- setting
#                 |- setting_channel
#                 |- setting_user
# sendfunc.sh --- send
#

case "$1" in
 "set" ) shift;setting "$＊" ;;
 "send" | "s" )  shift;send "$＊" ;;
 "channel" | "c" ) shift;setting_channel "$＊" ;;
 "user" | "u" ) shift;setting_user "$＊" ;;
 ＊ ) echo "unknown argument.\n${usage}" 1>&2 ;;
esac
