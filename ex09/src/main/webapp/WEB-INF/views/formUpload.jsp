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
	<h1>form업로드</h1>
	<form name = "frm" action = "formUpload" method = "post" enctype = "multipart/form-data">
		<input type = "file" name = "file">
		<input type = "submit" value = "업로드">
	</form>
</body>
</html>