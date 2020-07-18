<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<title>Profile</title>

<style>
split {
  height: 100%;
  width: 50%;
  position: fixed;
  z-index: 1;
  top: 0;
  overflow-x: hidden;
  padding-top: 20px;
}

/* Control the left side */
.left {
  left: 0;
  background-color: #111;
}

/* Control the right side */
.right {
  right: 0;
  background-color: red;
}

/* If you want the content centered horizontally and vertically */
.centered {
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  text-align: center;
}

/* Style the image inside the centered container, if needed */
.centered img {
  width: 150px;
  border-radius: 50%;
}
</style>
</head>
<body style="background:#fff0e6" class="bg">
<h1 align="center" > <u>MyApp</u> <u>Profile </u></h1>
<br/>
 <form >
 	
 		<img src="file:///D:/JavaPrograms/LoginFrom/pics/bgimg.jpg" alt="Background" height="250px" style="width:100%"/>
       	<br/><br/><br/><br/>
       
				<div class="split left">
				  <div class="centered">
				    <img src="file:///D:/JavaPrograms/LoginFrom/pics/profilepic.jpg" alt="User" height="250px" align="left" style="width:300px">			    
				  </div>
				</div>
<%
    String Fname=request.getParameter("Fname");
	String Lname=request.getParameter("Lname");
	String email=request.getParameter("email");
	String password=request.getParameter("password");
try
	{
		
        session.setAttribute("status1","0"); 
		
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","student1","123456");
		Statement stmt=conn.createStatement();
				
		ResultSet rs=stmt.executeQuery("select Fname,Lname,email from Myapp");
		
%>	
	<H2> Student Information </H2>
	<table  cellpadding="5" border="1">
		<tr align="left" style="background:#ffbf80">
			<th>First Name</th>
			<th>Last Name</th>
			<th>Email</th>
		</tr>
<%
		
		while(rs.next())
		{	
			
%>
		<tr align="left" style="background:#ffe6ff">
			<td><%=rs.getString("Fname") %></td>
			<td><%=rs.getString("Lname") %></td>
			<td><%=rs.getString("email") %></td>
		</tr>
<%
			
		}

%>
	</table>
	</BR>
	<input type="Button" name="Print" Value="Print the Report" onClick="window.print();">
<%
		
			conn.close();
	}
	catch(Exception e)
	{
		out.println(e);
	}
		
%>
</form>
</body>
</html>