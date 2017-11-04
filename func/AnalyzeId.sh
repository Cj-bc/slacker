
##############
# making
##############
#
# Using files
#  * .basicconf
#  * texts/FunctionsTexts.sh
#  * texts/URLs.sh
#  * texts/Error_Codes.sh

function GetChannelId {

 case $1 in
  "user:"* ) 
 ChannelName=$1
 

}


function GetUserId {

 UserName=$1


#
# 1.Get all userData
# 2.Use awk to collect needed datas(UserId and username)
# 3.Check whether designated name is in the user list
# 4.Select needed UserId and name
# 5.Return the UserId
#

# 1. -o option output the response
 curl -d "token=${Token}" -o .data $UserListURL
# 2. 
 awk -v username=$UserName -F "\"" ' /"id"/ { print $4 } /"name"/ { print $4;if ( $4 == username ) exit } ' ./.data > .data  
# 3.
 if `cat .data`| grep ${UserName}
 then
  :
 else
  echo $NoExistUserName
  exit $Error_NoExistUsrName
 fi 
}
