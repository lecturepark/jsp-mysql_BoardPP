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
<a href="list.jsp?Page=1"><h3>글 리스트</h3></a>


<%
 String myid =(String) session.getAttribute("id"); 
 String mytel =(String) session.getAttribute("tel"); 
 String mygender =(String) session.getAttribute("gender"); 
 String myhobby =(String) session.getAttribute("hobby"); 
%>
<h2><%= myid %>님 안녕하세요</h2>
<a href="signinfo.jsp"><h3><%= myid %>님의 회원정보 확인하기</h3></a><br>
<div align="left" style="width:100%; height: 100%; border: 10px solid pink; border-radius: 1em;">
<%//전체 게시글을 뽑는 코드
	String search = request.getParameter("search");
	String type = request.getParameter("type");
	String Page = request.getParameter("Page");
	session.setAttribute("Page",Page);
	int int_page = Integer.parseInt(Page);
	int pageNum = (int_page - 1) * 5;
	int count = 0;
	int searchC = 1;
	String Pagebutton1 = null;
	String Pagebutton2 = null;
	String Pagebutton3 = null;
	
	 if (search == null) { //검색기능 구분 코드 ...검색하지 않을 경우 서치를 널값으로
	      searchC = 0;
	   }//검색기능 구분 코드 ...검색하지 않을 경우 서치를 널값으로
	   %>
	   <%
	
	try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/BoardBoard", "root", "admin");
		Statement st = con.createStatement();
		ResultSet rs= st.executeQuery("SELECT count(*) FROM cat_board");
		rs.next();
		count = Integer.parseInt(rs.getString("count(*)"));
		out.println("총 게시글 수 : " + count);
		} catch (Exception e) {
	      e.printStackTrace();

	   }//전체 게시글을 뽑는 코드
	   %>
	   
	   <% // 검색 게시물 수 뽑는 코드
	   if (searchC == 1) {
	      count = 0;
	      try {
	         Class.forName("com.mysql.cj.jdbc.Driver");
	         Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/BoardBoard", "root", "admin");
	         Statement st = con.createStatement(); // Statement는 정적 SQL문을 실행하고 결과를 반환받기 위한 객체다. Statement하나당 한개의 ResultSet 객체만을 열 수있다.
	         ResultSet rs = st.executeQuery("select * from cat_board where "+type+" =  '" + search + "' ");
	         while (rs.next()) {
	      count++;
	         }
	      } catch (Exception e) {
	         e.printStackTrace();

	      }
	      if(count==0){
	         %>
	           <script>alert('검색된 항목이 없습니다');</script>
	         <%
	      }
	   }
	   //검색 게시글 수 뽑는 코드
	   %>
	   <%
   if (int_page == 1) {
	   Pagebutton1 = "disabled";
   }

   if (int_page < 1) {
      int_page = 1;
   }
   if (int_page > (count / 5)) {
	   Pagebutton2 = "disabled";
   }
   //이상 사전선언
   %>
	   <% //검색문 없는 게시글 페이징
	   if (searchC == 0) {
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
    <th scope="cols">글번호|<%=num %> </th>
    <th scope="cols">제목|<a href="read.jsp?num=<%=num%>"><%=title %></a></th>
    <th scope="cols">작성자id: <%=id %> </th>
    <th scope="cols">조회수|<%=hit %></th>
    <th scope="cols">추천수|<%=recommend %></th>
    <th scope="cols">작성시간|<%=datetime %></th>
  </tr>
  </thead>
  </table>

	<%


		}
	      
	} catch (Exception e) {		
		e.printStackTrace();
	}
	      }	//검색문 없는 게시글 페이징
	      %>  
<% if (searchC == 1) { //검색문있는 상태 게시판 리스트
	try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/BoardBoard", "root", "admin");
		Statement st = con.createStatement();
		ResultSet rs= st.executeQuery("select * from cat_board orders where "+type+" like'" + '%'+search+'%' + "'  limit " + pageNum + ",5");
		while (rs.next()) {
 			String num = rs.getString("num");
 			String title = rs.getString("title");
 			String content = rs.getString("content");
 			String id = rs.getString("id");
 			int hit = rs.getInt("hit");
 			int recommend = rs.getInt("recommend");
 			String datetime = rs.getString("adatetime");
 			%><hr>
 			<table class="type10">
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
 				<%
						}
	   } catch (Exception e) {
	      e.printStackTrace();

	   } //검색문있는 상태 게시판 리스트
		} 
//System.out.println("검색 분류" +type);
//System.out.println("검색 내용" +search);
//System.out.println("페이지" + Page);
%>	    
<%  
if (searchC == 0) { //검색문 없는 경우
	
%>
	      <button type="button" <%=Pagebutton1%>
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
<% 
}
%>
<hr>
<br>


 <%
   // 검색문이 있는경우
   if (searchC == 1) {
   %>
   <button type="button" <%=Pagebutton1%>
      onclick="location.href='list.jsp?Page=<%=int_page - 1%>&search=<%=search%>&type=<%=type%>'">◁</button>
   <%
   int ct = 0;
	for(int i=1;i<=Math.ceil(((double)count/5));i++){
		ct++;
	
      if (int_page == i) {
    	  Pagebutton3 = "disabled";
      }
      if (int_page < i) {
    	  Pagebutton3 = null;
      }
   %>
   <button type="button" <%=Pagebutton3%>
      onclick="location.href='list.jsp?Page=<%=i%>&search=<%=search%>&type=<%=type%>' ">
      <%=ct%>
   </button>
   <%
   }
   %>
   <button type="button" <%=Pagebutton2%>
      onclick="location.href='list.jsp?Page=<%=int_page + 1%>&search=<%=search%>&type=<%=type%>' ">▷</button>
   <%
   }
   %>
</div>
<br><br>
<div>
		<form action= "list.jsp?Page=?%&search=?&type=?" method="get">
			<fieldset>
				<legend>검색 필드</legend>
				<label>검색분류</label>
					<select name = "type">
						<option  value = "title">제목</option>
						<option  value = "id">작성자</option>
					</select>
				<label>검색어</label>
					<input name="Page" type="hidden" value="<%=Page %>">
					<input type = "text" name = "search">
					<input type = "submit" value = "검색" >
			</fieldset>
		</form>
</div>

<a href="write.jsp">글쓰기</a><br>
<a href="indexlogout.jsp" onclick="alert('<%= myid %> 회원님 로그아웃합니다')">로그아웃</a><br>
<a href="indexdel.jsp">회원삭제</a><br>

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