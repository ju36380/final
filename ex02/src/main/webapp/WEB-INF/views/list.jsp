<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<link rel = "stylesheet" href = "../resources/home.css">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>주소 목록</title>
	</head>
	<body>
		<h1>[주소 목록]</h1>
		<table border = 1>
		<tr class = "title">
			<td width = 100>번호</td>
			<td width = 100>이름</td>
			<td width = 200>전화번호</td>
			<td width = 100>주소</td>
		</tr>
			<c:forEach items = "${list }" var = "vo">
				<tr class = "row">
					<td>${vo.ano }</td>
					<td><a href = 'read?ano=${vo.ano }'>${vo.name }</a></td>
					<td>${vo.tel }</td>
					<td>${vo.address }</td>
				</tr>
			</c:forEach>
		</table>
		<input type = "button" value = "등록" onClick = "location.href='insert'">
	</body>
</html>