/**
 * 공통 자바스크립트 
 */
$.ajaxSetup({
	  contentType : "application/json; charset=utf-8"
});

var cm = {};

cm.isEmpty = function(data){
	if(data == null || data == ''){
		return true;
	}else{
		return false;
	}
}

