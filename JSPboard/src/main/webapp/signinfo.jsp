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
<title>회원정보 확인</title>
<link rel="stylesheet" href="common2.css">
</head>
<body> 
<% String myid =(String) session.getAttribute("id"); %>
<% String mytel =(String) session.getAttribute("tel"); %>
<% String mygender =(String) session.getAttribute("gender"); %>
<% String myhobby =(String) session.getAttribute("hobby"); %>
<img src="hoya.jpg" alt="고양이" id=cat><br>
<div align="left" style="width:90%; height: 100%; border: 10px solid pink; border-radius: 1em;">

<%
	try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/BoardBoard", "root", "admin");
		Statement st = con.createStatement();
		ResultSet rs = st.executeQuery("select * from signin where id = '"+ myid+"' ");	//sql문 조합.
		rs.next();
		String id = request.getParameter("id");
		String tel = request.getParameter("tel");
		String gender = request.getParameter("gender");
		String hobby = request.getParameter("hobby");
		
%>

	<table class="type08">
  <thead>
  <tr>
    <th scope="cols">아이디</th>
    <th scope="cols">전화번호</th>
    <th scope="cols">성별</th>
    <th scope="cols">취미</th>
  </tr>
  </thead>
 <tbody>
  <tr>
    <th scope="cols"><%=myid%></th>
    <th scope="cols"><%=mytel%></th>
    <th scope="cols"><%=mygender%></th>
    <th scope="cols"><%=myhobby%></th>
  </tr>
  </tbody>
</table>
  

<%
		
	} catch (Exception e) {		
		e.printStackTrace();
	}	
%>
<br><br>
<a href="list.jsp?Page=1">글 리스트로 이동</a><br>
<a href="signedit.jsp">회원 수정</a><br>
</div>
</body>
</html>