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
<title>게시판</title>
</head>
<body>
	<h1>게시글</h1>
	검색 수 : ${maker.totalCount }
	<form action = "list" name = "frm" method = "get">
		<input type = "hidden" name = "page" value = 1>
		<select name = "searchType">
			<option value = "title" <c:out value = "${maker.cri.searchType == 'title' ? selected : '' }"/> >제목</option>
			<option value = "content" <c:out value = "${maker.cri.searchType == 'content' ? selected : '' }"/> >내용</option>
			<option value = "writer" <c:out value = "${maker.cri.searchType == 'writer' ? selected : '' }"/> >작성자</option>
		</select>
		<input type = "text" name = "keyword" value = "${maker.cri.keyword }">
		<input type = "submit" id = "btnSearch" value = "검색">
	</form>
	<table border = 1>
		<tr class = "title">
			<td>no.</td>
			<td>제목</td>
			<td>작성자</td>
			<td>내용</td>
			<td>게시일자</td>
			<td>정보</td>
		</tr>
		<c:forEach items = "${list }" var = "vo">
			<tr class = "row">
				<td>${vo.bno }</td>
				<td>${vo.title }</td>
				<td>${vo.writer }</td>
				<td>${vo.content }</td>
				<td><fmt:formatDate value = "${vo.regdate }" pattern = "yyyy-MM-dd HH:mm:ss"/></td>
				<td><button onClick = "location.href='read?bno=${vo.bno}'">이동</button></td>
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
	$("#pagination a").on("click", function(e) {
		e.preventDefault();
		$(frm.page).val($(this).attr("href"));
		frm.submit();
	});
	
	$(frm.searchType).keydown(function(key){
		frm.submit();
	});
</script>
</html>