<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그아웃 처리</title>
</head>
<body>

<%
session.invalidate();//세션의 모든 속성 제거
response.sendRedirect("index.html");
%>

</body>
</html>
