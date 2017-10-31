
# we'll get user and channel ID using this.
source ./func/AnalyzeId.sh
source ./.slackerconf

function send {

# if channel is required ,set channel
 if [ $1 -eq \#* ]
 then
  ChannelId=`GetChannelId $1`
  shift
 else
  ChannelId=`GetChannelId ${Channel}`
 fi


