<%@ page import="java.sql.*" %>
<%@ page import="java.sql.Connection" %>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>신고하기</title>
<link rel="stylesheet" href="common2.css">
</head>
<body>
<%
String myid =(String) session.getAttribute("id");
String readNum = (String) session.getAttribute("num");
String nowPage =(String) session.getAttribute("Page");



%>

<script>alert('👮‍♂️👮‍♀️현재 글 신고를 진행합니다👮‍♂️👮‍♀️');</script>
<h1>👮‍♂️신고를 진행합니다👮‍♀️</h1>
<h2>👮‍♀️신고 사유를 입력해주세요👮‍♂️</h2>

<form action= "reportproc.jsp" method="get">
			<fieldset>
				<legend>신고 접수하기</legend>
				<label>신고 사유</label>
					<select name = "type">
						<option  value = "욕설" >욕설</option>
						<option  value = "부적절한내용">부적절한내용</option>
						<option  value = "혐오발언">혐오발언</option>
						<option  value = "부적절한이름">부적절한이름</option>
						<option  value = "기타">기타</option>
					</select>
				<label>내용</label>
					<input type = "text" placeholder="신고 사유를 기제해 주세요" name = "reason">
					<input type = "submit" value = "내용 접수">
			</fieldset>
		</form>
		<br>
<a href="read.jsp?num=<%=readNum %>"  onclick="alert('신고를 그만두었습니다😀')">그만두기</a>
<br><br>
<img src="reportman.jpg" alt="포돌이" id=cat>
</body>
</html>