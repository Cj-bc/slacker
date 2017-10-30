# Written by Cj in y-modify
#usege: 
#slack set token <token_code> ---> set token

source ./func/settingfunc.sh

#test wheather initializing is in need
if [ $1 -eq "init" ] || [ -f .basicconf ] && [ $# -ne 0 ]
then
 echo "you need to setup your slacker first."
 setting first      #this is in settingfunc.sh file.
fi 
 
