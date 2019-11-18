<%-- 
    Document   : login
    Created on : 1 Jul, 2019, 12:10:09 AM
    Author     : VIKAS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
        <%@page import="java.sql.*"%>
    </head>
    <body>
        <%
          String e,p;
            e=request.getParameter("em");
            p=request.getParameter("pass");
        try
            {
                
                Class.forName("org.apache.derby.jdbc.ClientDriver");
                Connection cn= DriverManager.getConnection("jdbc:derby://localhost:1527/MovieHubDb");

                PreparedStatement ps= cn.prepareStatement("select * from REGUSER where EMAIL=? and PASSWORD=?");                
                ps.setString(1, e);
                ps.setString(2, p);
                
                ResultSet rs=ps.executeQuery();
                
                if(rs.next())
                {
                    session.setAttribute("email", e);
                    
                    String user_type= rs.getString("TYPE");
                    
                    if(user_type.equals("customer"))
                    {
                        
                        %>
                        <script>
                            
                            window.location.href = "customerhome.jsp";
                        </script>
                        <%
                    }
                    else if(user_type.equals("staff"))
                    {
                        %>
                        <script>
                            
                            window.location.href = "staffhome.jsp";
                        </script>
                        <%
                    }
                    else if(user_type.equals("owner"))
                    {
                        %>
                        <script>
                            
                            window.location.href = "ownerhome.jsp";
                        </script>
                        <%
                    }
                }
                else
                {
                    %>
                        <script>
                            alert('Login Failed. Please try again with correct credentials');
                            window.location.href = "index.html";
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
