        <%--
  Created by IntelliJ IDEA.
  User: rajee
  Date: 2/15/15
  Time: 12:20 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.sql.*"%>
<%
    ResultSet rs1 = null;
    try {
        String user = request.getParameter("user");
        String pass = request.getParameter("pass");
        Class.forName("com.mysql.jdbc.Driver").newInstance();
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/surveysample", "root", "root");
        Statement st = con.createStatement();
        ResultSet rs = st.executeQuery("select * from userdetail where name='" + user + "' and password='" + pass + "'");
        rs1 = st.executeQuery("select * from surveydetail");
        int count = 0;
        while (rs.next()) {
            count++;
        }
        if (count > 0) {
            out.println("welcome " + user);
        } else {
            response.sendRedirect("login.jsp");
        }
    } catch (Exception e) {
        System.out.println(e);
    }
%>


<html>
<script>
    function getIButtonId(clicked_id){
        
        alert(clicked_id);
        window.location.replace("ViewSurvey.jsp?surveyid="+clicked_id);

    }
</script>
<br>
<head>
    Summary Survey Details
</head>
<body>

    <h1>Recent Survey details</h1>
    <table border="3">
        <thead>survey details</thead>
        <th>No</th>
        <th>Family  name</th>
        <th>First  name</th>
        <th>Middle  name</th>
        <th>Gender</th>
        <th>Birthday</th>
        <th>Income Group</th>
        <th>Complete Address</th>
        <th>Cordinates</th>
        <th>Mobile number</th>
        <th>email address</th>
        <th>Present Internet Provider</th>
        <th>Positive comments with present provider</th>
        <th>Negative remarks with present provider</th>
        <% while (rs1.next()) {%>
        <tr>
            <td><%=rs1.getString("surveyid")%></td>
            <td ><%=rs1.getString("familyname") %></td>
            <td><%=rs1.getString("firstname") %></td>
            <td><%=rs1.getString("middlename") %></td>
            <td><%= rs1.getString("gender") %></td>
            <td><%= rs1.getString("dateofbirth")%></td>
            <td><%= rs1.getString("income")%></td>
            <td ><%=rs1.getString("complete_address")%></td>
            <td><%=rs1.getString("coordinates") %></td>
            <td><%=rs1.getString("mobilenumber") %></td>
            <td><%=rs1.getString("emailaddress") %></td>
            <td><%=rs1.getString("presentiprovider") %></td>
            <td><%=rs1.getString("comments") %></td>
            <td><%=rs1.getString("remarks") %></td>
            <td><input type="button" value="view" id="<%=rs1.getString("surveyid")%>" name="<%=rs1.getString("surveyid")%>" onclick="getIButtonId(this.id);"></td>
        </tr>
        <%}%>
    </table>
    <a href="CreateSurvey.jsp">Create New Survey</a>
    <form name="SurveyMenu" action="SurveyMenu" method="get">
        <input type="submit" value="Create new Survey" name="CreateSurvey" onclick="document.forms[0].action = 'CreateSurvey.jsp'; return true;" />
        &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
        <input type="reset" value="Cancel" name="Cancel"  />
    </form>

</body>
</html>
