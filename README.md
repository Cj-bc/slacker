# slacker  
 A commandline based Slack tool.(Just to send messages)
 slacker allows you to send messeges without being away from terminal.
 slacker just send messages.Not get any messages.
 
# feature  
 * you don't have to use your mouse or trackpad to select slack app!
 * Notifications? Please get them from your slack app ;)

# infomations of making  
 I'll write blog about making slacker on <http://blog.y-modify.org>
  * *English*
  * *Japanese*
 will be supported

# in_prgress
 * slacker.sh
 * settingfunc.setup()
 * settingfunc.setting_channel()
 * settingfunc.setting_user()
 * sendfunc.send()
  * curl option to get http status code
 * AnalyzeId.GetChannelId()
 * AnalyzeId.GetUserId()

# ToDos  
 * make the core part
 * get user id and IM id to send DM
  * user.list & im.list methots
 * open slack app when slacker is called with -o option or sonething like that.
 * automatically get a token   -> someday
 * Get http status code
# problems I have  
 * What's the best grammer ??
  ```shellscript:examples I'm thinking
       slacker set <arg> <values>
       slacker -c <channel>
       slacker <messages>
  ```
 * how about alias ??
