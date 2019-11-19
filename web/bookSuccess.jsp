<%--
Document   : bookSuccess
Created on : 19 Nov, 2019, 4:16:32 AM
Author     : VIKAS
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Success</title>
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
            rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
            <link href="https://fonts.googleapis.com/css?family=Montserrat&display=swap" rel="stylesheet">
            <link rel="stylesheet" type="text/css" href="CSS/viewmovie.css">
            <%@page import="java.sql.*"%>
        </head>
        <body>
            
            <div class="main-container">
                <div class="sidebar-left" style="position: fixed;">
                    <img class="sidebar-logo" src="Images/logo.png">
                    <%
                    String em = (String)session.getAttribute("email");
                    int ticketId = Integer.parseInt(request.getParameter("ticketId"));
                    try
                    {
                    
                    Class.forName("org.apache.derby.jdbc.ClientDriver");
                    Connection cn= DriverManager.getConnection("jdbc:derby://localhost:1527/MovieHubDb");
                    PreparedStatement ps= cn.prepareStatement("select * from REGUSER where EMAIL=?");
                    ps.setString(1, em);
                    
                    
                    ResultSet rs=ps.executeQuery();
                    
                    if(rs.next())
                    {
                    String user_name = rs.getString("name");
                    %><h5>Hello <%
                    out.print(user_name);
                    %></h5><%
                    cn.close();
                    }
                    
                    
                    
                    %>
                    <h4></h4>
                    <a href="customerhome.jsp" type="button" class="btn btn-info btn-block mb-2" id="logout">Dashboard</a>
                    <a href="logout.jsp" type="button" class="btn btn-info btn-block">Logout</a>
                    <div>
                        <a href="#"><i class="fa fa-facebook social-icons"></i></a>
                        <a href="#"><i class="fa fa-envelope social-icons"></i></a>
                        <a href="#"><i class="fa fa-instagram social-icons"></i></a>
                        <a href="#"><i class="fa fa-twitter social-icons"></i></a>
                    </div>
                    
                </div>
                <div class="sidebar-right" style="margin-left: 14rem; padding-left: 8rem;">
                    <h1 style="color: #E4E9FD;">Booking Success</h1>
                    <div class="jumbotron jumbotron-fluid">
                        <div class="container">
                            <p class="lead">Your Ticket is successfully Booked. Your <b>TicketId is <%=ticketId%></b>. Please carry a screenshot of this webpage when going for movie.</p>
                            <a href="customerhome.jsp" class="btn btn-primary">Back to Home</a>
                        </div>
                    </div>
                    
                </div>
            </div>
                    
                    <%
                        }
                    catch(Exception ex)
                    {
                    out.print(ex);
                    }

                    %>
            
            
        </body>
    </html>