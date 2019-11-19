<%--
Document   : bookHistory
Created on : 19 Nov, 2019, 4:48:45 AM
Author     : VIKAS
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>History</title>
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
            rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
            <link href="https://fonts.googleapis.com/css?family=Montserrat&display=swap" rel="stylesheet">
            <link rel="stylesheet" type="text/css" href="CSS/viewmovie.css">
            <%@page import="java.sql.*"%>

            <style type="text/css">
                .one-line{
                    display: inline-block;
                    font-size: 20px;
                    margin-right: 40px;
                    width: 11%;
                    margin-bottom: 10px;
                }
            </style>
        </head>
        <body>
            <div class="main-container">
                <div class="sidebar-left" style="position: fixed;">
                    <img class="sidebar-logo" src="Images/logo.png">
                    <%
                    String em = (String)session.getAttribute("email");
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
                    
                    }
                    catch(Exception ex)
                    {
                    out.print(ex);
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
                    <h1 style="color: #E4E9FD;">History</h1>
                    
                    <strong>
                        <div>
                            <div class="one-line">Ticket Id</div>
                            <div class="one-line">Movie Name</div>
                            <div class="one-line">Hall Name</div>
                            <div class="one-line">Show Date</div>
                            <div class="one-line">Show Time</div>
                            <div class="one-line">No of Seats</div>
                        </div>
                    </strong>

                                        <%
                    
                    try
            {
                
                Class.forName("org.apache.derby.jdbc.ClientDriver");
                Connection cn= DriverManager.getConnection("jdbc:derby://localhost:1527/MovieHubDb");

                PreparedStatement ps= cn.prepareStatement("select * from TICKETS where EMAIL=?"); 
                               
                ps.setString(1, em);
                
                ResultSet rs=ps.executeQuery();
                while(rs.next())
                {
                    int ticketId = rs.getInt("TICKETID");
                    int seats = rs.getInt("SEATS");
                    int showId = rs.getInt("SHOWID");

                    ps= cn.prepareStatement("select * from shows where showid=?"); 
                    ps.setInt(1, showId);
                    ResultSet rs2 = ps.executeQuery();
                    rs2.next();
                    int movieid = rs2.getInt("movieid");
                    int hallid = rs2.getInt("hallid");
                    Date showdate = rs2.getDate("show_date");
                    Time startTime = rs2.getTime("start_time");

                    ps= cn.prepareStatement("select * from hall where hall_id=?");
                     ps.setInt(1,hallid);
                     rs2=ps.executeQuery();
                     rs2.next();
                     String hallname = rs2.getString("name");
                     
                     ps= cn.prepareStatement("select * from movies where id=?");
                     ps.setInt(1, movieid);
                     rs2=ps.executeQuery();
                     rs2.next();
                     String moviename = rs2.getString("name");
                        
                    %>
                        <div>
                            <div class="one-line"><%=ticketId%></div>
                            <div class="one-line"><%=moviename%></div>
                            <div class="one-line"><%=hallname%></div>
                            <div class="one-line"><%=showdate%></div>
                            <div class="one-line"><%=startTime%></div>
                            <div class="one-line"><%=seats%></div>
                        </div>
                    <%
                }
                     
 
                cn.close();
                
            }
            catch(Exception ex)
            {
                 out.print(ex);
            }
        
        %>
        
                    
                </div>
            </div>          
                        
        </body>
    </html>