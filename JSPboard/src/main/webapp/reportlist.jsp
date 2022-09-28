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
<title>신고 글 목록</title>
<link rel="stylesheet" href="common2.css">
</head>
<body> 
<h1>신고 글 목록</h1>
<img src="readpo.jpg" alt="여몽펀치" id=cat><br>
<div align="left" style="width:90%; height: 100%; border: 9.5px solid pink;">

<%
String myid =(String) session.getAttribute("id"); 
String readNum = request.getParameter("num");	//url get방식으로 읽을 글 번호를 받아서 변수 저장.
session.setAttribute("num",readNum);
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
		ResultSet rs = st.executeQuery("select * from cat_board where (욕설 and 부적절한내용 and 혐오발언 and 부적절한이름 and 기타) LIKE '%_%'");	//sql문 조합.
		while(rs.next()){
			String num = rs.getString("num");
			String title = rs.getString("title");
			String content = rs.getString("content");
			String id = rs.getString("id");
			int hit = rs.getInt("hit");
			int recommend = rs.getInt("recommend");
			String datetime = rs.getString("adatetime");
	
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
  <tbody>
  <tr>
    <th scope="cols">글내용</th>
    <td><%=content %></td>
  </tr>
  </tbody>
</table>


<br>
</div><% 
%>
<%
if(myid.equals(id)||myid.equals("admin123")){%>
	<div align="left" style="width:92%; height: 100%; background-color: pink">
	신고글 수정, 삭제는 제목을 클릭하세요<br>
<%
	
}else{

%>
<div align="left" style="width:92%; height: 100%; background-color: pink">
<a href="javascript:history.back();" style="color: red">←←←이전 페이지</a><br>
<a href="list.jsp?Page=<%=nowPage%>">글 리스트로 이동</a><br>
<a href="recommendup.jsp?num=<%=readNum%>">추천</a>
<a href="recommenddown.jsp?num=<%=readNum%>">비추</a><br><br>
<a href="report.jsp">신고하기</a>



<%}
		}
	} catch (Exception e) {		
		e.printStackTrace();
	}	
}
%><br>
<a href="list.jsp?Page=<%=nowPage%>">글 리스트로 이동</a><br>
<a href="javascript:history.back();" style="color: red">←←←이전 페이지</a><br>
</div>
</body>
</html>