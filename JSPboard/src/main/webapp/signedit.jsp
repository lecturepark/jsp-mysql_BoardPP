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
<title>회원 수정</title>
<link rel="stylesheet" href="common.css">
</head>
<body> 
<div align="left" style="width:70%; height: 500px; border: 10px solid pink; border-radius: 1em;">
<% String myid =(String) session.getAttribute("id"); %>
<% String mytel =(String) session.getAttribute("tel"); %>
<% String mygender =(String) session.getAttribute("gender"); %>
<% String myhobby =(String) session.getAttribute("hobby"); %>
<%
	String tel = null;
	String gender = null;
	String hobby = null;
	try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/BoardBoard", "root", "admin");
		Statement st = con.createStatement();
		String sql = "select * from signin where id = '"+ myid+"' ";
		System.out.println("==== 전송하려는 sql:" + sql);		
		ResultSet rs = st.executeQuery(sql);	// 글수정 sql 전송
		rs.next(); //글 하나 꺼내서 작업대에 올리기.
		tel = rs.getString("tel");
		gender = rs.getString("gender");
		hobby = rs.getString("hobby");
		
	} catch (Exception e) {		
		e.printStackTrace();
	}
%>

<h2>글번호:<%=myid %> 을(를)수정합니다</h2><br>

<form action="signeditproc.jsp" method="get">
<input name="id" type="hidden" value=<%=myid %>>
<h4>전화번호:<input type="text" style= width:300px; class="form-control" placeholder=<%=tel %> name="tel" maxlength="100"></h4><br>
<input type="radio" name="gender" value="남">남
	<input type="radio" name="gender" value="여">여<br>
<h4>취미:<input type="text" style= width:300px; class="form-control" placeholder=<%=hobby %> name="hobby" maxlength="100"></h4><br>
</div>
<input type="submit" value="수정완료하기"><br>


</body>
</html>