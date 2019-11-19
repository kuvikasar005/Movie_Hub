<%--
Document   : ticketGenerator
Created on : 18 Nov, 2019, 8:25:42 PM
Author     : VIKAS
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@page import="java.sql.*"%>
        <%@page import="java.util.Random"%>
    </head>
    <body>
        
        <%

        String em = (String)session.getAttribute("email");
        // int showId = Integer.parseInt(request.getParameter("showId"));
        int showId = Integer.parseInt(request.getParameter("showId"));
        int seatsSelected = Integer.parseInt(request.getParameter("selectedSeats"));
        Random rand = new Random();
        int a = rand.nextInt(10000);
        int b = rand.nextInt(20000);
        int ticketId = (a>b)?a*a:b*b;
        try
        {
        
        Class.forName("org.apache.derby.jdbc.ClientDriver");
        Connection cn= DriverManager.getConnection("jdbc:derby://localhost:1527/MovieHubDb");
        PreparedStatement ps= cn.prepareStatement("insert into TICKETS values(?,?,?,?)");
          
        ps.setInt(1, ticketId);
        ps.setInt(2, showId);
        ps.setInt(3, seatsSelected);
        ps.setString(4, em);
        
        ps.execute();

        ps = cn.prepareStatement("select * from SHOWS where SHOWID = ?");
        ps.setInt(1, showId);
        ResultSet rs = ps.executeQuery();
        int totalSeats = 0;
        if(rs.next())
            totalSeats = rs.getInt("SEATS");

        ps = cn.prepareStatement("update SHOWS set SEATS = ? where SHOWID = ?");
        ps.setInt(1, totalSeats - seatsSelected);
        ps.setInt(2, showId);
        ps.executeUpdate();


        cn.close();
        

        }
        catch(Exception ex)
        {
        out.print(ex);
        }
        %>
        <script type="text/javascript">
            window.location.href = "bookSuccess.jsp?ticketId=<%=ticketId%>";
        </script>
        <h1></h1>
    </body>
</html>