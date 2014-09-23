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
select(handler.dom, "div.comment").forEach (element) ->
  console.log(element.children[0].raw.replace(/\s/g, " "))
