<%-- 
    Document   : moviedetail
    Created on : 17 Jul, 2019, 2:45:16 PM
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
        <link href="https://fonts.googleapis.com/css?family=Montserrat|Ubuntu&display=swap" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="CSS/moviedetails.css">
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
                    <div class="sidebar-right" style="margin-left: 14.4rem; padding: 0;">
                        
                    <%
                    
                    try
            {
                
                Class.forName("org.apache.derby.jdbc.ClientDriver");
                Connection cn= DriverManager.getConnection("jdbc:derby://localhost:1527/MovieHubDb");
                int movieid=Integer.parseInt(request.getParameter("movieId"));
                PreparedStatement ps= cn.prepareStatement("select * from movies where id=?");
                ps.setInt(1, movieid);
                
                ResultSet rs=ps.executeQuery();
                
               
               
               
                    if(rs.next())
                    {
                        %>
                        
                        
                        <div id="popup-video" style="background-color: rgba(0, 0, 0, 0.8); width: 203.6vh; height: 100vh; position: absolute; left: 0; z-index: 2; display: none
                             ; justify-content: center; align-items: center;">
                            
                            <div id="close" style="font-size: 50px; color: white; position: absolute; top: 0; right: 40px; cursor: pointer; transform: rotate(45deg);">+</div>
                            
                            <div style="background-color: white; width: 80%; height: 80%; opacity: 1;">
                                <iframe style="width: 100%; height: 100%;" src="<%=rs.getString("trailer")%>" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
                            </div>                            
                            
                        </div>
                        
                        <div class="thumbnail" style=" position: relative;">
                            <img src="<%=rs.getString("thumbnail_img")%>" style="width: 100%; height: 45vh;">
                            <i class="fa fa-play-circle fa-5x" id="play-btn" style="position: absolute; top: 40%; left: 45%; color: #eee; cursor: pointer;" onMouseOver="this.style.color='#ff0000'" onMouseOut="this.style.color='#eee'"></i>
                        </div>
                            
                            <img src="<%=rs.getString("image")%>" style="width: 22%; height: 45vh; display: inline-block; position: relative; bottom: 10rem; left: 55rem;">
                            
                            <a href="moviehall.jsp?movieId=<%=movieid%>" class="btn btn-outline-primary btn-lg" style="position: relative; top: 5rem; left: 37.1rem; width: 22%;">Book Now</a>
                            
                            
                            <div class="movie-info" style=" width: 50%; position: relative; bottom: 19rem; left: 3rem; ">
                                <h2 style="text-transform: uppercase; font-size: 50px; font-family: 'Montserrat', sans-serif; font-weight: bolder;"><%=rs.getString("name")%></h2><br>
                                <p style="font-size: 18px; font-family: 'Ubuntu', sans-serif;"><%=rs.getString("description")%></p><br>
                                
                                <p style="font-size: 18px; font-family: 'Ubuntu', sans-serif;"><b>CAST </b> <%=rs.getString("casts")%></p>
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
                <script language="javascript" type="text/javascript" src="jquery-1.8.2.js"></script>
                <script>
                    
                    var open = document.querySelector('#play-btn');
                    var close = document.querySelector('#close');
                    
                    open.addEventListener('click', function(){
                        document.querySelector('#popup-video').style.display="flex";
                    });
                    
                    close.addEventListener('click', function(){
                        document.querySelector('#popup-video').style.display="none";
                         var iframe = document.querySelector('iframe');
                            iframe.src = iframe.src;
                    });
                    
                    
                  
                </script>     

    </body>

</html>
