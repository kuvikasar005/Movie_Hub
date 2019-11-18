<%-- 
    Document   : checkotp
    Created on : 4 Jul, 2019, 1:22:52 PM
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
            String sotp=request.getParameter("systemotp");
            String myotp=request.getParameter("userotp");
            
            if(sotp.equals(myotp))
            {
                %>
                    <form action="updatepassword.jsp">
                        New Password <input type="text" name="pass">
                    </form>
                <%
            }
            else
            {
                %>
                <script>
                    alert("Incorret OTP");
                </script>
                <a href="index.html">Go to Login Page</a>
                <%
            }
        %>
    </body>
</html>
