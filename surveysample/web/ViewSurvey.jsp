<%--
  Created by IntelliJ IDEA.
  User: rajee
  Date: 2/16/15
  Time: 10:17 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="java.sql.*"%>
<html>
<head>
    <title>Welcome to survey</title>
</head>
<script type="text/javascript">
    function printpage() {
        //Get the print button and put it into a variable
        var printButton = document.getElementById("printpagebutton");
        //Set the print button visibility to 'hidden'
        printButton.style.visibility = 'hidden';
        editbtn.style.visibility = 'hidden';
        deletebtn.style.visibility = 'hidden';
        printButton.style.visibility = 'hidden';
        mailbtn.style.visibility = 'hidden';
        backbtn.style.visibility = 'hidden';
        //Print the page content
        window.print()
        //Set the print button to 'visible' again
        //[Delete this line if you want it to stay hidden after printing]
        printButton.style.visibility = 'visible';
        editbtn.style.visibility = 'visible';
        deletebtn.style.visibility = 'visible';
        printButton.style.visibility = 'visible';
        mailbtn.style.visibility = 'visible';
        backbtn.style.visibility = 'visible';
    }

</script>
<body>

<%
    ResultSet rset;
    String sur_id = request.getParameter("surveyid");
    session.setAttribute( "surveyid", sur_id );
    int new_survey_id = Integer.parseInt(sur_id);

    if (request.getParameter("surveyid") == null) {
        out.println("Please enter your name.");
    } else {
       // out.println("Hello <b>"+request.getParameter("surveyid")+"</b>!");
    }
    Class.forName("com.mysql.jdbc.Driver").newInstance();
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/surveysample", "root", "root");
    String query = "select * from surveydetail where surveyid ="+ new_survey_id ;
    Statement stmt = con.createStatement();
    rset = stmt.executeQuery(query);

    while(rset.next()){
//        out.println(rset.getString(1));
//        out.println(rset.getString(2));
//        out.println(rset.getString(3));
//        out.println(rset.getString(4));
        %>
        <h1>Survey Detail for<%=" "+rset.getString(2)%></h1>
        <table border="3">
            <tr><td>Survey_Id</td><td><%=rset.getString(1)%></td></tr>
            <tr><td>Family name</td><td><%=rset.getString(2)%></td></tr>
            <tr><td>First name</td><td><%=rset.getString(3)%></td></tr>
            <tr><td>Middle name</td><td><%=rset.getString(4)%></td></tr>
            <tr><td>gender</td><td><%=rset.getString(5)%></td></tr>
            <tr><td>dat of birth</td><td><%=rset.getString(6)%></td></tr>
            <tr><td>income</td><td><%=rset.getString(7)%></td></tr>
            <tr><td>complete address</td><td><%=rset.getString(8)%></td></tr>
            <tr><td>coordinates</td><td><%=rset.getString(9)%></td></tr>
            <tr><td>mobile number</td><td><%=rset.getString(10)%></td></tr>
            <tr><td>email address</td><td><%=rset.getString(11)%></td></tr>
            <tr><td>present Internet provider</td><td><%=rset.getString(12)%></td></tr>
            <tr><td>comments</td><td><%=rset.getString(13)%></td></tr>
            <tr><td>remarks</td><td><%=rset.getString(14)%></td></tr>
            <br>
            <form>
                <table>
                    <tr><td><input id="editbtn" type="button" value="edit" onclick="javascript:document.forms[0].action = 'EditSurvey.jsp'; document.forms[0].submit();"></td>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
                        <td><input id="deletebtn" type="button" value="delete" onclick="javascript:document.forms[0].action = 'DeleteSurvey.jsp'; document.forms[0].submit();"></td>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
                        <td><input id="printpagebutton" type="button" value="Print this page" onclick="printpage()"/>`</td>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
                        <td><input id="mailbtn" type="button" value="send mail" onclick="javascript:document.forms[0].action = 'MailSurveyDetail.jsp'; document.forms[0].submit();"></td>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
                        <td><input id="backbtn" type="button" value="back" onclick="javascript:document.forms[0].action = 'check.jsp'; document.forms[0].submit();"></td>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
                    </tr>
                </table>
            </form>


        </table>
        <%
    }

%>



</body>
</html>
