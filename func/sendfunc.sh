
# we'll get user and channel ID using this.
# needed files
#     ./func/AnalyzeId.sh
#     ./.slackerconf

function send {

# if channel or user is required,set them
 case $1 in
  \#* ) setting_channel $1; shift
  @* ) setting_user $1; setting_channel ${UserId}; shift
 esac

# now, message should be in $1 because of shift command.
# we'll send it from here
# token is in another file
# channel is defined 'til the way come here.
# text is Passed message. It's in $1 now.
# as_user option is defined in .slackerconf
# username option is defined in .slackerconf
Message=$1


##############################################
# I'M editing below !!!
# thre's a lot of problems yet
# I need to get the http_status_code as value
##############################################



curl -XPOST -d "token=${Token}" -d "channel=${channel}" -d "text=${Message}" "as_user=${As_User}" -d "username=${BotName}" "https://slack.com/api/chat.postMessage" --fail
# --fail option tell curl to output errorcodes.

# Error check ( I'll change curl option --fail to -w '%{http_code}\n'
 case $? in
  200 ) echo "Message has sent correctly."
 esac   
}
