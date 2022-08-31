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
<div align="left" style="width:90%; height: 100%; border: 9.5px solid pink;">

<%
String myid =(String) session.getAttribute("id"); 
String readNum = request.getParameter("num");	//url get방식으로 읽을 글 번호를 받아서 변수 저장.
String nowPage =(String) session.getAttribute("Page");
if(myid==null){
	 %>
      <script>alert('게스트 로그인으로는 이용할 수 없습니다. 로그인을 해주세요');</script>
     <meta http-equiv="refresh" content="0;url=list.jsp?Page=1"><br>
    <%
}else{


	
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
		int recommend = rs.getInt("recommend");
		String datetime = rs.getString("adatetime");
		String sql = "update cat_board set hit = hit+1 where num="+readNum;
		int resultcount = st.executeUpdate(sql);
		
%>

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
  <thead>
  <tbody>
  <tr>
    <th scope="cols">글내용</th>
    <td><%=content %></td>
  </tr>
  </tbody>
  </thead>
</table>

<%
		
	} catch (Exception e) {		
		e.printStackTrace();
	}	
}
%>
<br><br>



</div>
<div align="left" style="width:92%; height: 100%; background-color: pink">
<a href="list.jsp?Page=<%=nowPage%>">글 리스트로 이동</a><br>
<a href="recommendup.jsp?num=<%=readNum%>">추천</a>
<a href="recommenddown.jsp?num=<%=readNum%>">비추</a>
<a href="delproc.jsp?num=<%=readNum%>" onclick="alert('글을 삭제합니다😥')">글 삭제</a><br>
<a href="modify.jsp?num=<%=readNum%>">글 수정</a><br>
</div>
</body>
</html>