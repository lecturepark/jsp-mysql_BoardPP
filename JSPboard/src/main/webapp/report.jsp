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
<title>์ ๊ณ ํ๊ธฐ</title>
<link rel="stylesheet" href="common2.css">
</head>
<body>
<%
String myid =(String) session.getAttribute("id");
String readNum = (String) session.getAttribute("num");
String nowPage =(String) session.getAttribute("Page");



%>

<script>alert('๐ฎโโ๏ธ๐ฎโโ๏ธํ์ฌ ๊ธ ์ ๊ณ ๋ฅผ ์งํํฉ๋๋ค๐ฎโโ๏ธ๐ฎโโ๏ธ');</script>
<h1>๐ฎโโ๏ธ์ ๊ณ ๋ฅผ ์งํํฉ๋๋ค๐ฎโโ๏ธ</h1>
<h2>๐ฎโโ๏ธ์ ๊ณ  ์ฌ์ ๋ฅผ ์๋ ฅํด์ฃผ์ธ์๐ฎโโ๏ธ</h2>

<form action= "reportproc.jsp" method="get">
			<fieldset>
				<legend>์ ๊ณ  ์ ์ํ๊ธฐ</legend>
				<label>์ ๊ณ  ์ฌ์ </label>
					<select name = "type">
						<option  value = "์์ค" >์์ค</option>
						<option  value = "๋ถ์ ์ ํ๋ด์ฉ">๋ถ์ ์ ํ๋ด์ฉ</option>
						<option  value = "ํ์ค๋ฐ์ธ">ํ์ค๋ฐ์ธ</option>
						<option  value = "๋ถ์ ์ ํ์ด๋ฆ">๋ถ์ ์ ํ์ด๋ฆ</option>
						<option  value = "๊ธฐํ">๊ธฐํ</option>
					</select>
				<label>๋ด์ฉ</label>
					<input type = "text" placeholder="์ ๊ณ  ์ฌ์ ๋ฅผ ๊ธฐ์ ํด ์ฃผ์ธ์" name = "reason">
					<input type = "submit" value = "๋ด์ฉ ์ ์">
			</fieldset>
		</form>
		<br>
<a href="read.jsp?num=<%=readNum %>"  onclick="alert('์ ๊ณ ๋ฅผ ๊ทธ๋ง๋์์ต๋๋ค๐')">๊ทธ๋ง๋๊ธฐ</a>
<br><br>
<img src="reportman.jpg" alt="ํฌ๋์ด" id=cat>
</body>
</html>