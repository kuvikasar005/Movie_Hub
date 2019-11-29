<%-- 
    Document   : updateCustomerProfile
    Created on : 10 Jul, 2019, 1:30:59 PM
    Author     : VIKAS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@page import="java.sql.*" %>
    </head>
    <body>
        <%
            String n,e,p;
            String ph;
            
            
            n=request.getParameter("nm");
            e=request.getParameter("em");
            ph=request.getParameter("mob");
            p=request.getParameter("pwd");            
            
            out.print(n + " " +  e + " " + ph + " " + p);
            
            try
            {
                Class.forName("org.apache.derby.jdbc.ClientDriver");
                Connection cn= DriverManager.getConnection("jdbc:derby://localhost:1527/MovieHubDb");

                
               
                
                    PreparedStatement ps= cn.prepareStatement("update reguser set name=?, email=?, password=?, mob=? where email=?");
                    ps.setString(1, n);
                    ps.setString(2, e);
                    ps.setString(3, p);
                    ps.setString(4, ph);
                   ps.setString(5,(String)session.getAttribute("email"));
                    ps.executeUpdate();
                    %>
                    <script>
                        alert('Profile Successfully Updated.');
                        window.location.href="customerhome.jsp";
                    </script>
                    <%
                
                
                
                
                
                cn.close();
            }
            catch(Exception ex)
            {
                out.print(ex);  
            }
            
        %>
    </body>
</html>
