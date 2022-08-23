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
<title>글 리스트</title>
<link rel="stylesheet" href="common.css">
</head>
<body> 
<h1>글 리스트</h1>
<h2>글번호 ㅣ 제목 ㅣ 글내용 ㅣ 작성자id | 조회수</h2>
<hr>
<%
	try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/BoardBoard", "root", "admin");
		Statement st = con.createStatement();
		ResultSet rs= st.executeQuery("select * from cat_board");
		while(rs.next()){
			String num = rs.getString("num");
			String title = rs.getString("title");
			String content = rs.getString("content");
			String id = rs.getString("id");
			int hit = rs.getInt("hit");
			
%>			
		<%="|" %><%=num %><a href="read.jsp?num=<%=num%>"><%="|" %><%=title %><%="|" %></a><%=content %><%="|" %><%=id %><%="|" %><%=hit %>	<br>
<%
		}
	} catch (Exception e) {		
		e.printStackTrace();
	}	
%>
<a href="write.jsp">글쓰기</a><br>
<a href="index.jsp">메인 화면 이동</a><br>
<img src="cat.jpg" style="transform: scaleX(-1)"> <br>
<img src="cat.jpg"> <br>



<%-- 
<%
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	

	Connection con = null;
	Statement stmt = null;
	ResultSet rs = null;
	System.out.println("id: "+id);
	System.out.println("pw: "+pw);
	try {	
		Class.forName("com.mysql.cj.jdbc.Driver");
		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/BoardBoard", "root", "admin");		
		System.out.println("성공");
		stmt=con.createStatement();
		
		rs = stmt.executeQuery("SELECT * FROM asd where id='"+id+"'");
		rs.next();
		String pwTemp = rs.getString("pw");
		System.out.println("pwTemp: "+pwTemp);
		
		if(pw.equals(pwTemp)){
			System.out.println("로그인 성공");
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
--%>
</body>
</html>