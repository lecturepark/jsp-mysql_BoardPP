<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <%@page import="com.lecture.domain.LectureParkVO"%> --%>
<%
	String myid =(String) session.getAttribute("id");
	//String id = request.getParameter("id");
	
	try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/BoardBoard", "root", "admin");
		Statement st = con.createStatement();
		String sql = "delete from signin where id = '"+ myid+"' ";
		System.out.println("==== 전송하려는 sql:" + sql);		
		int resultCount = st.executeUpdate(sql);	// 글쓰기 sql 전송
		if(resultCount == 1){
			System.out.println("==== 회원삭제 성공");
			%><script>alert('회원삭제 성공');</script>
			 <meta http-equiv="refresh" content="3;url=index.html?">회원삭제를 성공했습니다 3초뒤 로그인 화면으로 이동<br>
			 <img src="goodbye.jpg" alt="goodbye" id=goodbye>
			 <%
		} else {
			System.out.println("==== 회원삭제 실패");
			%> 
			<img src="pepe.jpg" alt="실패" id=pepe>
			<a href="list.jsp?Page=1">회원삭제를 실패했습니다</a>  <%
		}
	} catch (Exception e) {		
		e.printStackTrace();
	}
	
%>
