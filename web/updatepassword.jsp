<%-- 
    Document   : updatepassword
    Created on : 19 Nov, 2019, 6:50:39 AM
    Author     : VIKAS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
                <%
                    String em = (String)session.getAttribute("email");
                    try
            {
            	String pw = request.getParameter("pass");
                
                Class.forName("org.apache.derby.jdbc.ClientDriver");
                Connection cn= DriverManager.getConnection("jdbc:derby://localhost:1527/MovieHubDb");

                PreparedStatement ps= cn.prepareStatement("update into reguser set password=? where email=?");                
                ps.setString(1, pw);
                ps.setString(2, em);
                
                ps.executeUpdate();
                
                cn.close();
                
                
            }
            catch(Exception ex)
            {
                 out.print(ex);
            }
		
		%>	
    </body>
</html>
