#!/bin/bash
#
# slacker
#
# copyright (c) 2017Cj_bc
# 
# This software is released under MIT License.
# http://opensource.org/license/mit-license.php

SlackerPath=/usr/local/Cellar/slacker/$Version
#SlackerPath=.   # for debug
# version 0.1.2.3

# source textfiles,functions
Version=0.1.2.3
shopt -s xpg_echo


if [ "$1" = '--local' ] # just to make debug easier. for changing added before new version
then
	SlackerPath=.   # for debug
	shift
#echo "debug: args after --local shift -> ";echo $@;echo "(at slacker,line18)\n"  # debugcode
else
	SlackerPath=/usr/local/Cellar/slacker
fi

source $SlackerPath/.sourcefiles


# Check debug mode
if [ "$1" = '--debug' ]
then
	DebugFlag=1 # Set to 1 when is debugmode
	shift
fi


# test wheather initialization is in need
if [ "$1" = "init" ] || !  [ -f $SlackerPath/.basicconf ]
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
