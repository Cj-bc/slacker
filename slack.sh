# Written by Cj in y-modify
#usege: 
#slack set token <token_code> ---> set token
#

source ./func/settingfunc.sh

#test wheather slacker was set up or not.
if [ `find slackersettings.txt` -ne "slackersettings.txt" ]
 if [ $# -ne 0 ]
  echo "you need to setup your slacker first."
  setting first      #this is in settingfunc.sh file.
 fi
fi 
 
