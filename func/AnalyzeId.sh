#
# slacker
#
# copyright (c) 2017Cj_bc
# 
# This software is released under MIT License.
# http://opensource.org/license/mit-license.php
#


##############
# making
##############
#
# Using files
#  * .basicconf
#  * texts/FunctionsTexts.sh
#  * texts/URLs.sh
#  * texts/Error_Codes.sh


function GetUserId {

 UserName=$1


#
# 1.Get all userData
# 2.Use awk to collect needed datas(UserId and username)
# 3.Check whether designated name is in the user list
# 4.Select needed UserId and name,Then return the Id
#

# 1. -o option output the response
 curl -d "token=${Token}" -o .data $UserListURL
# 2. 
 awk -v username=$UserName -F "\"" ' /"id"/ { print $4 } /"name"/ { print $4;if ( $4 == username ) exit } ' ./.data > .data  
# 3.
 if cat .data | grep ${UserName}
 then
  :
 else
  echo $NoExistUserName 1>&2
  return $Error_NoExistUsrName
 fi 
#4. remove .date file finally for security
 echo `tail -n 2 .data | head -n 1`
 rm .data

}




#
# GetImId is almost the same as GetUserId
#
function GetImId {

 UserId=$1

#
# User should be correct because only system call this function 
#
# 1.Get all userData
# 2.Use awk to collect needed datas(ImId and UserId)
# 3.Check whether designated id is in the userid list.If not, open a new im
# 4.Select needed ImId and UserId,Then return the ImId
#



# 1. -o option output the response
 curl -d "token=${Token}" -o .data $ImListURL
# 2. 
 awk -v userid=$UserId -F "\"" ' /"id"/ { print $4 } /"user"/ { print $4;if ( $4 == userid ) exit } ' ./.data > .data  
# 3.
 if cat .data | grep ${UserId}
 then
  :
 else
  curl -d "token=${Token}" -d "user=${UserId}" -d "include_locale=true" -o .data $ImOpenURL
  awk -F "\"" ' /"id"/ { print $4 } /"user"/ { print $4 } ' ./.data > .data
 fi 
#4. remove .date file finally for security
 echo `tail -n 2 .data | head -n 1`
 rm .data

}


function GetChannelId {                                                                            

 case $1 in
  "user:"* )
  * )  ChannelName=$1
 esac 

}
 


