request = require 'request' # Using request library feel free to write

# Expected inputs:
# url (REQUIRED)
# timeout (OPTIONAL: defaults to 10 seconds)

# Output:
# Check  status code for 200 and  then check the result for the http status of the URL. if there is an error
# then the result will be -1 and there will be another key for extradetail

check_url_status = (info, cb) ->
	if info.url != undefined
		if info.timeout != undefined
			timeout = info.timeout
		else
			timeout = 10000
		request {url: info.url, timeout: timeout}, (e, r, b) ->
			if not e
				if r.statusCode == 200
					cb {meta: {status: 200, msg: 'Function process successfully'}, result: r.statusCode}
				else
					cb {meta: {status: 200, msg: 'Function process successfully'}, result: r.statusCode}
			else
				cb {meta: {status: 200, msg: 'Function process successfully'}, result: -1, extradetail: e}	
	else
		cb {meta: {code: 400, msg: 'Must specify a URL'}}

module.exports = {
	check: check_url_status
}