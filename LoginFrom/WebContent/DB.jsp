<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*,java.util.*" %>
<%     
		String Fname=request.getParameter("Fname");
	    String password=request.getParameter("password");
	
	try
	{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","student1","123456");
		Statement st=conn.createStatement();
		
		String sql="select Fname,password from Myapp where Fname='"+Fname+"' and password='"+password+"'";
		//out.println(sql);
		
		int i=st.executeUpdate(sql);
		
		if(i>0)
		{
		
			response.sendRedirect("http://localhost:8000/LoginFrom/profile1.jsp");
		}
		else
		{
			    response.sendRedirect("http://localhost:8000/LoginFrom/Signup.html");
		}
	
		//Pass Value in QueryString
		
		
	
	}
	
	catch(Exception e)
	{
		System.out.println((e));
	}
	
	
	
%>
