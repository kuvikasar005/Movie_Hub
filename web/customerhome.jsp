<%-- 
    Document   : customerhome
    Created on : 2 Jul, 2019, 9:30:48 AM
    Author     : VIKAS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home</title>
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	<link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
  rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
        
        <link rel="stylesheet" type="text/css" href="CSS/customerhome.css">
        <%@page import="java.sql.*"%>
    </head>
    <body>
        <div class="main-container">
            <div class="sidebar-left">
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
                    
			<a href="logout.jsp" type="button" class="btn btn-info btn-block" id="logout">Logout</a>
			<div>
				<a href="#"><i class="fa fa-facebook social-icons"></i></a>
				<a href="#"><i class="fa fa-envelope social-icons"></i></a>
				<a href="#"><i class="fa fa-instagram social-icons"></i></a>
				<a href="#"><i class="fa fa-twitter social-icons"></i></a>
			</div>	
			
            </div>
		<div class="sidebar-right">
			<a href="customerProfile.jsp">
				<div>
				<img src="Images/user.png" width="120" height="120">
				<h3>Profile</h3>
				</div>
			</a>
			<a href="viewmovie.jsp">
				<div>
					<img src="Images/movie3.webp" width="140" height="140">
					<h3 class="collection" style="left: -3px;">Movies</h3>
				</div>
			</a>
			<a href="viewhall.jsp">
				<div>
					<img src="Images/hall2.png" width="120" height="120">
					<h3>Halls</h3>
				</div>
			</a>
			<a href="viewoffer.jsp">
				<div>
					<img src="Images/offer8.png" width="120" height="120">
					<h3>Offers</h3>
				</div>
			</a>
			<a href="bookHistory.jsp">
				<div>
					<img src="Images/history2.png" width="120" height="120">
					<h3>Booking History</h3>
				</div>
			</a>
			<a href="#">
				<div>
					
				</div>
			</a>
			<a href="#">
				<div>
				
				</div>
			</a>
			<a href="#">
				<div>
				
				</div>
			</a>
		</div>
	</div>
    </body>
</html>
