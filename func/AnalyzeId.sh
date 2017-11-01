
##############
# making
##############



function GetChannelId {

 case $1 in
  "user:"* ) 
 ChannelName=$1
 

}


function GetUserId {

 UserName=$1


#
# 1.Get all userData
# 2.Grep that file to get id of $UserName
# 3.Return the UserId
#

# 1.
 curl -d "token=${Token}" -o .data "https://slack.com/api/users.list"
# 2.
 grep 

}