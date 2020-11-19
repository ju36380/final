<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
	form{border : 1px solid black; width : 600px; height : 600px;}
</style>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ㅇㄹㄷ</title>
</head>
<body>
	<h1>ajax업로드</h1>
	<div id = "upload">
		<input type = "file" id = "file">
	</div>
	<hr>
	<div id = "uploaded">
		<ul id = "uploadedFiles"></ul>
	</div>
</body>
<script>
	$("#file").change(function(){
		var file = $("#file")[0].files[0];
		if (file == null) {
			return;
		} else {
			if (!confirm("업로드 ㄱ?")) {
				return;
			} else {
				var formData = new FormData();
				formData.append("file", file);
				$.ajax({
					type : "post",
					url : "/ajaxUpload",
					processData : false,
					contentType : false,
					data : formData,
					success : function(data) {
						alert(data + " 업로드 완료");
						var li = "<li class= 'file' value = '" + data + "'>";
						li += "<img src = /displayFile?fileName=" + data + " width = 100/>";
						li += "<input type = 'hidden' name = 'files' value = '" + data + "'>";
						li += "<a href='" + data;
						li += "'>삭제</a></li>";
						$("#uploadedFiles").append(li);
						fileName += data + " ";
					}
				});
			}
		}
	});
	$("#uploadedFiles").on("click", "a", function(e){
		e.preventDefault();
		var fileName = $(this).attr("href");
		if (!confirm("삭제 ㄱ?")) {
			return;
		} else {
			$(this).parent().remove();
			$.ajax({
				type : "post",
				url : "/ajaxDelete",
				data : {"fileName" : fileName},
				success : function() {
					alert("삭제 완료");
				}
			});
			$.ajax({
				
			});
		}
	});
</script>
</html>