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
<link rel = "stylesheet" href = "../resources/home.css">
<title>주소 목록</title>
</head>
<body>
	<h1>주소</h1>
	<h2>검색 수 : <fmt:formatNumber value = "${maker.totalCount }" pattern = "#,###"/></h2>
	<div id = "divSearch">
		<form action = "list" name = "frm" method = "get">
			<input type = "hidden" name = "page" value = 1>
			<select name = "searchType">
				<option value = "name" <c:out value = "${maker.cri.searchType == 'name' ? 'selected' : '' }"/> >이름</option>
				<option value = "tel" <c:out value = "${maker.cri.searchType == 'tel' ? 'selected' : '' }"/> >전화번호</option>
				<option value = "address" <c:out value = "${maker.cri.searchType == 'address' ? 'selected' : '' }"/> >주소</option>
			</select>
			<input type = "text" name = "keyword" value = "${maker.cri.keyword }">
			<select name = "perPageNum">
				<option value = "10" <c:out value = "${maker.cri.perPageNum == '10' ? 'selected' : '' }"/> >10</option>
				<option value = "20" <c:out value = "${maker.cri.perPageNum == '20' ? 'selected' : '' }"/> >20</option>
				<option value = "30" <c:out value = "${maker.cri.perPageNum == '30' ? 'selected' : '' }"/> >30</option>
			</select>
			<input type = "submit" value = "검색">
		</form>
	</div>
	<table border = 1>
		<tr>
			<td>no.</td>
			<td>이름</td>
			<td>전번</td>
			<td>주소</td>
		</tr>
		<c:forEach items = "${list }" var = "vo">
			<tr>
				<td>${vo.ano }</td>
				<td>${vo.name }</td>
				<td>${vo.tel }</td>
				<td>${vo.address }</td>
			</tr>
		</c:forEach>
	</table>
<button onClick = "location.href='insert'">글쓰기</button>
	<br>
	<div id = "pagination">
		<c:if test="${maker.prev }">
			<button onClick = "${maker.startPage-1}">←</button>
		</c:if>
		<c:forEach begin = "${maker.startPage }" end = "${maker.endPage }" var = "i">
			<c:if test = "${maker.cri.page == i }">
				<a href = "${i }" class = "active">[${i }]</a>
			</c:if>
			<c:if test = "${maker.cri.page != i }">
				<a href = "${i }">[${i }]</a>
			</c:if>
		</c:forEach>
		<c:if test="${maker.next }">
			<button onClick = "${maker.endPage+1}">→</button>
		</c:if>
	</div>
</body>
<script>
	var page = 1;
	$("#pagination a").on("click", function(e) {
		e.preventDefault();
		page = $(this).attr("href");
		$(frm.page).val(page);
		frm.submit();
	});
	$(frm.perPageNum).change(function(){
		$(frm.page).val(page);
		frm.submit();
	});
</script>
</html>