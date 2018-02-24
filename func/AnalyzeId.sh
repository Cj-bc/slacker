#
# slacker
#
# copyright (c) 2017Cj_bc
# 
# This software is released under MIT License.
# http://opensource.org/license/mit-license.php
#


# Using files
#  * $$HOMEBREW_PREFIX/Cellar/slacker/.basicconf
#  * texts/FunctionsTexts.sh
#  * texts/URLs.sh
#  * texts/Error_Codes.sh


function GetUserId {
#echo "debug: before awk (at AnalyzeId,line19)" # debugcode
 local Token=`awk -F "\"" ' /Token/ {print $4}' $$HOMEBREW_PREFIX/Cellar/slacker/.basicconf`
 UserName=$1
#echo "debug: UserName = ";echo $UserName;echo " (at AnalyzeId,line21)" # debugcode

#
# 1.Get all userData
# 2.Use awk to collect needed datas(UserId and username)
# 3.Check whether designated name is in the user list
# 4.Select needed UserId and name,Then return the Id
#

# 1. -o option output the response
curl -s -d "token=${Token}" $UserListURL | python -mjson.tool > .data
test "$DebugFlag" = "1"  && echo "debug: .data=" && cat .data && echo "(at AnalyzeId:line32\n)" # debugcode

# 2. 
test "$DebugFlag" = "1"  && echo "debug: before awk at GetUserId (at AnalyzeId:line35)" # debugcode
 awk -v username=$UserName -F "\"" ' /"id"/ { print $4 } /"name"/ { print $4;if ( $4 == username ) exit } ' .data > .data2
# 3.
 if cat .data2 | grep ${UserName} > /dev/null
 then

#echo "debug: user exist here (at AnalyzeId,line43)" # debugcode
	:
 else
#echo "debug: user isn't exist here (at AnalyzeId,line43)" # debugcode
  echo $NoExistUserName 1>&2
  return $Error_NoExistUsrName
 fi 
#4. remove .date file finally for security
 echo `tail -n 2 .data2 | head -n 1`
# echo `tail -n 2 .data2 | head -n 1` > debugtext # debugcode
 rm .data .data2
 return 0
}




#
# GetImId is almost the same as GetUserId
#
function GetImId {

test "$DebugFlag" = "1" && echo "debug: before awk at GetImId.(AnalyzeId:line58)" # debugcode
	local Token=`awk -F "\"" ' /Token/ {print $4}' $HOMEBREW_PREFIX/Cellar/slacker/.asicconf`

	if [ -p /dev/stdin ]
	then
		 read UserId < /dev/stdin
test "$DebugFlag" = "1" && echo "debug: UserId with pipe is "$UserId"(at GetImId:line70)" # debugcode
#echo "debug: UserId with pipe is "$UserId"(at GetImId:line71)" # debugcode
	else
		UserId=$1
test "$DebugFlag" = "1" && echo "debug: UserId is "$UserId"(at GetImId:line68)" # debugcode
	fi

#echo "UserId is set to ";echo $UserId;echo " (at AnalyzeId,line73)" #debugcode


#
# User should be correct because only system call this function 
#
# 1.Get all userData
# 2.Use awk to collect needed datas(ImId and UserId)
# 3.Check whether designated id is in the userid list.If not, open a new im
# 4.Select needed ImId and UserId,Then return the ImId
#



# 1. -o option output the response
	curl -s -d "token=${Token}" $ImListURL | python -mjson.tool > .data3 ## I'm not sure this make .data file.'cuz it's empty in .data
test "$DebugFlag" = "1" && echo "debug: ImList's .data =" && cat .data3 # debugcode
# 2. 
	awk -v userid=$UserId -F "\"" ' /"id"/ { print $4 } /"user"/ { print $4;if ( $4 == userid ) exit } ' .data3 > .data4   ## This awk semms to output ERROR that "can't read .data"
	# 3.
	#echo ".data4 is ";cat .data4;echo "(at Analyze,line90)" # debugcode
	if cat .data4 | grep ${UserId} > /dev/null
	then
	#echo "got UserId in .data4 (at Analyze,line93)" # debugcode
		:
	else
#echo "UserId is ";echo $UserId;echo "(at AnalyzeId,line101)" # debugcode
		 curl -s -d "token=${Token}" -d "user=${UserId}" -d "include_locale=true" $ImOpenURL | python -mjson.tool > .data3
test "$DebugFlag" = "1" && echo "debug: ImList's second .data=";cat .data3 #debugcode

		 awk -F "\"" ' /"id"/ { print $4 } /"user"/ { print $4 } ' .data3 > .data4
	 fi 
	#4. remove .date file finally for security
	echo `tail -n 2 .data4 | head -n 1`
	rm .data3 .data4
	return 0

}



function GetChannelId { 
	local Token=`awk -F "\"" ' /Token/ {print $4}' $HOMEBREW_PREFIX/Cellar/slacker/asicconf`
	if [ $# -eq 0 ]
	then
		local channelname=`awk -F "\"" ' /channel/ {print $4} ' $SlackerPath/.slackerconf`
	else
		local channelname=$1;
	fi

	curl -s -d "token=${Token}" $ChannelListURL | python -mjson.tool > .data
	test "$DebugFlag" = "1" && echo "debug: GetChannelList's .data is  " && cat .data && echo " (at AnalyzeId,line118)" # debugcode
	awk -v channelname=$channelname -F "\"" ' /"id"/ { print $4 } /"name"/ { print $4;if ( $4 == channelname ) exit} ' .data > .data2

	if cat .data2 | grep ${channelname} > /dev/null
	then
	  :
	else
		echo $NoExistChannelName 1>&2
		return $Error_NoExistChannelName
	fi

	echo `tail -n 2 .data2 | head -n 1` 
	rm .data .data2 
	return 0 
}
