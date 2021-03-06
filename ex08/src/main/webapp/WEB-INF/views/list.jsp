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
<title>목록</title>
</head>
<body>
	<h1>계좌 목록</h1>
	<table border = 1>
		<tr>
			<td width = 100>코드</td>
			<td width = 100>이름</td>
			<td width = 200>개설일</td>
			<td width = 100>잔액</td>
			<td width = 70>내역</td>
		</tr>
		<c:forEach items = "${list }" var = "vo">
			<tr>
				<td>${vo.ano }</td>
				<td>${vo.name }</td>
				<td><fmt:formatDate value = "${vo.openDate }" pattern = "yyyy-MM-dd HH:mm:ss"/></td>
				<td><fmt:formatNumber value = "${vo.balance }" pattern = "#,###원"/></td>
				<td><button onClick = "location.href='read?ano=${vo.ano}'">내역</button></td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>