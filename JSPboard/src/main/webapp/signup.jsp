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
<title>회원가입성공</title>
<link rel="stylesheet" href="common2.css">
</head>
<body> 

<%
	String id = request.getParameter("id");
	session.setAttribute("id",id);
	String pw = request.getParameter("pw");
	String repw = request.getParameter("repw");
	String tel = request.getParameter("tel");
	session.setAttribute("tel",tel);
	String gender = request.getParameter("gender");
	session.setAttribute("gender",gender);
	String hobby = request.getParameter("hobby");
	session.setAttribute("hobby",hobby);

	try {
		  Class.forName("com.mysql.cj.jdbc.Driver");
		  Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/BoardBoard","root","admin");
		  Statement st = con.createStatement();
		  ResultSet rs = st.executeQuery("select count(case when id='"+id+"' then 1 end) as id from signin");
		  rs.next();
		  String id1 = null;
		  id1 = rs.getString("id");
			   if(id1.equals("1")) {
				   System.out.println("중복된 아이디");
				      %>
				     <script>
				      alert("중복된 아이디입니다");
				      </script>
			<meta http-equiv="refresh" content="0;url=signup.html?"/>	      
				     <%
				   }
			   
			   if(id1.equals("0") ) {
			   System.out.println("아이디 확인중");
		      %>
		     <script>
		     alert("입력한 아이디 사용가능 여부를 확인중 입니다");
		      </script>
		     <%
		   }
			 
		} catch(Exception e) {
		   e.printStackTrace();
		}
	
		
//	try {
 //       Class.forName("com.mysql.cj.jdbc.Driver");
 //       Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/BoardBoard","root","admin");
 //       Statement st = con.createStatement();
      //// ResultSet rs = st.executeQuery("select count(case when id='"+id+"' then 1 end) as id from signin");
 //       ResultSet rs = st.executeQuery("select id from signin where id = '"+id+"'");
     ////   rs.next();
      ////   String id1 = null;
       
    //  boolean sameId = rs.next();
    //  if(sameId){//아이디 중복됐을떄
       %> <%--  <script>
            alert("중복된 아이디가 존재합니다");
            </script>
            <meta http-equiv="refresh" content="0;url=signup.html?"/>
        --%>    <% 
            
  //    }else{//아이디 사용가능
         %> <!--   <script>
 //           alert("사용가능한 아이디입니다");
            </script> --><%
  //    }

		
	try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/BoardBoard", "root", "admin");
		
		if(pw.equals(repw)){
		Statement st = con.createStatement();
		int resultCount = st.executeUpdate("insert into signin values('"+id+"','"+pw+"','"+tel+"','"+gender+"','"+hobby+"')");
		if(id.equals("")||pw.equals("")||tel.equals("")||hobby.equals("")){
			System.out.println("공백 아이디");
		      %>
		     <script>
		      alert("공백으로 이루어진 회원가입입니다");
		      </script>
		      <% 
		      int resultCount1 = st.executeUpdate("delete from signin where id = ''");
		      int resultCount2 = st.executeUpdate("delete from signin where pw = ''");
		      int resultCount3 = st.executeUpdate("delete from signin where tel = ''");
		      int resultCount4 = st.executeUpdate("delete from signin where hobby = ''");
		      %> 
	<meta http-equiv="refresh" content="0;url=signup.html?"/>	     
		     <%
		   }else{
			   System.out.println("진짜 사용가능한 아이디");
			}
		System.out.println("회원가입성공");
%>		<h1>회원가입에 성공했습니다</h1>
		<h2>회원가입한 아이디로 다시 로그인해주세요</h2>
		<img src="cnrgk.gif" alt="con" id=cat><br>
		<a href="index.html">로그인 페이지로 이동</a>
		
		<%
		}else{
		
		%>
		<script>
			alert("비밀번호 불일치!");
		</script>
		<meta http-equiv="refresh" content="0;url=signup.html?"/>
		<%
		}
		
	} catch (Exception e) {		
		e.printStackTrace();
	}	
%>

</body>
</html>