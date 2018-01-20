#
# slacker
#
# copyright (c) 2017Cj_bc
# 
# This software is released under MIT License.
# http://opensource.org/license/mit-license.php
#


# Functions here are made for systemcall,not for usercall

source $SlackerPath/texts/FunctionsTexts.sh   #All texts are in here.

function settingconf {
test "$DebugFlag" = "1"  && echo "debug: \$@ of settingconf is "$@"(at settingconf:line16)" # debugcode
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
     awk -v key="$Key" -v arg="$Arg" -F "\"" 'BEGIN{OFS=""} /'$Key'/ { $2="\""key"\"";$3=": "arg;$5=","} {print $0}' $SlackerPath/.slackerconf > $SlackerPath/.slackerconfch1;;
  * ) awk -v key="$Key" -v arg="$Arg" -F "\"" 'BEGIN{OFS=""} /'$Key'/ { $2="\""key"\"";$4="\""arg"\"";$5=","} {print $0}' $SlackerPath/.slackerconf > $SlackerPath/.slackerconfch1;;
 esac
 rm $SlackerPath/.slackerconf
 mv $SlackerPath/.slackerconfch1 $SlackerPath/.slackerconf
 return 0
}




#
#  By using setup function,
# user can set settings with wizard
# more settings are defaulted.see $SlackerPath/.slackerconf
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

		local SuccessFlag=0 # When each part was succeeded, set to 1
		while [ $SuccessFlag -eq 0 ]
		do  #---------------  Set Token
			echo $AnnounceToGetToken
			read -s Token; echo "\n"
			if [ $Token = "" ]
			then # failed (no input)
				echo $Text_NotProperArguments
			else
				echo " \"Token\": \"$Token\" " > $SlackerPath/.basicconf
				SuccessFlag=1 # Set to 1, becaus of success
			fi
		done
		SuccessFlag=0 # Reset the flag

		while [ $SuccessFlag -eq 0 ] #------------- Set default channel
		do
			echo $AnnounceToSetChannel
			read ChannelName
			! settingconf channel $ChannelName # if succeeded -> $? = 1  failed -> $? = 0
			SuccessFlag=$?
		done

		echo $AnnounceToSetUsername #----------- Set username (default is "slackerdeliver")
		read UserName
		if [ -z $UserName ]
		then
			settingconf username slackerdeliver
		else
			settingconf username $UserName
		fi
	fi
}
