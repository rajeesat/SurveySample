<%--
  Created by IntelliJ IDEA.
  User: rajee
  Date: 2/18/15
  Time: 3:26 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Sending Mail Through JSP</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width">
</head>
<body bgcolor="khaki">
<form action="MailSurveyDetailFinish.jsp">
    <table>
        <tr><td>To</td><td><input name="to" id="tolable"></td></tr>
        <tr><td>From</td><td><input name="from"  id="fromlable"></td></tr>
        <tr><td>Subject</td><td><input name="subject" id="subjectlable"></td></tr>
        <tr><td>Body</td><td><input name="body"  id="bodylable"></td></tr>
        <tr><td>Body</td><td><input type="submit" value="send-email" name="mailbtn"></tr>
    </table>
</form>
</body>
</html>
