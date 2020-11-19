<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
	#divTrade{width : 650px; border : 1px solid black; padding : 10px;}
</style>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>정보</title>
</head>
<body>
	<h1>정보</h1>
	<table border = 1>
		<tr>
			<td width = 100>계좌번호</td>
			<td width = 200>${vo.ano }</td>
		</tr>
		<tr>
			<td width = 100>이름</td>
			<td width = 200>${vo.name }</td>
		</tr>
		<tr>
			<td width = 100>개설일</td>
			<td width = 200><fmt:formatDate value = "${vo.openDate }" pattern = "yyyy-MM-dd HH:mm:ss"/></td>
		</tr>
		<tr>
			<td width = 100>잔액</td>
			<td width = 200 id = "balance"><fmt:formatNumber value = "${vo.balance }" pattern = "#,###원"/></td>
		</tr>
	</table>
	<div id = "divTrade">
		계좌번호 : 
		<select id = "tradeNo">
			<c:forEach items = "${list }" var = "v">
				<c:if test = "${v.ano != vo.ano }">
					<option value = "${v.ano }">${v.ano } : ${v.name }</option>		
				</c:if>		
			</c:forEach>
		</select>
		이체금액 : 
		<input type = "text" size = 5 id = "amount">원
		<button id = "btnSend">이체</button>
	</div>
	<table id = "tbl" border = 1></table>
	<script id = "temp" type = "text/x-handlebars-template">
		<tr>
			<td width = 100>거래대상</td>
			<td width = 100>입출금여부</td>
			<td width = 100>거래금액</td>
			<td width = 200>거래날짜</td>
		</tr>
		{{#each .}}
		<tr class = "row" style = "{{textColor type}}">
			<td>{{tradeNo}} : {{name}}</td>
			<td>{{type}}</td>
			<td>{{formatNumber amount}}</td>
			<td>{{tradeDate}}</td>
		</tr>
		{{/each}}
	</script>
	<button onClick = "location.href='list'">목록으로</button>
	<script>
		Handlebars.registerHelper("textColor", function(type){
			return type == "입금" ? "color:blue;" : "color:red";
		});
		Handlebars.registerHelper("formatNumber", function(amount){
			return amount;
		});
	</script>
</body>
<script>
	var ano = "${vo.ano}";
	$("#btnSend").on("click", function(){
		if (!confirm("이체?")) {
			return;
		} else {
			var tradeNo = $("#tradeNo").val();
			var amount = $("#amount").val();
			var balance = ${vo.balance};
			if (amount > balance) {
				alert("잔액 부족");
			} else {
				$.ajax({
					type : "post",
					url : "trade",
					data : {"ano" : ano, "type" : "출금", "tradeNo" : tradeNo, "amount" : amount},
					success : function() {
						alert("이체 완료");
						getList();
					}
				});
			}
		}
	});
	getList();
	function getList() {
		$.ajax({
			type : "get",
			url : "tradeList",
			dataType : "json",
			data : {"ano" : ano},
			success : function(data) {
				var temp = Handlebars.compile($("#temp").html());
				$("#tbl").html(temp(data));
				$.ajax({
					type : "get",
					url : "read.json",
					data : {"ano" : ano},
					dataType : "json",
					success : function(data) {
						$("#balance").html(data.balance + "원");
					}
				});
			}
		});
	}
</script>
</html>