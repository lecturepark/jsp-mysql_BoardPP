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
<title>회원삭제 동의 페이지</title>
<link rel="stylesheet" href="common2.css">
</head>
<body>
<%String myid =(String) session.getAttribute("id"); %>
<script>alert('<%=myid%>님의 회원삭제를 진행합니다😥');</script>
<h1>정말 회원정보를 삭제하시겠습니까?</h1>
<h2>삭제 되어도 게시글은 존재합니다</h2>
<a href="indexdleproc.jsp" >회원 삭제</a>
<a href="list.jsp?Page=1"  onclick="alert('<%=myid%>님 잘 생각하셨습니다😀')">그만두기</a>
<br>
<img src="sadcat.jpg" alt="슬픈고양이" id=cat>
</body>
</html>