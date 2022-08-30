<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="common.css">
<meta charset="UTF-8">
<title>Board</title>
</head>
<body>
   <h2>회사 대나무숲</h2>
   <h5>글번호|제목|아이디|조회|추천</h5>
   <hr>
   <%
   int count = 0;
   int searchC = 1;
   String search = request.getParameter("search");
   String Page = request.getParameter("Page");
   int int_page = Integer.parseInt(Page);
   int pageNum = (int_page - 1) * 5;
   String readNum = request.getParameter("Pnum");
   String Type = request.getParameter("Type");
   String able1 = null;
   String able2 = null;
   String able3 = null;
   if (search == null) {
      searchC = 0;
   }
   %>
   <%
   try {
      Class.forName("com.mysql.cj.jdbc.Driver");
      Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mycomDB", "root", "admin");
      Statement st = con.createStatement(); // Statement는 정적 SQL문을 실행하고 결과를 반환받기 위한 객체다. Statement하나당 한개의 ResultSet 객체만을 열 수있다.
      ResultSet rs = st.executeQuery("SELECT COUNT(*) FROM CSboard;");
      rs.next();
      count = Integer.parseInt(rs.getString("COUNT(*)"));
   } catch (Exception e) {
      e.printStackTrace();

   }
   //이상 전체 게시글 수 뽑는 코드
   %>
   
   
   <% // 이하 검색 게시물
   if (searchC == 1) {
      count = 0;
      try {
         Class.forName("com.mysql.cj.jdbc.Driver");
         Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mycomDB", "root", "admin");
         Statement st = con.createStatement(); // Statement는 정적 SQL문을 실행하고 결과를 반환받기 위한 객체다. Statement하나당 한개의 ResultSet 객체만을 열 수있다.
         ResultSet rs = st.executeQuery("select * from CSboard where "+Type+" =  '" + search + "'");
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
   //이상 검색 게시글 수 뽑는 코드
   %>
   

   <%
   if (int_page == 1) {
      able1 = "disabled";
   }

   if (int_page < 1) {
      int_page = 1;
   }
   if (int_page > (count / 5)) {
      able2 = "disabled";
   }
   //이상 사전선언
   %>

   <%
   //검색문이 없는 상태에서 게시판 리스트 코드
   if (searchC == 0) {
      try {
         Class.forName("com.mysql.cj.jdbc.Driver");
         Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mycomDB", "root", "admin");
         Statement st = con.createStatement();
         ResultSet rs = st.executeQuery("select * from CSboard  orders limit " + pageNum + ",5");
         while (rs.next()) {
      String Pnum = rs.getString("Pnum");
      String title = rs.getString("title");
      String content = rs.getString("content");
      String id = rs.getString("id");
      String hits = rs.getString("hits");
      String recommend = rs.getString("recommend");
   %>
   <%=Pnum%>
   <a href="Read.jsp?Pnum=<%=Pnum%>"><%=title%></a>
   <%=id%>
   <%=hits%>
   <%=recommend%>
   <hr>
   <%
   }
   } catch (Exception e) {
   e.printStackTrace();
   }
   }
   %>

   <%
   //검색문이 있는 상태에서 게시판 리스트 코드 
   if (searchC == 1) {
      try {
         Class.forName("com.mysql.cj.jdbc.Driver");
         Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mycomDB", "root", "admin");
         Statement st = con.createStatement();
         ResultSet rs =
         st.executeQuery("select * from CSboard  orders where "+Type+" = '" + search + "'  limit " + pageNum + ",5");
         while (rs.next()) {
      String Pnum = rs.getString("Pnum");
      String title = rs.getString("title");
      String content = rs.getString("content");
      String id = rs.getString("id");
      String hits = rs.getString("hits");
      String recommend = rs.getString("recommend");
   %>

   <%=Pnum%>
   <a href="Read.jsp?Pnum=<%=Pnum%>"><%=title%></a>
   <%=id%>
   <%=hits%>
   <%=recommend%>
   <hr>
   <%
   }
   } catch (Exception e) {
   e.printStackTrace();
   }
   }
   %>

   전체 게시글수:<%=count%>
   <br>

   <%
   // 검색문이 없는경우
   if (searchC == 0) {
   %>
   <button type="button" <%=able1%>
      onclick="location.href='Board.jsp?Page=<%=int_page - 1%>' ">◁</button>
   <%
   int ct = 0;
   for (int i = 0; i <= (count / 5); i++) {
      ct++;
      if (int_page == ct) {
         able3 = "disabled";
      }
      if (int_page < ct) {
         able3 = null;
      }
   %>
   <button type="button" <%=able3%>
      onclick="location.href='Board.jsp?Page=<%=ct%>' ">
      <%=ct%>
   </button>
   <%
   }
   %>
   <button type="button" <%=able2%>
      onclick="location.href='Board.jsp?Page=<%=int_page + 1%>' ">▷</button>
   <%
   }
   %>
   <%
   // 검색문이 있는경우
   if (searchC == 1) {
   %>
   <button type="button" <%=able1%>
      onclick="location.href='Board.jsp?Page=<%=int_page - 1%>&search=<%=search%>&Type=<%=Type%>'">◁</button>
   <%
   int ct = 0;
   for (int i = 0; i <= (count / 5); i++) {
      ct++;
      if (int_page == ct) {
         able3 = "disabled";
      }
      if (int_page < ct) {
         able3 = null;
      }
   %>
   <button type="button" <%=able3%>
      onclick="location.href='Board.jsp?Page=<%=ct%>&search=<%=search%>&Type=<%=Type%>' ">
      <%=ct%>
   </button>
   <%
   }
   %>
   <button type="button" <%=able2%>
      onclick="location.href='Board.jsp?Page=<%=int_page + 1%>&search=<%=search%>&Type=<%=Type%>' ">▷</button>
   <%
   }
   %>

   <%-- 이하 계속표시 구간 --%>
   <br>
   <a href="Write.jsp">게시글작성 </a>
   <br>
   <a href="Index.jsp">대문으로 </a>

   <%-- 제목 검색기능 달기 --%>
   <%-- 나중에는 제목에 스크롤달아서 제목, 내용, 글쓴이로 해보기 --%>
   <form action="Board.jsp?Page=1%&serach=?&Type=?" method="get">
      <select name="Type">
         <option value="title">제목</option>
         <option value="content">본문</option>
      </select> 검색:<input name="search"><br>
      <button type="submit">검색</button>
      <input name="Page" value="<%=Page%>" type="hidden"><br>
   </form>

</body>
</html>