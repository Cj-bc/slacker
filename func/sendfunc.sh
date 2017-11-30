#
# slacker
#
# copyright (c) 2017Cj_bc
# 
# This software is released under MIT License.
# http://opensource.org/license/mit-license.php
#


# we'll get user and channel ID using this.
# needed files
#     ./func/AnalyzeId.sh
#     ./$SlackerPath/.slackerconf


function send_main {
 local Token=`awk -F "\"" ' /Token/ {print $4}' $SlackerPath/$SlackerPath/.basicconf`
 local As_User=`awk -F "\"" ' /as_user/ {print $3} ' $SlackerPath/.slackerconf`
 local BotName=`awk -F "\"" ' /username/ {print $4} ' $SlackerPath/.slackerconf`
 local http_status=0
 local firstarg=$1
#
# Set Id which slacker send messages to
# If username or channelname was passed,Get Id related to 
# If nothing was passed,Get selected Id in settingconf
#

 case $firstarg in
  %* ) SendToId=`GetChannelId ${firstarg:1}` ; shift;;
  @* ) SendToId=`GetUserId ${firstarg:1} | GetImId`;shift;;
  * ) SendToId=`GetChannelId`;;
 esac
# now, message should be in $1 because of shift command.
# we'll send it from here
# token is in another file
# channel is defined 'til the way come here.
# text is Passed message. It's in $1 now.
# as_user option is defined in $SlackerPath/.slackerconf
# username option is defined in $SlackerPath/.slackerconf
 Message=$1


# get http status code with -w '%{http_code}\n' option.
# -s deny to show progress bar
 http_status=`curl -X POST -d "token=${Token}" -d "channel=${SendToId}" -d "text=${Message}" "as_user=${As_User}" -d "username=${BotName}" "https://slack.com/api/chat.postMessage" -o /dev/null -w '%{http_code}\n' -s`
 ErrorCheckHTTP "$http_status"
 if [ $? -eq 0 ]
 then
  ErrorCheckAPI "$http_status"
  return $?
 else
  return $Error_HTTP
 fi
}


# I needed this function to judge whether message has sent correctly.
function send {
 if [ $# -eq 0 ] || [ $# -gt 2 ]
 then
  echo $Text_NotProperArguments
  return $Error_NotProperArguments
 fi

 send_main $@
 case $? in
  0 ) echo $SendSuccess;return 0;;
  $Error_HTTP ) echo $SendFailed;return $Error_HTTP;;
  $Error_API ) echo $SendFailed;return $Error_API;;
 esac
}
