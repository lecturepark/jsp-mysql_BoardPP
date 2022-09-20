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
<title>글 수정</title>
<link rel="stylesheet" href="common2.css">
</head>
<body> 
<div align="left" style="width:70%; height: 500px; border: 10px solid PURPLE; border-radius: 1em;">

<%
	String editNum = request.getParameter("num");
	String title = null;
	String content = null;
	String id = null;
	try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/BoardBoard", "root", "admin");
		Statement st = con.createStatement();
		String sql = "select * from cat_board where num="+editNum;
		System.out.println("==== 전송하려는 sql:" + sql);		
		ResultSet rs = st.executeQuery(sql);	// 글수정 sql 전송
		rs.next(); //글 하나 꺼내서 작업대에 올리기.
		title = rs.getString("title");
		content = rs.getString("content");
		id = rs.getString("id");
		
	} catch (Exception e) {		
		e.printStackTrace();
	}
%>

<h2>글번호:<%=editNum %> 을(를)수정합니다</h2><br>

<form action="modifyproc.jsp" method="get">
<input name="num" type="hidden" value=<%=editNum %>>
<h4>글제목:<input type="text" style= width:300px; class="form-control" value=<%=title %> name="title" maxlength="100"></h4><br>
<h4>글작성자id:<input type="text" style= width:300px; class="form-control" value=<%=id %> name="id" maxlength="100"></h4><br>
<h4>글내용:<textarea class="form-control" style=" height : 150px; width:98%;"  name="content" maxlength="100" ><%=content %></textarea></h4><br><br>
</div>
<input type="submit" value="수정완료하기"><br>


</body>
</html>