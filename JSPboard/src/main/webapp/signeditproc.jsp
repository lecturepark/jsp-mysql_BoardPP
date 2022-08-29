<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String myid =(String) session.getAttribute("id"); %>
<%
	//String editid = request.getParameter("id");
	String tel = request.getParameter("tel");
	String gender = request.getParameter("gender");
	String hobby = request.getParameter("hobby");
	try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/BoardBoard", "root", "admin");
		Statement st = con.createStatement();
		String sql = "update signin set "
				+"tel='"
				+tel
				+"', "
				+"gender='"
				+gender
				+"', "
				+"hobby='"
				+hobby
				+"' "
				+"where id = '"+ myid+"' ";
		System.out.println("==== 전송하려는 sql:" + sql);		
		int resultCount = st.executeUpdate(sql);	// 글쓰기 sql 전송
		if(resultCount == 1){
			System.out.println("==== 회원수정 성공");
			%> 
			<% session.setAttribute("tel",tel); %>
			<% session.setAttribute("gender",gender); %>
			<% session.setAttribute("hobby",hobby); %>
			<%
		} else {
			System.out.println("==== 회원수정 실패");
		}
	} catch (Exception e) {		
		e.printStackTrace();
	}
	
	response.sendRedirect("list.jsp?Page=1");	// 글리스트 화면으로 강제 이동
%>
