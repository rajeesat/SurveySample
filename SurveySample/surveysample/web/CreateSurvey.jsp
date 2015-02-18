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
<body>
<h2>simple survey form</h2>
<form name="surveyform" method="post" action="CreateSurvey">
    <table>
        <tr><td>Family  name:</td><td><input type="text" name="familyName"></td></tr>
        <tr><td>First  name:</td><td><input type="text" name="firstName"></td></tr>
        <tr><td>Middle  name:</td><td><input type="text" name="middleName"></td></tr>
        <tr><td>Gender:</td><td><input type="radio" name="sex" value="male" checked>Male</td><td><input type="radio" name="sex" value="female">Female</td></tr>
        <tr><td>Birthday:</td><td><input type="date" name="dob"></td></tr>
        <tr><td>Income : A?B?C?D?</td><td><input type="text" name="income"></td></tr>
        <tr><td>Complete Address:</td><td><input type="text" name="address"></td></tr>
        <tr><td>Coordinates:</td><td><input type="text" name="coordinates"></td></tr>
        <tr><td>Mobile number:</td><td><input type="tel" name="mobileno"></td></tr>
        <tr><td>Email Address:</td><td><input type="email" name="email"></td></tr>
        <tr><td>Present internet provider:</td><td><input type="text" name="iprovider"></td></tr>
        <tr><td>Positive comments with present provider:</td><td><textarea name="comments" cols="40" rows="5"  ></textarea></td></tr>
        <tr><td>Negative remarks with present provider:</td><td><textarea name="remarks" cols="40" rows="5" ></textarea></td></tr>
        <tr><td><input type="submit" name="addsurvey" value="save survey details"></td><td><input type="reset" name="cancel" value="cancel"></td></tr>
    </table>

</form>

</body>
</html>
