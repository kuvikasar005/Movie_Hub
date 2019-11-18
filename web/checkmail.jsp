<%-- 
    Document   : checkmail.jsp
    Created on : 4 Jul, 2019, 1:05:32 PM
    Author     : VIKAS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@page  import="java.sql.*" %>
    </head>
    <body>
        <%
             String email,psw;
             email = request.getParameter("email");
             try
             {
               Class.forName("org.apache.derby.jdbc.ClientDriver");
                Connection cn= DriverManager.getConnection("jdbc:derby://localhost:1527/MovieHubDB");
                PreparedStatement st=cn.prepareStatement("select *  from reguser where EMAIL=? ");
                st.setString(1,(email));
                ResultSet rs= st.executeQuery();
                if(rs.next())
                   {
                      //psw = rs.getString("password");
                      //session.setAttribute("op",psw);
                     session.setAttribute("em",email);
                     out.print("hellow");
                     %>
                              <jsp:forward page="sendmail.jsp"/>
                            <%
                     
                   }
                else
                  {
                      %>
                      <script>
                               alert("Please enter correct email");
                       </script>
                       <%
                  } 
              }
             catch(Exception ex)
             {
                  out.print(ex);
             }
       %>
    </body>
</html>
