<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%--
  Created by IntelliJ IDEA.
  User: rajee
  Date: 2/18/15
  Time: 1:58 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
</head>
<%
    String surveyId = (String) session.getAttribute("surveyid");
    out.println("check delete page " + surveyId);
    int new_survey_id = Integer.parseInt(surveyId);

    request.setAttribute("surveyid", surveyId);


    Class.forName("com.mysql.jdbc.Driver").newInstance();
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/surveysample", "root", "root");
    String query = "delete from surveydetail where surveyid ="+ new_survey_id ;
    Statement stmt = con.createStatement();
    int deletedRow = stmt.executeUpdate(query);

    if(deletedRow > 0){
        out.println("record has been deleted row");
    }
    else{
        out.println("record has not  been deleted row");
    }

%>
<body>

</body>
</html>
