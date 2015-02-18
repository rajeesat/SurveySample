package com.survey;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Date;

/**
 * Created by rajee on 2/15/15.
 */
public class SurveyConfig extends HttpServlet {

    public String familyName;
    public String firstName;
    public String middlename;
    public String gender;
    public String dateOfBirth;
    public String income;
    public String completeAddress;
    public String coordinates;
    public String mobileno;
    public String emailAddress;
    public String presentIP;
    public String comment;
    public String remark;


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        familyName = request.getParameter("familyName");
        firstName = request.getParameter("firstName");
        middlename = request.getParameter("middleName");
        gender = request.getParameter("sex");
        dateOfBirth = request.getParameter("dob");
        income = request.getParameter("income");
        completeAddress = request.getParameter("address");
        coordinates = request.getParameter("coordinates");
        mobileno = request.getParameter("mobileno");
        emailAddress = request.getParameter("email");
        presentIP = request.getParameter("iprovider");
        comment = request.getParameter("comments");
        remark = request.getParameter("remarks");
        System.out.println(familyName);
        System.out.println(firstName);
        System.out.println(middlename);
        System.out.println(gender);
        System.out.println(dateOfBirth);
        System.out.println(income);
        System.out.println(completeAddress);
        System.out.println(coordinates);
        System.out.println(mobileno);
        System.out.println(emailAddress);
        System.out.println(presentIP);
        System.out.println(comment);
        System.out.println(remark);

        response.setContentType("text/html");
        PrintWriter pw = response.getWriter();

        Connection conn=null;
        String url="jdbc:mysql://localhost:3306/";
        String dbName="surveysample";
        String driver="com.mysql.jdbc.Driver";
        //String dbUserName="root";
        //String dbPassword="root";

        try{


            Class.forName(driver).newInstance();
            conn = DriverManager.getConnection(url+dbName,"root", "root");
            PreparedStatement pst =(PreparedStatement) conn.prepareStatement("insert into surveysample.surveydetail(familyname,firstname,middlename,gender,dateofbirth,income,complete_address,coordinates,mobilenumber,emailaddress,presentiprovider,comments,remarks) values (?,?,?,?,?,?,?,?,?,?,?,?,?)");//try2 is the name of the table

            pst.setString(1,familyName);
            pst.setString(2,firstName);
            pst.setString(3,middlename);
            pst.setString(4,gender);
            pst.setString(5,dateOfBirth);
            pst.setString(6,income);
            pst.setString(7,completeAddress);
            pst.setString(8,coordinates);
            pst.setString(9,mobileno);
            pst.setString(10,emailAddress);
            pst.setString(11,presentIP);
            pst.setString(12,comment);
            pst.setString(13,remark);


            int i = pst.executeUpdate();
            //conn.commit();
            String msg=" ";
            if(i!=0){
                msg="Record has been inserted";
                pw.println("<font size='6' color=blue>" + msg + "</font>");


            }
            else{
                msg="failed to insert the data";
                pw.println("<font size='6' color=blue>" + msg + "</font>");
            }
            pst.close();
        }
        catch (Exception e){
            pw.println(e);
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
