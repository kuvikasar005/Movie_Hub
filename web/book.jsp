<%--
Document   : book
Created on : 18 Nov, 2019, 6:48:28 PM
Author     : VIKAS
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Booking</title>
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
            rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
            <link href="https://fonts.googleapis.com/css?family=Montserrat&display=swap" rel="stylesheet">
            <link rel="stylesheet" type="text/css" href="CSS/viewmovie.css">
            <link rel="stylesheet" type="text/css" href="CSS/payment.css">
            <%@page import="java.sql.*"%>
            
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
                    <h1 style="color: #E4E9FD;">Payment</h1>
                    
                    <%
                    
                    int showId = Integer.parseInt(request.getParameter("showId"));
                    int selectedSeats = Integer.parseInt(request.getParameter("selectedSeats"));
                    %>
                    <div class="check" style="width: 40%;">
                        <div class="check-head">
                            <h2>Payment Method: <span class="header-text">Card</span></h2>
                            <small class="strip"> </small>
                        </div>
                        <div class="check-bottom">
                            <form method="post" action="ticketGenerator.jsp">
                                <p>Card Holder Name</p>
                                <input type="text" required="">
                                <p>Credit/Debit Card Number</p>
                                <input type="text" required="">
                                <p>Expiry Date</p>
                                <div class="expir-picker1">
                                    <ul>
                                        <li>
                                            <select class="drop-date">
                                                <option>January</option>
                                                <option>February</option>
                                                <option>March</option>
                                                <option>April</option>
                                                <option>May</option>
                                                <option>June</option>
                                                <option>July</option>
                                                <option>August</option>
                                                <option>September</option>
                                                <option>October</option>
                                                <option>November</option>
                                                <option>December</option>
                                            </select></li>
                                            <li>
                                                <select class="drop-date">
                                                    <option>2020</option>
                                                    <option>2021</option>
                                                    <option>2022</option>
                                                    <option>2023</option>
                                                    <option>2024</option>
                                                    <option>2025</option>
                                                    <option>2026</option>
                                                    <option>2027</option>
                                                    <option>2028</option>
                                                    <option>2029</option>
                                                    <option>2030</option>
                                                    <option>2031</option>
                                                    <option>2032</option>
                                                    <option>2033</option>
                                                </select></li>
                                            </ul>
                                        </div>
                                        <div class="cvv-numb">
                                            <div class="cvv-text">
                                                <p>Cvv Number</p>
                                                <input type="text" required="" class="c-num">
                                            </div>
                                            <div class="cvv-para">
                                                <p>Please Check This Field</p>
                                            </div>
                                            <div class="clear"> </div>
                                        </div>
                                        <input type="text" hidden="true" name="showId" value="<%=showId%>">
                                        <input type="text" hidden="true" name="selectedSeats" value="<%=selectedSeats%>">
                                        <input type="submit" value="Confirm Payment">
                                    </form>
                                    
                                </div>
                            </div>
                            
                            
                            
                        </body>
                    </html>