<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>정보</title>
</head>
<body>
	<h1>정보</h1>
	<form name = "frm" action = "update" method = "post" enctype = "multipart/form-data">
		<input type = "hidden" name = "pCode" value = "${vo.pCode }"/>
		<input type = "hidden" name = "image" value = "${vo.image }"/>
		<table border = 1>
			<tr>
				<td width = 100>이름</td>
				<td width = 200><input type = "text" name = "pName" value = "${vo.pName }"/></td>
			</tr>
			<tr>
				<td width = 100>가격</td>
				<td width = 200><input type = "text" name = "price" value = "${vo.price }"/></td>
			</tr>
			<tr>
				<td width = 100>이미지</td>
				<td width = 200>
					<input type = "file" name = "file">
					<c:if test = "${vo.image != null }">
						<img src = "display?fileName=${vo.image }" width = 150 height = 150 id = "image">
					</c:if>
					<c:if test = "${vo.image == null }">
						<img src = "http://placehold.it/150x150" width = 150 height = 150 id = "image">
					</c:if>
				</td>
			</tr>
			<tr>
				<td width = 100><input type = "button" id = "btnImage" value = "첨부이미지"></td>
				<td width = 350>
				<input type = "file" name = "files" multiple>
					<div id = "listFile">
						<c:forEach items = "${images }" var = "image">
							<img src = "display?fileName=attach/${image }" width = 100 height = 100>
						</c:forEach>
					</div>
				</td>
			</tr>
		</table>
		<input type = "submit" value = "저장"/>
		<input type = "button" value = "삭제" id = "btnDelete"/>
	</form>
</body>
<script>
	$("#btnDelete").on("click", function() {
		if (!confirm("삭제?")) {
			return;
		} else {
			frm.action = "delete";
			frm.method = "post";
			frm.submit();
		}
	});
	$(frm.file).hide();
	$(frm.files).hide();
	$("#btnImage").on("click", function() {
		$(frm.files).click();
	});
	$("#image").on("click", function() {
		$(frm.file).click();
	});
	$(frm.file).change(function() {
		var image = $(frm.file)[0].files[0];
		$("#image").attr("src", URL.createObjectURL(image));
	});
	$(frm.files).change(function() {
		var files = $(frm.files)[0].files;
		var image = "";
		$.each(files, function(index, file) {
			image += "<img src = '" + URL.createObjectURL(file) + "' width = 100 height = 100>";
		});
		$("#listFile").html(image);
	});
	$(frm).submit(function(e) {
		e.preventDefault();
		if (!confirm("저장?")) {
			return;
		} else {
			frm.submit();
		}
	});
</script>
</html>