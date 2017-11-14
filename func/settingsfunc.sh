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


#
#  By using setup function,
# user can set settings with wizard
# more settings are defaulted.see .slackerconf
#
function setup {
 local Token
 local ChanelName
 local UserName

 if [ $1 -eq "first" ]
 then
  cp ./texts/templates/.slackerconf .slackerconf
  echo $AnnounceToGetToken
  read Token
  sed -e "/Token :/i $Token" .basicconf
  echo $AnnounceToSetChannel
  read ChannelName
  sed -e "/\"Channel\": /i \"$ChannelName\"" .slackerconf
  echo $AnnounceToSetUsername
  read UserName
  if [ -z $ UserName ]
  then
   sed -e "/\"username\": /i \"slackerbot\"" .slackerconf
  else
   sed -e "/\"username\": /i \"$UserName on CUI\"" .slackerconf
  fi
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
