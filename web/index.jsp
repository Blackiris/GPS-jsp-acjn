<%--
    Document   : index
    Created on : 3 févr. 2013, 17:34:20
    Author     : julien
--%>



<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin</title>

        <script type="text/javascript"
          src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDzCjQiHDUmSRgLpZYHq7tWwJ5oPjvHUVc&sensor=false">
        </script>

        <script type="text/javascript">
          function initialize() {
            var mapOptions = {
              center: new google.maps.LatLng(-34.397, 150.644),
              zoom: 8,
              mapTypeId: google.maps.MapTypeId.ROADMAP
            };
            var map = new google.maps.Map(document.getElementById("map_canvas"),
                mapOptions);

            var myLatlng = new google.maps.LatLng(-25.363882,131.044922);
            
            var markers = new Array();
            <%
            try {
                fr.emse.server.AdminService service = new fr.emse.server.AdminService();
                fr.emse.server.AdminBean port = service.getAdminBeanPort();
                // TODO process result here
                java.util.List<fr.emse.server.Note> notes = port.getNotes();
                
                
                for (int i=0; i<notes.size(); i++) {
                    fr.emse.server.SCoordinate coord = notes.get(i).getCoordinate();
                    
                    String markerTxt = "var marker = new google.maps.Marker({"+
                                        "position: new google.maps.LatLng("+coord.getLat()+","+coord.getLon()+"),"+
                                        "title:\""+notes.get(i).getComments()+"\""+
                                        "});marker.setMap(map);";
                    out.println(markerTxt+"markers["+i+"]=marker;");
                }
            } catch (Exception ex) {
                // TODO handle custom exceptions here
            }
            %>
          }
        </script>

    </head>
    <body onload="initialize();">
        <h1>Bienvenue Maitre!</h1>

        <div id="map_canvas" style="width: 900px; height: 500px"></div>

    <hr/>




        <h2>Créer une note</h2>



        <form action="createNote.jsp">
            <table>
                <tr>
                    <td>Lat:<input type="text" name="lat"/></td>
                    <td>Long:<input type="text" name="long"/></td>
                </tr>
                <tr>
                    <td>Hauteur (mètre):<input type="text" name="height"/></td>
                </tr>
                <tr>
                    <td>Commentaires:<textarea type="text" name="comments"></textarea></td>
                </tr>
                <tr>
                    <td>Catégorie:<input type="text" name="category"/></td>
                </tr>
                <tr>
                    <td><input type="submit" name="submit" value="Créer note"/></td>
                </tr>
            </table>
        </form>


    </body>
</html>
