#!/bin/bash
#
# slacker
#
# copyright (c) 2017Cj_bc
# 
# This software is released under MIT License.
# http://opensource.org/license/mit-license.php
# version 0.1.0

# source textfiles,functions
Version=0.1.0
shopt -s xpg_echo
source .sourcefiles

# test wheather initialization is in need
if [ "$1" = "init" ] || !  [ -f .basicconf ]
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


# if slacker is called with pipe, send them to selected channel with some texts.
if [ -p /dev/stdin ]
then
 send < /dev/stdin 
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
 "set" ) shift;settingconf $@;;
 "send" | "s" )  shift;send $@;;
 "channel" | "c" ) shift;settingconf channel $1;;
 "help" | "h" ) man slacker || usage;;    # Not ready now
 * ) echo "unknown argument." 1>&2;usage;;
esac
