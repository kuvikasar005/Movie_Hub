<%-- 
    Document   : reguser
    Created on : 28 Jun, 2019, 11:59:05 AM
    Author     : VIKAS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register User</title>
        <%@page import="java.sql.*" %>
        <%@page import="java.util.Random" %>
    </head>
    <body>
        <%
            String n,e,p;
            
            n=request.getParameter("nm");
            e=request.getParameter("em");
            p=request.getParameter("pass");            
            
            
            try
            {
                Class.forName("org.apache.derby.jdbc.ClientDriver");
                Connection cn= DriverManager.getConnection("jdbc:derby://localhost:1527/MovieHubDb");

                PreparedStatement ps1 = cn.prepareStatement("select * from REGUSER where EMAIL=?");
                ps1.setString(1, e);
                ResultSet rs = ps1.executeQuery();
                if(rs.next())
                {
                     %>
                    <script>
                        alert('Email already registered. Please use another email.');
                        window.location.href="index.html";
                    </script>
                    <%
                    
                }
                else
                {
                    
                    PreparedStatement ps= cn.prepareStatement("insert into REGUSER values(?,?,?,?,?)");
                    ps.setString(1, n);
                    ps.setString(2, e);
                    ps.setString(3, p);
                    ps.setString(4,"customer");
                    ps.setInt(5,1);
                    ps.executeUpdate();
                    %>
                    <script>
                        alert('Registration Successful. Please Login to Continue.');
                        window.location.href="index.html";
                    </script>
                    <%
                }
                
                
                
                
                cn.close();
            }
            catch(Exception ex)
            {
                out.print(ex);  
            }
            
        %>
    </body>
</html>
