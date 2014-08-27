# Wrapper for URL Status Check to be able to do unit tests properly

urlstatuscheck = require("../lib/statuscheck.coffee").getcheck
if process.argv.length == 3
    find = ','
    re = new RegExp(find, 'g')
    theurl = process.argv[process.argv.length - 1]
    urlstatuscheck {url: theurl}, (cb) ->
        if cb.meta.status == 200
            console.log cb.result
        else
            console.log -1
else
    console.log 'invalid arguments'
