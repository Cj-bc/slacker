#
# slacker
#
# copyright (c) 2017Cj_bc
# 
# This software is released under MIT License.
# http://opensource.org/license/mit-license.php
#


# Functions here are made for systemcall,not for usercall

source texts/FunctionsTexts.sh   #All texts are in here.

function setup {

 if [ $1 -eq "first" ]
 then
  echo $AnnounceToGetToken
  read Token
 fi

 
}

function setting_channel {
 ChannelName=$1
 ChannelId=`GetChannelId $ChannelName`
}

function setting_user {
 UserName=$1
 UserId=`GetUserId $UserName`
}
