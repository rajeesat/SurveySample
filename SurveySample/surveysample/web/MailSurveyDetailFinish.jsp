<%--
  Created by IntelliJ IDEA.
  User: rajee
  Date: 2/18/15
  Time: 4:01 PM
  To change this template use File | Settings | File Templates.
--%>
<html>
<head>
    <title>JSP JavaMail Example </title>
</head>
<body>
<%@ page import="javax.mail.MessagingException" %>
<%@ page import="javax.mail.Session" %>
<%@ page import="javax.mail.Transport" %>
<%@ page import="javax.mail.internet.AddressException" %>
<%@ page import="javax.mail.internet.InternetAddress" %>
<%@ page import="javax.mail.internet.MimeMessage" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.util.Properties" %>
<%
    String host = "localhost";
    String to = request.getParameter("to");
    String from = request.getParameter("from");
    String subject = request.getParameter("subject");
    String messageText = request.getParameter("body");
    boolean sessionDebug = false;
// Create some properties and get the default Session.
    Properties props = System.getProperties();
    props.put("mail.host", host);
    props.put("mail.transport.protocol", "smtp");
    Session mailSession = Session.getDefaultInstance(props, null);

// Set debug on the Session
// Passing false will not echo debug info, and passing True will.

    mailSession.setDebug(sessionDebug);

// Instantiate a new MimeMessage and fill it with the
// required information.


    try {
        MimeMessage msg = new MimeMessage(mailSession);
        msg.setFrom(new InternetAddress(from));
        InternetAddress[] address = {new InternetAddress(to)};
        msg.setRecipients(MimeMessage.RecipientType.TO, address);
        msg.setSubject(subject);
        msg.setSentDate(new Date());
        msg.setText(messageText);

        Transport transport = mailSession.getTransport(String.valueOf(mailSession));
        transport.connect("smtp.gmail.com", 465, "username", "password");
        transport.sendMessage(msg, msg.getAllRecipients());
        transport.close();

    } catch (AddressException e) {
        out.println("****exception address****" + e.getMessage());
    } catch (MessagingException e) {
        out.println("****exception messaging****" + e.getMessage());
    }
// Hand the message to the default transport service
// for delivery.


    out.println("Mail was sent to " + to);
    out.println(" from " + from);
    out.println(" using host " + host + ".");
%>
</table>
</body>
</html>