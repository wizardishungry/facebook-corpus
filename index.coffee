fs = require 'fs'
select = require('soupselect').select
htmlparser = require("htmlparser")
debug = process.stderr

rawHtml = fs.readFileSync process.argv[2], { encoding: 'utf8' }

handler = new htmlparser.DefaultHandler((error, dom) ->
  if (error)
    debug.write "error\n"
    process.exit 1
)
parser = new htmlparser.Parser(handler)
parser.parseComplete(rawHtml)
data = []
select(handler.dom, "div.comment").forEach (element) ->
  txt = element.children[0].raw.replace(/\s/g, " ")
  txt = txt.replace "^ *", ''
  row = {
    "created_at": "Wed Oct 31 12:51:53 +0000 2012"
    "id": 999999999999999999
    "id_str": "999999999999999999"
    "text": txt
    "source": "Facebook lol"
    "truncated": false
    "in_reply_to_status_id": null
    "in_reply_to_status_id_str": null
    "in_reply_to_user_id": null
    "in_reply_to_user_id_str": null
    "in_reply_to_screen_name": null
    "user": {
      "id": 999999999
      "id_str": "999999999"
    }
    "geo": null
    "coordinates": null
    "place": null
    "contributors": null
    "retweet_count": 0
    "favorite_count": 0
    "favorited": false
    "retweeted": false
    "lang": "en"
  }
  data.push row if not /https?:\/\//.test(txt)

console.log(JSON.stringify(data))
