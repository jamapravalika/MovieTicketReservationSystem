<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import="java.util.List" %>
<%@ page import="com.Model.Movie" %> 
<%@ page import="java.util.Base64" %>
<%@ page import="java.sql.Blob" %>
<%@ page import="java.io.InputStream" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Movies</title>
</head>
<body>
<%@ include file="Header.jsp" %>
	<table border="2">
        <tr>
            <th>Movie Name</th>
            <th>Director</th>
            <th>Release Date</th>
            <th>Casts</th>
            <th>Description</th>
            <th>Duration</th>
            <th>Poster</th>
            <th>trailer link</th> 
             <th>genre</th>
        </tr>
        
        <% List<Movie> movies = (List<Movie>) request.getAttribute("movies");
   if (movies != null) {
       for (Movie movie : movies) { %>
        <tr>
            <td><%= movie.getMovie_Name() %></td>
            <td><%= movie.getMovie_Director() %></td>
            <td><%= movie.getMovie_Release_Date() %></td>
            <td><%= movie.getMovie_Casts() %></td>
            <td><%= movie.getMovie_Description() %></td> 
            <td><%= movie.getMovie_Duration() %> min</td>
            <td><img src="images/<%= movie.getMovie_Poster() %>" alt="Movie Poster" /></td>

            <td><%= movie.getTrailerlink() %> min</td>
            <td><%= movie.getGenre() %></td>
            
 
           <%--  <td><img src="data:image/jpeg;base64, <%= Base64.getEncoder().encodeToString(movie.getMovie_Poster()) %>" alt="Movie Poster" /></td>         			
            <td><%= movie.getMovie_Duration() %></td>
            <%
                Blob posterBlob = movie.getMovie_Poster();
                if (posterBlob != null) {
                    InputStream posterStream = posterBlob.getBinaryStream(1, posterBlob.length());
                    byte[] posterData = new byte[(int) posterBlob.length()];
                    posterStream.read(posterData);
                    String base64Poster = Base64.getEncoder().encodeToString(posterData);
            %>
            <td><img src="data:image/jpeg;base64, <%= base64Poster %>" alt="Movie Poster" /></td>
            <%
                } // Close the inner if block here
            %> --%>
        </tr>        
    <%
       } // Close the outer for loop here
   } // Close the outer if block here
%>
	
    </table>
	
</body>
</html>