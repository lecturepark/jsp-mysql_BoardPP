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
<title>게시판 글읽기</title>
<link rel="stylesheet" href="common.css">
</head>
<body> 
<h1>글번호 ㅣ 제목 ㅣ 글내용 ㅣ 작성자id</h1>
<img src="hoya.jpg" alt="고양이" id=cat><br>
<%
	String readNum = request.getParameter("num");	//url get방식으로 읽을 글 번호를 받아서 변수 저장.

	try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/BoardBoard", "root", "admin");
		Statement st = con.createStatement();
		ResultSet rs = st.executeQuery("select * from cat_board where num="+readNum);	//sql문 조합.
		rs.next();
		String num = rs.getString("num");
		String title = rs.getString("title");
		String content = rs.getString("content");
		String id = rs.getString("id");
		int hit = rs.getInt("hit");
		String sql = "update cat_board set hit = hit+1 where num="+readNum;
		int resultcount = st.executeUpdate(sql);
%>
	
글번호:<%=num %><br>
글제목:<%=title %><br>
작성자id:<%=id %><br>
글내용:<%=content %> <br>
조회수:<%=hit %>	<br>
<%
		
	} catch (Exception e) {		
		e.printStackTrace();
	}	
%>
<a href="delproc.jsp?num=<%=readNum%>">글 삭제</a>
<a href="modify.jsp?num=<%=readNum%>">글 수정</a>
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