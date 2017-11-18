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

 if [ "$1" = "first" ]
 then
  cp ./texts/templates/.slackerconf .slackerconf
  echo $AnnounceToGetToken
  read -s Token; echo "\n"
  echo " \"Token\": \"$Token\" " > .basicconf
  echo $AnnounceToSetChannel
  read ChannelName
  awk -v channelname=$ChannelName -F "\"" 'BEGIN{OFS=""} /channel/ {$2="\"channel\"";$4="\""channelname"\""} {print $0} ' .slackerconf > .slackerconfch1
  echo $AnnounceToSetUsername
  read UserName
  if [ -z $UserName ]
  then
   awk  -F "\"" 'BEGIN{OFS=""} /username/ {$2="\"username\"";$4="\"slackerbot\""} {print $0} ' .slackerconfch1 > .slackerconfch2
  else
   awk -v username=$UserName -F "\"" 'BEGIN{OFS=""} /username/ {$2="\"username\"";$4="\""username"\""} {print $0} ' .slackerconfch1 > .slackerconfch2
  fi
  rm .slackerconf .slackerconfch1
  mv .slackerconfch2 .slackerconf
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


function usage {
 echo $UsageText
 exit 1
}
