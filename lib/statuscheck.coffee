http = require 'http' 
urllib = require 'url'
# Expected inputs:
# url (REQUIRED)
# timeout (OPTIONAL: defaults to 10 seconds)

# Output:
# Check  status code for 200 and  then check the result for the http status of the URL. if there is an error
# then the result will be -1 and there will be another key for extradetail

# Example (Insert in URL): 
# coffee -e 'require("./lib/statuscheck.coffee").check {url: ""}, (cb) -> console.log cb '

check_url_status = (info, cb) ->
	if info.url != undefined
		if info.timeout != undefined
			timeout = info.timeout
		else
			timeout = 10000
		urlobject = urllib.parse(info.url)
		if urlobject.port != undefined 
			if urlobject.port != null
				port = urlobject.port
			else
				port = 80
		else
			port = 80
		requestOpts = {
			host: urlobject.host
			port: port,
			path: urlobject.path,
			method: 'HEAD'
		}
		hr = http.request requestOpts, (r) ->
			if r.statusCode == 200
				cb {meta: {status: 200, msg: 'Function process successfully'}, result: r.statusCode, extradetail: {headers: r.headers}}
			else
				cb {meta: {status: 200, msg: 'Function process successfully'}, result: r.statusCode, extradetail: {headers: r.headers}}
			r.destroy()

		hr.on 'error', (e) ->
			cb {meta: {status: 200, msg: 'Function process successfully'}, result: -1, extradetail: e}

		hr.end();
	else
		cb {meta: {code: 400, msg: 'Must specify a URL'}}

http_get_status = (info, cb) ->
	if info.url != undefined
		req = http.get info.url, (res) ->
			res.setEncoding()
			res.on 'data', (chunk) ->
				res.destroy();
				cb {meta: {code: 200, msg: 'OK'}, result: true, extradetail: {data: JSON.stringify(chunk), length: chunk.length}}
	else
		cb {meta: {code: 400, msg: 'Must specify a URL'}}

module.exports = {
	check: check_url_status,
	getcheck: http_get_status
}