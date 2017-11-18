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
#     ./.slackerconf


function send_main {

 local http_status=0
#
# Set Id which slacker send messages to
# If username or channelname was passed,Get Id related to 
# If nothing was passed,Get selected Id in settingconf
#

 case $1 in
  \#* ) SendToId=`GetChannelId ${$1:1}` ; shift;;
  @* ) SendToId=`GetImId `GetUserId ${$1:1}``;shift;;  ### IT CAN'T WORK AT ALL.So I'll fix. ###
  * ) SendToId=$ChannelId;;
 esac

# now, message should be in $1 because of shift command.
# we'll send it from here
# token is in another file
# channel is defined 'til the way come here.
# text is Passed message. It's in $1 now.
# as_user option is defined in .slackerconf
# username option is defined in .slackerconf
 Message=$1


# get http status code with -w '%{http_code}\n' option.
# -s deny to show progress bar
 http_status=`curl -X POST -d "token=${Token}" -d "channel=${channel}" -d "text=${Message}" "as_user=${As_User}" -d "username=${BotName}" "https://slack.com/api/chat.postMessage" -o .response -w '%{http_code}\n' -s`

 ErrorCheckHTTP $http_status 
 if [ $? -eq 0 ]
 then
  ErrorCheckAPI
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

 send_main
 case $? in
  0) echo $SendSuccess;return 0;;
  $Error_HTTP ) echo $SendFailed;return $Error_HTTP;;
  $Error_API ) echo $SendFailed;return $Error_API;;
 esac
}
