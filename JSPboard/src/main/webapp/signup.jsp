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
<title>회원가입성공</title>
<link rel="stylesheet" href="common2.css">
</head>
<body> 

<%
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String repw = request.getParameter("repw");
	try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/BoardBoard", "root", "admin");
		if(pw.equals(repw)){
		Statement st = con.createStatement();
		int resultCount = st.executeUpdate("insert into signin values('"+id+"','"+pw+"')");
		}else{
		%>
			<script>
			alert("비밀번호 불일치!");
			</script>
		<%
		%>
		 <meta http-equiv="refresh" content="0;url=signup.html?">
		 <%
		}
		
	} catch (Exception e) {		
		e.printStackTrace();
	}	
%>

<h1>회원가입에 성공했습니다</h1>
<h2>회원가입한 아이디로 다시 로그인해주세요</h2>
<a href="index.html">로그인 페이지로 이동</a>
</body>
</html>