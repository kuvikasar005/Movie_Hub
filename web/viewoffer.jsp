<%-- 
    Document   : viewoffer
    Created on : 3 Jul, 2019, 2:52:59 PM
    Author     : VIKAS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Offers</title>
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	<link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
  rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
        <link href="https://fonts.googleapis.com/css?family=Montserrat&display=swap" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="CSS/viewoffer.css">
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
                    <a href="customerhome.jsp" type="button" class="btn btn-info btn-block mb-2" id="logout">Dashboard</a>

			<a href="logout.jsp" type="button" class="btn btn-info btn-block">Logout</a>
			<div>
				<a href="#"><i class="fa fa-facebook social-icons"></i></a>
				<a href="#"><i class="fa fa-envelope social-icons"></i></a>
				<a href="#"><i class="fa fa-instagram social-icons"></i></a>
				<a href="#"><i class="fa fa-twitter social-icons"></i></a>
			</div>	
			
            </div>
		<div class="sidebar-right">
			<h1>Offers</h1>
                    <%
                    
                    try
            {
                
                Class.forName("org.apache.derby.jdbc.ClientDriver");
                Connection cn= DriverManager.getConnection("jdbc:derby://localhost:1527/MovieHubDb");

                PreparedStatement ps= cn.prepareStatement("select * from OFFER");                                
                
                ResultSet rs=ps.executeQuery();
                
               //int i=0;
                    while(rs.next())
                    {
                        
                        %>
                        <div class="row">
				<div class="card text-white bg-dark mb-3 mr-auto" style="max-width: 18rem;">
					<div class="card-body">
						<h5 class="card-title"><%= rs.getString("OFFERID")%></h5>
						<p class="card-text"><%= rs.getString("description")%></p>
					</div>
				</div>
                                <%
                                    if(rs.next())
                                    {
                                %>
				<div class="card text-white bg-dark mb-3 mr-auto" style="max-width: 18rem;">
					<div class="card-body">
						<h5 class="card-title"><%= rs.getString("OFFERID")%></h5>
						<p class="card-text"><%= rs.getString("description")%></p>
					</div>
				</div>
                                <%
                                    }
                                    if(rs.next())
                                    {
                                %>
				<div class="card text-white bg-dark mb-3 mr-auto" style="max-width: 18rem;">
					<div class="card-body">
						<h5 class="card-title"><%= rs.getString("OFFERID")%></h5>
						<p class="card-text"><%= rs.getString("description")%></p>
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
    </body>
</html>
