#!/bin/bash

source texts/FunctionsTexts.sh   #All texts are in here.

function setup {

 if [ $1 -eq "first" ]
 then
  echo $AnnounceToGetToken
  read Token
 fi

}
