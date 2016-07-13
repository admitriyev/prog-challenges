/*Sample code to read in test cases:
var fs  = require("fs");
fs.readFileSync(process.argv[2]).toString().split('\n').forEach(function (line) {
    if (line != "") {
        //do something here
        //console.log(answer_line);
    }
});*/

var fs  = require("fs");
fs.readFileSync(process.argv[2]).toString().split('\n').forEach(function (line) {
    if (line != "") {
    	var answer_line = ''
        line.split(' ').map( 
        	function(timeSlot) {
        		t = timeSlot.split(':');
        		return new Date(2016, 1, 1, t[0], t[1], t[2]);
        	}
        ).sort( function(a,b) {
        	if (a > b) {
        		return -1;
        	} 
        	if (a < b) {
        		return 1;
        	} 
        	if (a === b) {
        		return 0;
        	} 
        }).map( function(t) {
        	a = t.toTimeString().split(' ')[0];
        	if (answer_line === '') {
        		answer_line = a;
        	} else {
        		answer_line = answer_line + ' ' + a;
        	}
        });
        console.log(answer_line);
    }
});