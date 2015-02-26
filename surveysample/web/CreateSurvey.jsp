<%--
  Created by IntelliJ IDEA.
  User: rajee
  Date: 2/15/15
  Time: 1:19 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>
    <title>Create new Survey</title>
</head>
<body onload="getCurrentTime()">
<h2>simple survey form</h2>
<form name="surveyform" method="post" action="CreateSurvey">
    <table>
        <tr><td>Family  name:</td><td><input type="text" name="familyName" style="width:200px;font-size:14pt;"></td></tr>
        <tr><td>First  name:</td><td><input type="text" name="firstName" style="width:200px;font-size:14pt;"></td></tr>
        <tr><td>Middle  name:</td><td><input type="text" name="middleName" style="width:200px;font-size:14pt;"></td></tr>
        <tr><td>Gender:</td><td><input type="radio" name="sex" value="male" checked>Male</td><td><input type="radio" name="sex" value="female">Female</td></tr>
        <tr><td>Birthday:</td><td><input type="date" name="dob"></td></tr>
        <tr><td>Income : A?B?C?D?</td><td><input type="text" name="income" style="width:200px;font-size:14pt;"></td></tr>
        <tr><td>Complete Address:</td><td><input type="text" name="address" id="address" onchange="codeAddress();" style="width:200px;font-size:14pt;"></td></tr>
        <tr><td>Coordinates:</td><td><input type="text" id="coordinates" name="coordinates" style="width:200px;font-size:14pt;" readonly></td></tr>
        <tr><td>Mobile number:</td><td><input type="tel" name="mobileno" style="width:200px;font-size:14pt;"></td></tr>
        <tr><td>Email Address:</td><td><input type="email" name="email" style="width:200px;font-size:14pt;"></td></tr>
        <tr><td>Present internet provider:</td><td><input type="text" name="iprovider" style="width:200px;font-size:14pt;"></td></tr>
        <tr><td>Positive comments with present provider:</td><td><textarea name="comments" cols="40" rows="5"  ></textarea></td></tr>
        <tr><td>Negative remarks with present provider:</td><td><textarea name="remarks" cols="40" rows="5" ></textarea></td></tr>
        <tr><td>Time started:</td><td><input type="text" name="startTime" id="startTime"></td></tr>
        <tr><td>Time Ended:</td><td><input type="text" name="endTime" id="endTime"></td></tr>
        <tr><td><input type="submit" name="addsurvey" value="save survey details"></td><td><input type="submit" name="backbtn" value="back" onclick="document.forms[0].action = 'check.jsp'; return true;"></td></tr>
    </table>

</form>

</body>
<script src="https://maps.googleapis.com/maps/api/js?v=3.exp&signed_in=true"></script>
<script runat=server>
    var geocoder;
    var map;
    var s_hour;
    var s_minute;
    var s_seconds;

    var r_hour;
    var r_minute;
    var r_seconds;

    var start_time;
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
        geocoder.geocode( { 'address': address}, function(results, status) {
            if (status == google.maps.GeocoderStatus.OK) {
                //alert(results[0].geometry.location);
                var text3 = results[0].geometry.location;
                //alert(text3);
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

    function getCurrentTime(){

        s_hour = new Date().getHours();
        s_minute = new Date().getMinutes();
        s_seconds = new Date().getSeconds();

        start_time = s_hour+"h:"+s_minute+"m:"+s_seconds+"s";
        //alert("testing page onload"+start_time);
        document.getElementById('startTime').value = start_time;
    }
    window.onbeforeunload = confirmExit;
    function confirmExit()
    {
        r_hour = new Date().getHours();
        r_minute = new Date().getMinutes();
        r_seconds = new Date().getSeconds();

        var returnTime = r_hour+"h:"+r_minute+"m:"+r_seconds+"s";

        //alert(returnTime);
        document.getElementById('endTime').value = returnTime;
        alert("You have added survey details for time in seconds "+ returnTime);
    }
</script>
</html>
