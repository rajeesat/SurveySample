<%--
  Created by IntelliJ IDEA.
  User: rajee
  Date: 2/18/15
  Time: 3:26 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<script>
    function validate(){
        var to=document.form.to.value;
        var from=document.form.from.value;
        var subject=document.subject.to.value;
        var body=document.form.body.value;
        if(to==""){
            alert("Enter mailer address!");
            return false;
        }
        if(from==""){
            alert("Enter sender address!");
            return false;
        }
        if(subject==""){
            alert("Enter subject!");
            return false;
        }
        if(body==""){
            alert("Enter body!");
            return false;
        }
        return true;
    }
</script>
<head>
    <title>Sending Mail Through JSP</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width">
</head>
<body bgcolor="khaki">
<form method="post" action="MailSurveyDetailFinish.jsp" onsubmit="javascript:return validate();">
    <table>
        <tr><td>To</td><td><input type="email" name="to" id="tolable"></td></tr>
        <tr><td>From</td><td><input type="email" name="from"  id="fromlable"></td></tr>
        <tr><td>Subject</td><td><input type="text" name="subject" id="subjectlable"></td></tr>
        <tr><td>Body</td><td><input type="text" name="body"  id="bodylable"></td></tr>
        <tr><td><input type="submit" value="send-email" name="mailbtn"></td></tr>
    </table>
</form>
</body>
</html>
