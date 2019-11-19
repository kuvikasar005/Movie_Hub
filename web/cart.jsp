<%-- 
    Document   : cart
    Created on : 1 Aug, 2019, 2:49:36 PM
    Author     : VIKAS
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Movies</title>
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	<link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
  rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
        <link href="https://fonts.googleapis.com/css?family=Montserrat&display=swap" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="CSS/viewmovie.css">
        <%@page import="java.sql.*"%>
        
        <style>
            table{
                margin-top: 100px;
                font-size: 20px;
                font-family: 'Montserrat';
            }
            tr:nth-child(odd){
                text-transform: uppercase;
            }
            td{
                padding: 7px 180px;
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
                        <h1 style="color: #E4E9FD;">Order Summary</h1>
                    <%
                    
                    try
            {
                
                Class.forName("org.apache.derby.jdbc.ClientDriver");
                Connection cn= DriverManager.getConnection("jdbc:derby://localhost:1527/MovieHubDb");

                PreparedStatement ps= cn.prepareStatement("select * from shows where showid=?"); 
                
                int showdId = Integer.parseInt(request.getParameter("showId"));
                
                ps.setInt(1, showdId);
                
                ResultSet rs=ps.executeQuery();
                
                if(rs.next())
                {
                    int movieid = rs.getInt("movieid");
                    int hallid = rs.getInt("hallid");
                    int showid = rs.getInt("showid");
                    int availableSeats = rs.getInt("seats");
                    int selectedSeats = Integer.parseInt(request.getParameter("numofseats"));
                    Date showdate = rs.getDate("show_date");
                    Time startTime = rs.getTime("start_time");
                    int price = rs.getInt("price");
                    int amount = price * selectedSeats;
                   
                    
                    //to check if there are seats or not
                    if(selectedSeats > availableSeats)
                    {
                        %>
                        <script>
                            alert('No of Seats Available ' + <%=availableSeats%>);
                            setTimeout(function(){
                                window.location.href = "moviehall.jsp?movieId=<%=movieid%>";
                            }, 1);
                        </script>
                            
                            
                        
                        <%
                    }
                    
                    
                    
                     ps= cn.prepareStatement("select * from hall where hall_id=?");
                     ps.setInt(1,hallid);
                     rs=ps.executeQuery();
                     rs.next();
                     String hallname = rs.getString("name");
                     
                     ps= cn.prepareStatement("select * from movies where id=?");
                     ps.setInt(1, movieid);
                     rs=ps.executeQuery();
                     rs.next();
                     String moviename = rs.getString("name");
                     
                     %>
                     
                     <table>
                         <tr>
                             <td><strong>Movie</strong></td>
                             <td><%=moviename%></td>
                         </tr>
                         
                         <tr>
                             <td><strong>Cinema Hall</strong></td>
                             <td><%=hallname%></td>
                         </tr>
                         
                         <tr>
                             <td><strong>Seats</strong></td>
                             <td><%=selectedSeats%></td>
                         </tr>
                         
                         <tr>
                             <td><strong>Show Date</strong></td>
                             <td><%=showdate%></td>
                         </tr>
                         
                         <tr>
                             <td><strong>Show Time</strong></td>
                             <td><%=startTime%></td>
                         </tr>
                         
                         <tr>
                             <td><strong>Price of Ticket</strong></td>
                             <td><%=price%></td>
                         </tr>
                         
                         <tr>
                             <td><strong>Amount to Pay</strong></td>
                             <td><%=amount%></td>
                         </tr>
                     </table>
                     
                     <%
                
                
                   %>
                   
                   <a class="btn btn-warning" href="book.jsp?showId=<%=showid%>&selectedSeats=<%=selectedSeats%>">Proceed to Pay</a>
                   
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