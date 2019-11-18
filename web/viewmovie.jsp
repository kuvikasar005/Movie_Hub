<%-- 
    Document   : viewmovie
    Created on : 17 Jul, 2019, 12:49:43 PM
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
                        <h1 style="color: #E4E9FD;">Movies</h1>
                    <%
                    
                    try
            {
                
                Class.forName("org.apache.derby.jdbc.ClientDriver");
                Connection cn= DriverManager.getConnection("jdbc:derby://localhost:1527/MovieHubDb");

                PreparedStatement ps= cn.prepareStatement("select * from movies");                                
                
                ResultSet rs=ps.executeQuery();
                
               int movieid=0;
                    while(rs.next())
                    {
                        movieid=rs.getInt("id");
                        %>
                        <div class="row mb-5">
                            
                            <div class="card mr-auto" style="width: 18rem;">
                                <img src="<%=rs.getString("image")%>" class="card-img-top" alt="Movie Poster">
                                <div class="card-body">
                                  <h5 class="card-title"><%=rs.getString("name")%></h5>
                                  
                                  <a href="moviedetail.jsp?movieId=<%=movieid%>" class="btn btn-warning">View More</a>
                                </div>
                            </div>
                             
                                  
                            <%
                            
                            if(rs.next())
                            {
                                movieid=rs.getInt("id");
                                 %>
                        
                            
                            <div class="card mr-auto" style="width: 18rem;">
                                <img src="<%=rs.getString("image")%>" class="card-img-top" alt="Movie Poster">
                                <div class="card-body">
                                  <h5 class="card-title"><%=rs.getString("name")%></h5>
                                  
                                  <a href="moviedetail.jsp?movieId=<%=movieid%>" class="btn btn-warning">View More</a>
                                </div>
                            </div>
                             
                                  
                            <%
                            }
                            
                            %>
                            
                            <%
                            
                            if(rs.next())
                            {
                                movieid=rs.getInt("id");
                                 %>
                        
                            
                            <div class="card mr-auto" style="width: 18rem;">
                                <img src="<%=rs.getString("image")%>" class="card-img-top" alt="Movie Poster">
                                <div class="card-body">
                                  <h5 class="card-title"><%=rs.getString("name")%></h5>
                                  
                                  <a href="moviedetail.jsp?movieId=<%=movieid%>" class="btn btn-warning">View More</a>
                                </div>
                            </div>
                             
                                  
                            <%
                            }
                            
                            %>
                            
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
                
                
                <script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
    </body>
</html>
