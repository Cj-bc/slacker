日本語版はこちら : <https://github.com/Cj-bc/slacker/blob/master/README_JP.md>

# slacker  
 A commandline based Slack tool.(Just to send messages)  
 slacker allows you to send messeges without being away from terminal.  
 slacker just send messages.Not get any messages.
 
# feature  
 * you're now free from your mouse and trackpad to use slack app!
 * Notifications? Please get them from your slack app ;)
 * Now, it supports pipe command (Add:2017/11/11)  
 * Developing environment is macOS Sierra10.12.6(2017/11/11)
# infomations of making  
 I'll write blog about making slacker on <http://blog.y-modify.org>
  * *English*
  * *Japanese*  
 will be supported

# Needed permitions
 * channels:read
 * channels:write
 * im:write
 * users:read
 * users:write

# LICENSE
 This software is released under MIT License,see `LICENSE`

# in_prgress
 * ~~slacker.sh~~
 * ~~settingfunc.setup()~~ (Just initialization)
 * ~~settingfunc.setting_channel()~~
 * ~~settingfunc.setting_user()~~
 * ~~sendfunc.send()~~
  * ~~curl option to get http status code~~
 * ~~AnalyzeId.GetChannelId()~~  
 * ~~AnalyzeId.GetUserId()~~
 * texts/Error_Codes.sh
 * ~~AnalyzeId.GetImId()~~
 * ~~usage() --Need to make~~
 * ~~errorsfunc.ErrorCheckAPI()~~ 
 * ~~errorsfunc.ErrorCheckHTTP()~~

# ToDos  
 * make the core part
  * ~~get user id and IM id to send DM~~
   * ~~user.list & im.list methots~~
  * automatically get a token   -> someday
  * ~~Get http status code~~
  * Deside Error codes
  * Use camelcase/snakecase
  * Need to know how to output errormessage directly to basic output(= commandline)
 * open slack app when slacker is called with -o option or sonething like that.
 * Japanese support

# problems I have  
 * What's the best grammer ??
  ```shellscript:examples I'm thinking
       slacker set <arg> <values>
       slacker -c <channel>
       slacker <messages>
  ```
 * how about alias ??
 * which is better to change user(or channel) selection or not when sendfunc.send() is called with arguments.

# Questions
 * Can i write ${$1:1} ?
    -- on sendfunc.send()
 * ~~Can i nest ``~~
