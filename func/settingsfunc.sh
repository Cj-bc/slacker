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
 if [ $# -ne 2 ]
 then
  echo $Text_NotProperArguments
  return $Error_NotProperArguments
 fi

 local Key=$1
 local Arg=$2
# some keys should be true/false.
 case $Key in
  "as_user" )      # keys here should be true/false.
     if ! [ "$Arg" = "true" -o "$Arg" = "false" ];then
       echo $Text_NotTrueOrFalse
       return $Error_NotTrueOrFalse
     fi
     awk -v key="$Key" -v arg="$Arg" -F "\"" 'BEGIN{OFS=""} /'$Key'/ { $2="\""key"\"";$3=": "arg;$5=","} {print $0}' .slackerconf > .slackerconfch1;;
  * ) awk -v key="$Key" -v arg="$Arg" -F "\"" 'BEGIN{OFS=""} /'$Key'/ { $2="\""key"\"";$4="\""arg"\"";$5=","} {print $0}' .slackerconf > .slackerconfch1;;
 esac
 rm .slackerconf
 mv .slackerconfch1 .slackerconf
 return 0
}




#
#  By using setup function,
# user can set settings with wizard
# more settings are defaulted.see .slackerconf
#
function setup {
  if [ $# -ne 1 ]
 then
  echo $Text_NotProperArguments
  return $Error_NotProperArguments
 fi

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
