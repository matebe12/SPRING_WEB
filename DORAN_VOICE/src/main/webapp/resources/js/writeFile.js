/**
 * 
 */

function doFindWrite() {
	alert("uploadtest");

    var formDatall = $('#write').serialize();
    
    var query= {category : $('#id').val(), title : $('#title').val(), writer : $('#writer').val(), content : $('#content').val(), filename : $('#filename').val()};
    var formData = new FormData();

	var inputFile = $("input[name='uploadFile']");

	var files = inputFile[0].files;

	console.log(files);
	alert("uploadtest1");
	for (var i = 0; i < files.length; i++) {
		formData.append("uploadFile", files[i]);
	}
	alert("uploadtest2");
	$.ajax({
		url : '/uploadAjaxAction',
		processData : false,
		contentType : false,
		data : formData,
		type : 'POST',
		success : function(data) {			
			alert("업로드맨");
			$.ajax({
				url : "actingwritepro",
				type : "POST",
				data : formDatall,
				success : function(data) {
					console.log(data);
					alert(data + "성공");
					self.location="/individual";
				},
				error : function() {
					alert("err");
				}
			}); // ajax
		},error : function(){
			alert("안됨");
		}
	});// ajax


}

