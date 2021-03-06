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
	<table border = 1 id = "tbl"></table>
	<script id = "temp" type = "text/x-hanlebars-template">
			<tr>
				<td>출발지</td>
				<td>도착지</td>
				<td>소요시간</td>
				<td>일반가격</td>
				<td>우등가격</td>
				<td>심야가격</td>
				<td>심야우등가격</td>
				<td>스케줄</td>
				<td>야간스케줄</td>
			</tr>
			{{#each station}}
			<tr>
				<td>{{startTerminal}}</td>
				<td>{{destTerminal}}</td>
				<td>{{wasteTime}}</td>
				<td>{{normalFare}}</td>
				<td>{{specialFare}}</td>
				<td>{{nightFare}}</td>
				<td>{{nightSpecialFare}}</td>
				<td>{{schedule}}</td>
				<td>{{nightSchedule}}</td>
			</tr>
			{{/each}}
	</script>
</body>
<script>
	getList();
	function getList() {
		$.ajax({
			type : "get",
			url : "https://api.odsay.com/v1/api/expressServiceTime",
			data : {"apiKey" : "8Tj88enDcyqL5r+I/IjRCvJwuUFke/uYRZmzXD5oiyw", "lang" : "0", "startStationID" : "4000057", "endStationID" : "4000030"},
			dataType : "json",
			success : function(data) {
				var temp = Handlebars.compile($("#temp").html());
				$("#tbl").html(temp(data));
			}
		});
	}
</script>
</html>