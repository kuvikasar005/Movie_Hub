<%-- 
    Document   : test
    Created on : 16 Jul, 2019, 11:16:03 PM
    Author     : VIKAS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@page import="java.sql.*"%>
    </head>
    <body>
        <%
                    
                    try
            {
                
                Class.forName("org.apache.derby.jdbc.ClientDriver");
                Connection cn= DriverManager.getConnection("jdbc:derby://localhost:1527/MovieHubDb");

                PreparedStatement ps= cn.prepareStatement("select * from movies");                                
                
                ResultSet rs=ps.executeQuery();
                
               //int i=0;
                    while(rs.next())
                    {
                        out.print("<b>Movie : </b>");
                       out.print(rs.getString("name") + "<br><br>" );
                       out.print("<b>Description : </b>");
                       out.print(rs.getString("description") + "<br><br>" );
                       out.print("<b>Casts : </b>");
                       out.print(rs.getString("casts") + "<br><br>" );
                       out.print("<b>Trailer : </b>");
                       out.print(rs.getString("trailer") + "<br><br>" );
                       out.print("<br><hr><br>");                     
                    }
                cn.close();
                
            }
            catch(Exception ex)
            {
                 out.print(ex);
            }
		
		%>
                
                
                <iframe width="1500" height="520" src="https://www.youtube.com/embed/F67S2mSQlOk" frameborder="0"  allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture; modals;" allowfullscreen></iframe>
    </body>
</html>
