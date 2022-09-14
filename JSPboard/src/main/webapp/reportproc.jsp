<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%	
	String readNum = (String) session.getAttribute("num");
	String reportreason =(String) session.getAttribute("reason");
	String type = request.getParameter("type");
	session.setAttribute("type", type);
	String reason = request.getParameter("reason");
	session.setAttribute("reason", reason);
	
	try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/BoardBoard", "root", "admin");
		Statement st = con.createStatement();
		String sql = "update cat_board set "+type+" = '"+reason+"' where num=" + readNum;
		System.out.println("==== 전송하려는 sql:" + sql);		
		int resultCount = st.executeUpdate(sql);	// 글쓰기 sql 전송
		if(resultCount == 1){
			System.out.println("==== 신고 성공");
		} else {
			System.out.println("==== 신고 실패");
		}
	} catch (Exception e) {		
		e.printStackTrace();
	}
	
	response.sendRedirect("list.jsp?Page=1");	// 글리스트 화면으로 강제 이동
%>
