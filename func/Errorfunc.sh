#
# slacker
#
# copyright (c) 2017Cj_bc
# 
# This software is released under MIT License.
# http://opensource.org/license/mit-license.php
#


function ErrorCheckAPI() {
# detect whether error hae happened
 if echo $1 | grep "\"ok\":false"
 then
  echo "API_Error: "`echo $1 | awk -F "[\{\":,\}]" ' {print $10} ' `
  return $Error_API 
 fi

 return 0 
}

function ErrorCheckHTTP() {
 case `echo $1 | tail -c 4` in
  200) return 0 ;;
  301) echo $HTTP_301 1>&2;;
  400) echo $HTTP_400 1>&2;;
  404) echo $HTTP_404 1>&2;;
  408) echo $HTTP_408 1>&2;;
  501) echo $HTTP_501 1>&2;;
  503) echo $HTTP_503 1>&2;;
  505) echo $HTTP_505 1>&2;;
 esac
  return $Error_HTTP 
}
