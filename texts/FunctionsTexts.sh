#Paths and URLs

#
# For settingfunc.sh
#
AnnounceToGetToken="you need to setup slacker first\nFrom here, \n${URL_GetToken}\nPlease get a token,and type it here.\nif you don't know how to do,this file will help you\n${GuideToGetToken}\n"
AnnounceToSetChannel="Please set default Channel(you can change anytime you want.\n Channel> "
AnnounceToSetUsername="\nPlease type yourname ( message will be send as \"yourname on CUI\" when as_user is false),or it'll be \"slackerbot\".\n( as_user default to true)"

#
# For AnalyzeId.sh
#

NoExistUserName="Sorry,But that user does not exist.Don't you make spell mistakes?\nPlease set username again.\n"
NoExistChannelName="Sorry,But that channel does not exist.Don't you make spell mistakes?\nPlease set channelname again.\n"



#
# For Errorsfunc.sh
#

HTTP_301="301 Moved Permanently\nAPI's URL seems to be changed.Please serch latest URL for the method,then replace older URL in text/URLs.sh.\n"
HTTP_400="400 Bad Request\nThe method could no longer exist.(I'm not sure.) please check whether the URL in text/URLs.sh is correct\n"
HTTP_404="404 Not Found\nThe method might no longer exist now.please check whether the URL in text/URLs.sh is correct.\n"
HTTP_408="408 Request Timeout\nPlease try again.\n"
HTTP_501="501 Not Implemented\nWas that gone away!? Serch for the same-work method.Please tell me later ;)\n"
HTTP_503="503 Service Unavaliable\nslack system itself seems to be downed.Please try later.\n"
HTTP_505="505 HTTP Version Not Supported\nPlease add curl option \"--http1.1\"or\"--http2\"which slack.com supports.\n"
SendSuccess="Your message has sent correctly.\n"
SendFailed="Failed to send message.\n"

