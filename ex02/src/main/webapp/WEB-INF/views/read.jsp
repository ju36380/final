<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>주소 등록</title>
</head>
<body>
	<h1>[주소 조회 및 수정]</h1>
	<form action = "update" method = "post" name = "frm">
		<table border =1>
			<tr>
				<td>이름</td>
				<td><input type = "text" name = "name" value = ${vo.name }></td>
			</tr>
			<tr>
				<td>전화번호</td>
				<td><input type = "text" name = "tel" value = ${vo.tel }></td>
			</tr>
			<tr>
				<td>주소</td>
				<td><input type = "text" name = "address" value = ${vo.address }></td>
			</tr>
		</table>
		<input type = "hidden" name = "ano" value = ${vo.ano }>
		<input type = "submit" value = "저장">
		<input type = "button" value = "삭제" id = "btnDelete">
		<input type = "button" value = "목록" onClick = "location.href='list'">
	</form>
</body>
<script src = "../resources/check.js"></script>
<script>
	$("#btnDelete").on("click", function(){
		if (!confirm("삭제?")) {
			return;
		} else {
			location.href = 'delete?ano=${vo.ano}'
		}
	});
</script>
</html>