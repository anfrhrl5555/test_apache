<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.PreparedStatement" %>
<%@ page import = "java.sql.ResultSet" %>
<%@ page import = "java.sql.ResultSetMetaData" %>
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.DatabaseMetaData" %>
<%@ page import = "java.sql.SQLException" %>

<%
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
                ResultSetMetaData rmd = null;

        try{
        //String url = "jdbc:mysql://mysql:3306/mydb";
        String url = "jdbc:mysql://mysql-pod-service:3306/my-db";
        String id = "test";
        String pw = "test";
        Class.forName("com.mysql.jdbc.Driver");
        conn=DriverManager.getConnection(url,id,pw);
        String sql = "select count(*) from private";
        DatabaseMetaData meta = conn.getMetaData();
        pstmt = conn.prepareStatement(sql);
        pstmt.executeQuery();
        rs = pstmt.executeQuery();
        while (rs.next()){
		out.println("<tr>");

		out.println("<td>" + rs.getString("id") + "</td>");

		out.println("<td>" + rs.getString("email") + "</td>");

		out.println("<td>" + rs.getString("phone_number") + "</td>");

		out.println("</tr>");
         }
        }catch(Exception e){
                        e.printStackTrace();
                }
                finally{
        if(pstmt != null) try{pstmt.close();}catch(SQLException sqle){}
        if(conn != null) try{conn.close();}catch(SQLException sqle){}
        }
%>

