<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,java.text.SimpleDateFormat,java.util.Date"%>
<%@page import="java.util.Date" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.sql.Connection" %>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 리스트</title>
<link rel="stylesheet" href="common.css">
</head>
<body> 
<h1>글 리스트</h1>

<%
 String myid =(String) session.getAttribute("id"); 
 String mytel =(String) session.getAttribute("tel"); 
 String mygender =(String) session.getAttribute("gender"); 
 String myhobby =(String) session.getAttribute("hobby"); 
%>
<h2><%= myid %>님 안녕하세요</h2>
<a href="signinfo.jsp"><h3><%= myid %>님의 회원정보 확인하기</h3></a><br>
<div align="left" style="width:100%; height: 100%; border: 10px solid pink; border-radius: 1em;">
<%
	String Page = request.getParameter("Page");
	session.setAttribute("Page",Page);
	int int_page = Integer.parseInt(Page);
	int pageNum = (int_page - 1) * 5;
	int count = 0;
	String Pagebutton1 = null;
	String Pagebutton2 = null;
	String Pagebutton3 = null;
	
	try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/BoardBoard", "root", "admin");
		Statement st = con.createStatement();
		ResultSet rs= st.executeQuery("SELECT count(*) FROM cat_board");
		rs.next();
		count = Integer.parseInt(rs.getString("count(*)"));
		out.println("총 개시글 수 : " + count);
		if(int_page == 1){
			Pagebutton1 = "disabled";
		}
		
		if(int_page < 1){
			int_page = 1;
		}
		if(int_page >= (count / 5)){
			Pagebutton2 = "disabled";
		}
		
	   } catch (Exception e) {
	      e.printStackTrace();

	   }
	      try {
	         Class.forName("com.mysql.cj.jdbc.Driver");
	         Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/BoardBoard", "root", "admin");
	         Statement st = con.createStatement();
	         ResultSet rs = st.executeQuery("select * from cat_board  orders limit " + pageNum + ",5");
	         while (rs.next()) {
	     			String num = rs.getString("num");
	     			String title = rs.getString("title");
	     			String content = rs.getString("content");
	     			String id = rs.getString("id");
	     			int hit = rs.getInt("hit");
	     			int recommend = rs.getInt("recommend");
	     			String datetime = rs.getString("adatetime");
	     			
	%><hr>
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
  
</table>

 

		<%--<%="|" %><%=num %><%="|" %><a href="read.jsp?num=<%=num%>"><%=title %></a><%="|" %><%=content %><%="|" %><%=id %><%="|" %><%=hit %><%="|" %><%=recommend %><%="|" %><%=datetime %>--%>	<br>

	<%


		}
	      
	} catch (Exception e) {		
		e.printStackTrace();
	}	
	      %>  <button type="button" <%=Pagebutton1%>
        	      onclick="location.href='list.jsp?Page=<%=int_page - 1%>' ">◀</button>
        	<%
        int ct = 0;
	for(int i=1;i<=Math.ceil(((double)count/5));i++){
		ct++;
%>		

<%
		if(count == i){
%>            
			[<%=ct %>]
<%
		} 
		if(int_page == i){
			Pagebutton3 = "disabled";
		}
		if(int_page != i){
			Pagebutton3 = null;
		}
%>						
			[<button type="button" <%=Pagebutton3%>
        	      onclick="location.href='list.jsp?Page=<%=i%>' "><%=i%></button>]
<%
		
	}
%>      
        	 <button type="button" <%=Pagebutton2%>
        	      onclick="location.href='list.jsp?Page=<%=int_page + 1%>' ">▶</button>

</div>

<hr><center>
<a href="write.jsp">글쓰기</a><br>
<a href="indexlogout.jsp" onclick="alert('<%= myid %> 회원님 로그아웃합니다')">로그아웃</a><br>
<a href="indexdel.jsp">회원삭제</a><br>
</center>
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