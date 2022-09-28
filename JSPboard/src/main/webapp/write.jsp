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
<title>글 작성</title>
<link rel="stylesheet" href="common2.css">
</head>
<body> 
<div align="left" style="width:70%; height: 500px; border: 10px solid pink; border-radius: 1em;">
<% String myid =(String) session.getAttribute("id"); %>
<%if(myid==null){
	 %>
      <script>alert('게스트 로그인으로는 이용할 수 없습니다. 로그인을 해주세요');</script>
     <meta http-equiv="refresh" content="0;url=list.jsp?Page=1"><br>
    <%
}else{  %>
<form action="writeproc.jsp" method="get">
글제목:<input type="text" style= width:250px class="form-control" placeholder="글제목" name="title" maxlength="100"><br>
글작성자id:<input type="text" style= width:250px class="form-control" name="id" maxlength="100" value=<%=myid%>><br>
글내용:<textarea class="form-control" placeholder="내용을 입력하세요" name="content" maxlength="1000"  style=" height : 400px; width:400;"></textarea><br><br>
<%} %>
</div>
<input type="submit" value="글쓰기"><br>


</form>

</body>

</html>