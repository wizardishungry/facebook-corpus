facebook-corpus
==================

`coffee index.coffee ~/facebook-data/html/wall.htm `

or 
 `time coffee index.coffee ~/facebook-data/html/wall.htm | grep -v '^$' | sort | uniq | tee ~/Projects/ebooks/wizardis/corpus/facebook.txt`
