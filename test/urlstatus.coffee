vows = require 'vows'
assert = require 'assert'
urlstatuscheck = require('../lib/statuscheck.coffee').check
require 'shelljs/global'

vows.describe("URL Status API").addBatch({
	'Test HTTP HEAD request functionality': {
		topic: () ->
			result = ''
			result = exec('coffee bin/statuscheck.coffee "http://www.apple.com"').output.replace('\n','')
			return result
		'is working properly': (topic) -> assert.equal topic, '200'
	}
}).addBatch({
	'Test initial download HTTP GET request functionality': {
		topic: () ->
			result = ''
			result = exec('coffee bin/getstatuscheck.coffee "http://www.apple.com"').output.replace('\n','')
			return result
		'is working properly': (topic) -> assert.equal topic, 'true'
	}

}).export(module)
#urlstatuscheck.check {}