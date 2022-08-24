<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.sql.Connection" %>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@ page errorPage="errorPage.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 작성</title>
<link rel="stylesheet" href="common2.css">
</head>
<body> 
<div align="left" style="width:70%; height: 500px; border: 10px solid pink; border-radius: 1em;">

<form action="writeproc.jsp" method="get">
글제목:<input type="text" class="form-control" placeholder="글제목" name="title" maxlength="100"><br>
글작성자id:<input type="text" class="form-control" placeholder="작성자id" name="id" maxlength="100"><br>
글내용:<textarea class="form-control" placeholder="내용을 입력하세요" name="title" maxlength="100" style=" height : 400px; width:700;"></textarea><br><br>
</div>
<input type="submit" value="글쓰기"><br>


</form>

</body>

</html>