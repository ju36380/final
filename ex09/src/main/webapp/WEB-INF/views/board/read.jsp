<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel = "stylesheet" href = "../resources/home.css">
<title>글쓰기</title>
</head>
<body>
	<h1>글 정보</h1>
	<form name = "frm" action = "update" method = "post">
		<table border = 1>
			<tr class = "title">
				<td width = 100>제목</td>
				<td><input type = "text" name = "title" value = "${vo.title }"></td>
			</tr>
			<tr class = "title">
				<td width = 100>작성자</td>
				<td><input type = "text" name = "writer" value = "${vo.writer }"></td>
			</tr>
			<tr class = "title">
				<td width = 100>쓸 내용</td>
				<td width = 500><textarea rows = "10" cols = "30" name = "content">${vo.content }</textarea></td>
			</tr>
			<tr class = "title">
				<td width = 100>첨부</td>
				<td width = 500><input type = "file" name = "file" id = "file">
			</tr>
		</table>
		<input type = "submit" value = "저장">
		<input type = "button" value = "삭제" id = "btnDelete">
		<input type = "hidden" name = "bno" value = "${vo.bno }">
		<input type = "button" onClick = "location.href='list'" value = "목록으로"/>
		<hr>
	</form>
	<h1>첨부파일</h1>
	<div id = "uploaded">
		<ul id = "uploadedFiles"></ul>
	</div>
</body>
<script>
	var bno = "${vo.bno}";
	$("#btnDelete").on("click", function(){
		if (!confirm("삭제하시겠습니까?")) {
			return;
		} else {
			frm.action="delete";
			frm.submit();
		}
	});
	getAttach();
	function getAttach() {
		$.ajax({
			url : "attach.json",
			data : {"bno" : bno},
			success : function(data) {
				$(data).each(function(){
					var li = "<li>";
					li += "<img src = /displayFile?fileName=" + this + " width = 100/>";
					li += "<input type = 'hidden' name = 'files' value = '" + this + "'>";
					li += "<a href='" + this;
					li += "'>삭제</a></li>";
					$("#uploadedFiles").append(li);
				});
			}
		});
	}
	
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
		}
	});
</script>
</html>