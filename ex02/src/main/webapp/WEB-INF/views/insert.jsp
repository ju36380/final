<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel = "stylesheet" href = "../resources/home.css">
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>주소 등록</title>
</head>
<body>
	<h1>[주소 등록]</h1>
	<form action = "insert" method = "post" name = "frm">
		<table border =1>
			<tr class = "row">
				<td class = "title">이름</td>
				<td><input type = "text" name = "name"></td>
			</tr>
			<tr class = "row">
				<td class = "title">전화번호</td>
				<td><input type = "text" name = "tel"></td>
			</tr>
			<tr class = "row">
				<td class = "title">주소</td>
				<td><input type = "text" name = "address"></td>
			</tr>
		</table>
		<input type = "submit" value = "저장">
		<input type = "button" value = "목록" onClick = "location.href='list'">
	</form>
</body>
<script src = "../resources/check.js"></script>
</html>