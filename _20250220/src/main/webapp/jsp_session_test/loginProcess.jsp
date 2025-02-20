<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
String empno = request.getParameter("empno");
String ename = request.getParameter("ename");
String URL = "jdbc:mysql://localhost:3306/spring5fs";
String sql = "select * from emp where empno= " + empno + " and ename= '" + ename + "'";

try{Class.forName("com.mysql.cj.jdbc.Driver");
	Connection conn = DriverManager.getConnection(URL,"root","1234");
	Statement stmt = conn.createStatement();
	ResultSet rs = stmt.executeQuery(sql);

	if(rs.next()) {
        // 로그인 성공
        session.setAttribute("userid", ename);
        session.setAttribute("password", empno);
        response.sendRedirect("main.jsp");
    } else {
        // 로그인 실패
        response.sendRedirect("login.jsp");
    }
}catch(Exception e) {
	e.printStackTrace();
}
   
%> 