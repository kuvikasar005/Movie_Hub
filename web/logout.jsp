<%-- 
    Document   : logout
    Created on : 4 Jul, 2019, 11:53:30 AM
    Author     : VIKAS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Logout</title>
    </head>
    <body>
        <%
          session.invalidate();
          
        %>
        <jsp:forward page="index.html"></jsp:forward>
        
    </body>
</html>
