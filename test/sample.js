var vows = require('vows'), assert = require('assert');
checkurl = require("../lib/statuscheck.coffee").check 

vows.describe('Check statuscheck library').addBatch({
    "Check for a valid URL": {

        topic: function() {
            checkurl({url: "http://www.apple.com"}, this.callback);
        },
        "is returning the right response": function(callback) { console.log(callback.result); }
    }
}).export(module);
