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

function settingconf {
 local Key=$1
 local Arg=$2

 awk -v key="$Key" -v arg="$Arg" -F "\"" 'BEGIN{OFS=""} /'$Key'/ { $2="\""key"\"";$4="\""arg"\""} {print $0}' .slackerconf > .slackerconfch1
 rm .slackerconf
 mv .slackerconfch1 .slackerconf
echo "debug settingfunc.beforereturn"
 return 0
}




#
#  By using setup function,
# user can set settings with wizard
# more settings are defaulted.see .slackerconf
#
function setup {
 local Token
 local ChanelName
 local UserName

 if [ "$1" = "first" ]
 then
  cp ./texts/templates/.slackerconf .slackerconf
  echo $AnnounceToGetToken
  read -s Token; echo "\n"
  echo " \"Token\": \"$Token\" " > .basicconf
  echo $AnnounceToSetChannel
  read ChannelName
  settingconf channel $ChannelName
  echo $AnnounceToSetUsername
  read UserName
  if [ -z $UserName ]
  then
   settingconf username slackerbot
  else
   settingconf username $UserName
  fi
 fi
}

function setting_channel {
 ChannelName=$1
 ChannelId=`GetChannelId $ChannelName`
 return 0
}

function setting_user {
 UserName=$1
 UserId=`GetUserId $UserName`
 return 0
}


function usage {
 echo $UsageText
 exit 1
}
