package com.survey;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Properties;

/**
 * Created by rajee on 2/26/15.
 */
public class MailConfig extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response){
        try {
            new MailConfig().run();
        } catch (MessagingException e) {
            e.printStackTrace();
        }
    }
    private void run() throws MessagingException {
        Message message = new MimeMessage(getSession());

        message.addRecipient(MimeMessage.RecipientType.TO, new InternetAddress("Akakram91@gmail.com"));
        message.addFrom(new InternetAddress[] { new InternetAddress("srajeenthini@gmail.com") });

        message.setSubject("the subject");
        message.setContent("the body", "text/plain");

        Transport.send(message);
    }

    private Session getSession() {
        Authenticator authenticator = new Authenticator();

//        Properties properties = new Properties();
//        properties.setProperty("mail.smtp.submitter", authenticator.getPasswordAuthentication().getUserName());
//        properties.setProperty("mail.smtp.auth", "true");
//
//        properties.setProperty("mail.smtp.host", "smtp.gmail.com");
//        properties.setProperty("mail.smtp.port", "25");


        Properties props = new Properties ();
        props.setProperty ("mail.transport.protocol", "smtp");
        props.setProperty ("mail.host", "smtp.gmail.com");
        props.setProperty ("mail.user", "srajeenthini@gmail.com");
        props.setProperty ("mail.password", "9sanja90");

        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.auth", "true");

        return Session.getInstance(props, authenticator);
    }

    private class Authenticator extends javax.mail.Authenticator {
        private PasswordAuthentication authentication;

        public Authenticator() {
            String username = "srajeenthini@gmail.com";
            String password = "9sanja90";
            authentication = new PasswordAuthentication(username, password);
        }

        protected PasswordAuthentication getPasswordAuthentication() {
            return authentication;
        }
    }
}
