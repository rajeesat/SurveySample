<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="com.survey.EditSurvey" %>
<%--
  Created by IntelliJ IDEA.
  User: rajee
  Date: 2/17/15
  Time: 2:24 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Edit survey</title>
</head>
<body>
<%
    ResultSet resultSet;
    String surveyId = (String) session.getAttribute("surveyid");
    out.println("check"+surveyId);

    request.setAttribute("surveyid", surveyId);


    Class.forName("com.mysql.jdbc.Driver").newInstance();
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/surveysample", "root", "root");
    String query = "select * from surveydetail where surveyid ="+ surveyId ;
    Statement stmt = con.createStatement();
    ResultSet rset = stmt.executeQuery(query);

    while(rset.next()){
%>
    <form name="Editsurveyform" method="post" action="EditSurvey">
        <table>
            <tr><td>Family  name:</td><td><input type="text" name="familyName" value='<%=rset.getString(2)%>'></td></tr>
            <tr><td>First  name:</td><td><input type="text" name="firstName" value='<%=rset.getString(3)%>'></td></tr>
            <tr><td>Middle  name:</td><td><input type="text" name="middleName" value='<%=rset.getString(4)%>'></td></tr>
            <tr><td>Gender:</td>
                <td>
                    <%
                        if(rset.getString(5).equals("male")){
                    %>
                    <input type="radio" name="sex" value="male" checked>Male
                    <input type="radio" name="sex" value="female">Female
                    <%}
                        else{
                    %>
                     <input type="radio" name="sex" value="male">Male
                     <input type="radio" name="sex" value="female" checked>Female
                    <%
                        }
                    %>
                </td>
            </tr>
            <tr><td>Birthday:</td><td><input type="date" name="dob" value='<%=rset.getString(6)%>'></td></tr>
            <tr><td>Income : A?B?C?D?</td><td><input type="text" name="income" value='<%=rset.getString(7)%>'></td></tr>
            <tr><td>Complete Address:</td><td><input type="text" name="address" id="address" value='<%=rset.getString(8)%>' onchange="codeAddress();"></td></tr>
            <tr><td>Coordinates:</td><td><input type="text" name="coordinates"  value='<%=rset.getString(9)%>' readonly></td></tr>
            <tr><td>Mobile number:</td><td><input type="tel" name="mobileno" value='<%=rset.getString(10)%>'></td></tr>
            <tr><td>Email Address:</td><td><input type="email" name="email" value='<%=rset.getString(11)%>'></td></tr>
            <tr><td>Present internet provider:</td><td><input type="text" name="iprovider" value='<%=rset.getString(12)%>'></td></tr>
            <tr><td>Positive comments with present provider:</td><td><textarea name="comments" cols="40" rows="5"><%=rset.getString(13)%></textarea></td></tr>
            <tr><td>Negative remarks with present provider:</td><td><textarea name="remarks" cols="40" rows="5"><%=rset.getString(14)%></textarea></td></tr>
            <tr><td><input type="submit" name="editsurvey" value="update survey details"></td><td><input id="backbtn" type="button" value="back" onclick="javascript:document.forms[0].action = 'check.jsp'; document.forms[0].submit();"></td></tr>
        </table>

    </form>
<%}
    //response.sendRedirect("EditSurvey?surveyId="+surveyId);
%>
</body>
<script src="https://maps.googleapis.com/maps/api/js?v=3.exp&signed_in=true"></script>
<script runat=server>
    var geocoder;
    var map;
    var seconds;
    function initialize() {
        geocoder = new google.maps.Geocoder();
        var latlng = new google.maps.LatLng(-34.397, 150.644);
        var mapOptions = {
            zoom: 8,
            center: latlng
        }
        map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);
    }

    function codeAddress() {

        var address = document.getElementById('address').value;
        alert("testing"+address);
        geocoder.geocode( { 'address': address}, function(results, status) {
            if (status == google.maps.GeocoderStatus.OK) {
                alert(results[0].geometry.location);
                var text3 = results[0].geometry.location;
                alert(text3);
                document.getElementsByName('coordinates')[0].value = text3;
                map.setCenter(results[0].geometry.location);
                var marker = new google.maps.Marker({
                    map: map,
                    position: results[0].geometry.location
                });

            } else {
                alert('Geocode was not successful for the following reason: ' + status);

            }
        });
    }

    google.maps.event.addDomListener(window, 'load', initialize);


</script>
</html>
