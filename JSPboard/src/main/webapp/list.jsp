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
<link rel="stylesheet" href="common2.css">
</head>
<body> 
<h1>글 리스트</h1>
<h2>글번호 ㅣ 제목 ㅣ 글내용 ㅣ 작성자id | 조회수 | 추천수</h2>
<div align="left" style="width:70%; height: 200px; border: 10px solid pink; border-radius: 1em;">
<%
String tempPage = request.getParameter("page");
	try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/BoardBoard", "root", "admin");
		Statement st = con.createStatement();
		ResultSet rs= st.executeQuery("SELECT * FROM cat_board LIMIT 5 OFFSET 0");
		while(rs.next()){
			String num = rs.getString("num");
			String title = rs.getString("title");
			String content = rs.getString("content");
			String id = rs.getString("id");
			int hit = rs.getInt("hit");
			int recommend = rs.getInt("recommend");
			%><hr><%
%>		
		<%="|" %><%=num %><a href="read.jsp?num=<%=num%>"><%="|" %><%=title %><%="|" %></a><%=content %><%="|" %><%=id %><%="|" %><%=hit %><%="|" %><%=recommend %>	<br>
<%
		}
	} catch (Exception e) {		
		e.printStackTrace();
	}	
%>
</div>





<hr>
<a href="write.jsp">글쓰기</a><br>
<a href="index.jsp">메인 화면 이동</a><br>
<script type="text/javascript"> 

function randomNumber()
{
  var rndNum = Math.round(Math.random()*6);
  return rndNum;
}

function randomImage()
{
  var number = randomNumber();
  var bannerImage = new Array();

  bannerImage[0] = "<img src=janna.jpg>";
  bannerImage[1] = "<img src=hoya.jpg>";
  bannerImage[2] = "<img src=Lucian.jpg>";
  bannerImage[3] = "<img src=Camille.jpg>";
  bannerImage[4] = "<img src=doya.jpg>";
  bannerImage[5] = "<img src=Janna2.jpg>";
  bannerImage[6] = "<img src=Nasus.jpg>";

  return bannerImage[number];
}        

</script>
</HEAD>
<BODY>
<script type="text/javascript">

document.write("<center>");
document.write(randomImage());
document.write("</center>");

</script>

</body>
</html>