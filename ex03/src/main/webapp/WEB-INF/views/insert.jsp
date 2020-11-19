<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel = "stylesheet" href = "../resources/home.css">
<title>글쓰기</title>
</head>
<body>
	<h1>글 등록</h1>
	<form name = "frm" action = "insert" method = "post">
		<table border = 1>
			<tr class = "title">
				<td width = 100>제목</td>
				<td><input type = "text" name = "title"></td>
			</tr>
			<tr class = "title">
				<td width = 100>작성자</td>
				<td><input type = "text" name = "writer" value = "guest"></td>
			</tr>
			<tr class = "title">
				<td width = 100>쓸 내용</td>
				<td width = 500><textarea rows = "10" cols = "30" name = "content"></textarea></td>
			</tr>
		</table>
		<input type = "submit" value = "저장">
	</form>
	<button onClick = "location.href='list'">목록으로</button>
</body>
<script src = "../resources/check.js"></script>
</html>