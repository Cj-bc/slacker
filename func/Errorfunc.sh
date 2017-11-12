#
# slacker
#
# copyright (c) 2017Cj_bc
# 
# This software is released under MIT License.
# http://opensource.org/license/mit-license.php
#


function ErrorCheckAPI() {

# detect whether error has happened
 if grep "\"ok\": false" .response
 then
  echo "API_Error: "
  awk -F "\"" ' /"error"/ { print $4 }  ' .response | echo; echo"\n"
  rm .response
  return $Error_API 
 fi

 return 0 
}

function ErrorCheckHTTP() {

 
}
