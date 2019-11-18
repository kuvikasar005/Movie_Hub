<%-- 
    Document   : customerProfile
    Created on : 6 Jul, 2019, 1:06:35 PM
    Author     : VIKAS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
	<title>Profile</title>

	<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	<link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
  rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
    <link href="https://fonts.googleapis.com/css?family=Montserrat|Nunito+Sans&display=swap" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="CSS/customerProfile.css">
    <%@page import="java.sql.*"%>
</head>
<body>
	<div class="main-container">
		<div class="sidebar-left">
			<img class="sidebar-logo" src="Images/logo.png">
			<%
                    String em = (String)session.getAttribute("email");
                    String name,password;
                    String mobileno;
                    name="";
                    password="";
                    mobileno="";
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
                    name = user_name;
                    password = rs.getString("password");
                    mobileno = rs.getString("mob");
                    %><h5>Hello <% 
                    out.print(user_name);
                            %></h5><%
                cn.close();
                }
                
            %>
			<h4></h4>
			<a href="customerhome.jsp" type="button" class="btn btn-info btn-block mb-2">Dashboard</a>
			<a href="logout.jsp" type="button" class="btn btn-info btn-block">Logout</a>
			<div>
				<a href="#"><i class="fa fa-facebook social-icons"></i></a>
				<a href="#"><i class="fa fa-envelope social-icons"></i></a>
				<a href="#"><i class="fa fa-instagram social-icons"></i></a>
				<a href="#"><i class="fa fa-twitter social-icons"></i></a>
			</div>	
			
		</div>

		<div class="sidebar-right">
			<div class="btn-container">
				<button class="btn btn-outline-info active mt-5 mr-2" id="view-profile-btn">View Profile</button>
				<button class="btn btn-outline-info mt-5 mr-2" id="edit-profile-btn">Edit Profile</button>
			</div>
                    
                    <div id="edit-profile">
                            <form action="updateCustomerProfile.jsp" method="post">
					<label>Name</label>
					<input type="text" name="nm" value="<%=name%>"><br>
					<label>Email</label>
					<input type="email" name="em" value=<%=em%>><br>
					<label>Mobile No</label>
					<input type="number" name="mob" value=<%=mobileno%> ><br>
					<label>Passsword</label>
					<input type="text" name="pwd" value=<%=password%>><br>
					<button type="submit" class="btn btn-danger" id="save-profile-btn">Save Changes</button>
                            </form>
			</div>
			<p id="edit-note">Note: Leave the fields unchanged you don't wish to update.</p>

			<table>
                            
				<tr>
					<td>
						<font>Name</font>
					</td>
					<td>
						<font><%out.print(name);%></font>
					</td>
				</tr>

				<tr>
					<td>
						<font>Email</font>
					</td>
					<td>
						<font><%out.print(em);%></font>
					</td>
				</tr>

				<tr>
					<td>
						<font>Mobile No</font>
					</td>
					<td>
						<font><%out.print(mobileno);%></font>
					</td>
				</tr>

				<tr>
					<td>
						<font>Password</font>
					</td>
					<td>
						<font><%out.print(password);%></font>
					</td>
				</tr>
			</table>

			
		</div>
                  
                        
                        <%
                                        
                }
            catch(Exception ex)
            {
                 out.print(ex);
            }
		
		%> 
	</div>
	<script type="text/javascript" src="Scripts/profile.js"></script>
</body>
</html>