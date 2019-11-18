<%-- 
    Document   : moviehall
    Created on : 22 Jul, 2019, 1:58:46 PM
    Author     : VIKAS
--%>

<%@page import="java.time.LocalDate"%>
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
        <%@page import="java.time.temporal.*"%>
        <%@page import="java.time.*"%>
        <%@page import="java.sql.*"%>
        
        <style>
            
            table td, table th{
                padding-right: 12rem;
                padding-bottom: 1rem;
            }
            
            form input{
                width: 4rem; 
                background: none; 
                outline: none; 
                border: 1px solid black;
                margin-right: 6rem;
            }
            
           .btn-container{
               margin-left: 2rem;
                width: 400px;
                padding-bottom: 0.7rem;
                border-bottom: 3px solid #1c1c1c;
                margin-bottom: 7rem;
        }

        #tomorrow{
            display: none;
        }
        
        #nextday{
            display:  none;
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
                        
                    <%
                    
                    try
            {
                
                Class.forName("org.apache.derby.jdbc.ClientDriver");
                Connection cn= DriverManager.getConnection("jdbc:derby://localhost:1527/MovieHubDb");
                int movieid = Integer.parseInt(request.getParameter("movieId"));
                PreparedStatement ps= cn.prepareStatement("select * from movies where id=?");                                
                ps.setInt(1, movieid);
                
                
                ResultSet rs=ps.executeQuery();
                rs.next();
                
                %>
                <h1 style="color: #E4E9FD;"><%out.print(rs.getString("name"));%></h1>
                
                <%
                
                    LocalDate today = LocalDate.now();
                               LocalDate tomorrow = today.plus(1, ChronoUnit.DAYS);
                               LocalDate nextday = tomorrow.plus(1, ChronoUnit.DAYS);

                               // nextday is the day after tomorrow


                               // Days of today, tomorrow, nextday

                               DayOfWeek todayDay = today.getDayOfWeek();
                               DayOfWeek tomorrowDay = tomorrow.getDayOfWeek();
                               DayOfWeek nextDayName = nextday.getDayOfWeek();
                
                %>
                
                
                <div class="btn-container">
			<button class="btn btn-outline-dark active mt-5 mr-2" id="today-btn"><%=todayDay%></button>
			<button class="btn btn-outline-dark mt-5 mr-2" id="tomorrow-btn"><%=tomorrowDay%></button>
                        <button class="btn btn-outline-dark mt-5 mr-2" id="nextday-btn"><%=nextDayName%></button>
		</div>
                        
                 <%       
                 
                 ps = cn.prepareStatement("SELECT shows.*, name FROM shows JOIN hall ON hallid = hall_id where movieid=?");
                 ps.setInt(1, movieid);
                 rs = ps.executeQuery();
                 
                 %>
                  <section id="today" style="border: 1px solid black; margin: 2rem;">
                      <table>
                                  
                                  <tr>
                                      <th>Hall Name</th>
                                      <th>Show Time</th>
                                      <th>Seats</th>
                                  </tr>
                                  
                           <%
                            while(rs.next())
                            {
                               

                               Date dbDate = rs.getDate("show_date");

                              LocalDate showDate = Instant.ofEpochMilli(dbDate.getTime()).atZone(ZoneId.systemDefault()).toLocalDate();
                   
                             if(today.isEqual(showDate))
                             {
                                
                                 %>
                                 
                                 <tr>
                                     <td><% out.print(rs.getString("name"));%></td>
                                     <td><% out.print(rs.getString("start_time"));%></td>
                                     <td>
                                         <form action="cart.jsp" method="post">
                                             <input type="number" name="numofseats" required="">
                                             <input name="showId" value="<%=rs.getInt("showid")%>" style="display: none;">
                                             <button type="submit" class="btn btn-warning">Proceed</button>
                                         </form>
                                     
                                     </td>
                                 </tr>
                                 
                                 <%
                                 
                             }

                            }
                             %>
                           </table>
                    </section>
                             
                             
                    <%       
                 
                 ps = cn.prepareStatement("SELECT shows.*, name FROM shows JOIN hall ON hallid = hall_id where movieid=?");
                 ps.setInt(1, movieid);
                 rs = ps.executeQuery();
                 
                 %>
                  <section id="tomorrow" style="border: 1px solid black; margin: 2rem;">
                      <table>
                                  
                                  <tr>
                                      <th>Hall Name</th>
                                      <th>Show Time</th>
                                      <th>Seats</th>
                                  </tr>
                           <%
                            while(rs.next())
                            {
                               

                               Date dbDate = rs.getDate("show_date");

                              LocalDate showDate = Instant.ofEpochMilli(dbDate.getTime()).atZone(ZoneId.systemDefault()).toLocalDate();
                   
                             if(tomorrow.isEqual(showDate))
                             {
                                
                                 %>
                                 
                                 <tr>
                                     <td><% out.print(rs.getString("name"));%></td>
                                     <td><% out.print(rs.getString("start_time"));%></td>
                                     <td>
                                         <form action="cart.jsp" method="post">
                                             <input type="number" name="numofseats" required="">
                                             <input name="showId" value="<%=rs.getInt("showid")%>" style="display: none;">
                                             <button type="submit" class="btn btn-warning">Proceed</button>
                                         </form>
                                     
                                     </td>
                                 </tr>
                                 
                                 <%
                                 
                             }

                            }
                             %>
                           </table>
                    </section>
                 
                             
                             
                    <%       
                 
                 ps = cn.prepareStatement("SELECT shows.*, name FROM shows JOIN hall ON hallid = hall_id where movieid=?");
                 ps.setInt(1, movieid);
                 rs = ps.executeQuery();
                 
                 %>
                  <section id="nextday" style="border: 1px solid black; margin: 2rem;">
                      <table>
                                  
                                  <tr>
                                      <th>Hall Name</th>
                                      <th>Show Time</th>
                                      <th>Seats</th>
                                  </tr>
                           <%
                            while(rs.next())
                            {
                               

                               Date dbDate = rs.getDate("show_date");

                              LocalDate showDate = Instant.ofEpochMilli(dbDate.getTime()).atZone(ZoneId.systemDefault()).toLocalDate();
                          
                             if(nextday.isEqual(showDate))
                             {
                                
                                 %>
                                 
                                 <tr>
                                     <td><% out.print(rs.getString("name"));%></td>
                                     <td><% out.print(rs.getString("start_time"));%></td>
                                     <td>
                                         <form action="cart.jsp" method="post">
                                             <input type="number" name="numofseats" required="">
                                             <input name="showId" value="<%=rs.getInt("showid")%>" style="display: none;">
                                             <button type="submit" class="btn btn-warning">Proceed</button>
                                         </form>
                                     
                                     </td>
                                 </tr>
                                 
                                 <%
                                 
                             }

                            }
                             %>
                           </table>
                           
                    </section>
                 
                 
                   
                  
                             
                   
                   <%
                    
                
                cn.close();
                
            }
            catch(Exception ex)
            {
                 out.print(ex);
            }
		
		%>
			
			
			
		</div>
	</div>
                
                <script>
                    
                    var todaybtn = document.querySelector('#today-btn');
                    var tomorrowbtn = document.querySelector('#tomorrow-btn');
                    var nextdaybtn = document.querySelector('#nextday-btn');
                    
                    todaybtn.addEventListener('click', function(){
                            if(!todaybtn.classList.contains('active'))
                            {
                                    todaybtn.classList.add('active');
                            }
                            tomorrowbtn.classList.remove('active');
                            nextdaybtn.classList.remove('active');
                            document.querySelector('#today').style.display = 'block';
                            document.querySelector('#tomorrow').style.display = 'none';
                            document.querySelector('#nextday').style.display = 'none';
                    });
                    
                    tomorrowbtn.addEventListener('click', function(){
                            if(!tomorrowbtn.classList.contains('active'))
                            {
                                    tomorrowbtn.classList.add('active');
                            }
                            todaybtn.classList.remove('active');
                            nextdaybtn.classList.remove('active');
                            document.querySelector('#today').style.display = 'none';
                            document.querySelector('#tomorrow').style.display = 'block';
                            document.querySelector('#nextday').style.display = 'none';
                    });
                    
                    nextdaybtn.addEventListener('click', function(){
                            if(!nextdaybtn.classList.contains('active'))
                            {
                                    nextdaybtn.classList.add('active');
                            }
                            tomorrowbtn.classList.remove('active');
                            todaybtn.classList.remove('active');
                            document.querySelector('#today').style.display = 'none';
                            document.querySelector('#tomorrow').style.display = 'none';
                            document.querySelector('#nextday').style.display = 'block';
                    });

                    
                    
                </script>
                
    </body>
</html>
