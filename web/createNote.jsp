<%-- 
    Document   : createNote
    Created on : 3 févr. 2013, 17:43:39
    Author     : julien
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Adding note</title>
    </head>
    <body>
        <h1>Adding note</h1>
    <%-- start web service invocation --%><hr/>
    <%
    try {
        double lat = Double.valueOf(request.getParameter("lat"));
        double lon = Double.valueOf(request.getParameter("long"));
        int height = Integer.valueOf(request.getParameter("height"));
        String comments = request.getParameter("comments");
        String category = request.getParameter("category");
        
	fr.emse.server.AdminService service = new fr.emse.server.AdminService();
	fr.emse.server.AdminBean port = service.getAdminBeanPort();
    
        fr.emse.server.SCoordinate coordinate = new fr.emse.server.SCoordinate();
        coordinate.setLat(lat);
        coordinate.setLon(lon);
	fr.emse.server.Note note = new fr.emse.server.Note();
        note.setCoordinate(coordinate);
        note.setHeight(height);
        note.setComments(comments);
        note.setCategory(category);
        
	port.addNote(note);
    } catch (Exception ex) {
	// TODO handle custom exceptions here
    }
    %>
    <%-- end web service invocation --%><hr/>
    </body>
</html>
