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
<img src="windowdog.jpg" alt="쓸모없는강아지" id=cat><br>
<div align="left" style="width:70%; height: 100%; border: 10px solid pink; border-radius: 1em;">

<%if(myid==null){
	 %>
      <script>alert('게스트 로그인으로는 이용할 수 없습니다. 로그인을 해주세요');</script>
     <meta http-equiv="refresh" content="0;url=list.jsp?Page=1"><br>
    <%
}else{
	
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
  </table>
  <table class="type11">
 <thead>
  <tr>
    <th scope="cols"><%=myid%></th>
    <th scope="cols"><%=mytel%></th>
    <th scope="cols"><%=mygender%></th>
    <th scope="cols"><%=myhobby%></th>
  </tr>
  </thead>
</table>

<%
		
	} catch (Exception e) {		
		e.printStackTrace();
	}
}


try {
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/BoardBoard", "root", "admin");
	Statement st = con.createStatement();
	ResultSet rs = st.executeQuery("select * from cat_board where id = '"+ myid+"' ");	//sql문 조합.
	rs.next();
	String num = rs.getString("num");
	String title = rs.getString("title");
	String content = rs.getString("content");
	String id = rs.getString("id");
	int hit = rs.getInt("hit");
	int recommend = rs.getInt("recommend");
	String datetime = rs.getString("adatetime");
%>
<hr>
<h2><%=myid%>의 작성글</h2>
<table class="type08">
  <thead>
  <tr>
    <th scope="cols">글번호|<%=num %>  </th>
    <th scope="cols">제목|<a href="read.jsp?num=<%=num%>"><%=title %></a></th>
    <th scope="cols">작성자id: <%=id %> </th>
    <th scope="cols">조회수|<%=hit %></th>
    <th scope="cols">추천수|<%=recommend %></th>
    <th scope="cols">작성시간|<%=datetime %></th>
  </tr>
  </thead>
  </table>
  
  <table class="type09">
  <tbody>
  <tr>
    <th scope="cols">글내용</th>
    <td><%=content %></td>
  </tr>
  </tbody>
</table>
<%
	
} catch (Exception e) {		
	e.printStackTrace();
}

%>


<br><br>
<a href="javascript:history.back();" style="color: red">←←←이전 페이지</a><br>
<a href="list.jsp?Page=1" style="color: red">글 리스트로 이동</a><br>
<a href="signedit.jsp" style="color: red">회원 수정</a><br>
</div>
</body>
</html>