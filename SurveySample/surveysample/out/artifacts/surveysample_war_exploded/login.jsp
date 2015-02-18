<%--
  Created by IntelliJ IDEA.
  User: rajee
  Date: 2/15/15
  Time: 12:18 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<script>
    function validate(){
        var username=document.form.user.value;
        var password=document.form.pass.value;
        if(username==""){
            alert("Enter Username!");
            return false;
        }
        if(password==""){
            alert("Enter Password!");
            return false;
        }
        return true;
    }
</script>
<form name="form" method="post" action="check.jsp" onsubmit="javascript:return validate();">
    <table>
        <tr><td>Username:</td><td><input type="text" name="user"></td></tr>
        <tr><td>Password:</td><td><input type="password" name="pass"></td></tr>
        <tr><td></td><td><input type="submit" value="Login"></td></tr>
        <tr><td></td><td><a href="register.jsp">Register Here</a></td></tr>
    </table>
</form>
</html>
