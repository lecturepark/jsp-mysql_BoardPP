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
<title>로그인 성공 유무</title>
<link rel="stylesheet" href="common2.css">
</head>
<body>

<%
	String id = request.getParameter("id");
	session.setAttribute("id",id);
	String pw = request.getParameter("pw");
	

	Connection con = null;
	Statement stmt = null;
	ResultSet rs = null;
	System.out.println("id: "+id);
	System.out.println("pw: "+pw);
	
	try {	
		Class.forName("com.mysql.cj.jdbc.Driver");
		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/BoardBoard", "root", "admin");		
		System.out.println("spl 접속 성공");
		stmt=con.createStatement();
		
		rs = stmt.executeQuery("SELECT * FROM signin where id='"+id+"'");
		rs.next();
		String pwTemp = rs.getString("pw");
		
		String tel = rs.getString("tel");
		session.setAttribute("tel",tel);
		
		String gender = rs.getString("gender");
		session.setAttribute("gender",gender);
		
		String hobby = rs.getString("hobby");
		session.setAttribute("hobby",hobby);
		
		System.out.println("tel: "+tel);
		System.out.println("gender: "+gender);
		System.out.println("hobby: "+hobby);
		System.out.println("pwTemp: "+pwTemp);
		if(pw.equals(pwTemp)){
			System.out.println("로그인 성공");
			response.sendRedirect("index.jsp");
		} else {
			System.out.println("로그인 실패");
		}

		rs.close();
		stmt.close();
		con.close();
		
	} catch (SQLException e){	
		System.out.println("sql 익셉션:"+e);
	} catch (Exception e) {	
		System.out.println("익셉션:"+e);
	}	
%>

	           <script>alert('로그인 실패 다시 입력해주세요');</script>
	       <meta http-equiv="refresh" content="0;url=index.html?">
<%// <a href="index.html">로그인 실패 다시 입력해주세요</a>%>
</body>
</html>