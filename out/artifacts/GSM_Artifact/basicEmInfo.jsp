<%@ page import="org.hasan.model.EmployeeInformation" %><%--
  Created by IntelliJ IDEA.
  User: ENVY
  Date: 7/9/2017
  Time: 1:21 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
    <head>
        <title>Basic Employee Info</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <style>
            h1.ex1
            {
                font-family: Helvetica,Arial;
                color: forestgreen;
            }

            h2.ex2
            {
                font-family: Helvetica,Arial;
                color: forestgreen;
            }

            h2:hover
            {
                background-color: lightgreen;
            }

            .button {
                background-color: white;
                border: 2px solid forestgreen;
                border-radius: 8px;
                color: forestgreen;
                padding: 1vh 4vh;
                position: absolute;
                text-align: center;
                text-decoration: none;
                display: block;
                font-size: 4vh;
                margin: 1vh;
                cursor: pointer;
                -webkit-transition-duration: 0.4s; /* Safari */
                transition-duration: 0.4s;
            }

            .button:hover {
                box-shadow: 0 12px 16px 0 rgba(0,0,0,0.24),0 17px 50px 0 rgba(0,0,0,0.19);
            }

            .pos0{
                top: 0%;
                left: 80%;
                color: red;
            }
        </style>
    </head>
    <body>
        <h1 class="ex1">Employee Information:</h1>
        <form action="backEmployeeHome">
            <button class="button pos0">Back To Home</button>
        </form>
        <%
            EmployeeInformation pInfo = (EmployeeInformation) request.getAttribute("emInfo");
            if(pInfo==null)
            {
                out.println("System has no information about this employee.");
            }
            else
            {
                out.println( String.format("<h2 class=\"ex2\">Employee ID: <span style=\"color: black\">%d</span></h2>", pInfo.getEmid().longValue()) );
                out.println( String.format("<h2 class=\"ex2\">Employee Name: <span style=\"color: black\">%s</span></h2>", pInfo.getEmname()) );
                out.println( String.format("<h2 class=\"ex2\">Employee Address: <span style=\"color: black\">%s</span></h2>", pInfo.getEmaddress()) );
                String desg = pInfo.getDesignation();
                if ( desg.lastIndexOf("#administration#")!=-1 )
                {
                    desg = desg.replace("#administration#","");
                }
                out.println( String.format("<h2 class=\"ex2\">Employee Designation: <span style=\"color: black\">%s</span></h2>", desg) );
                out.println( String.format("<h2 class=\"ex2\">Employee Mobile No.: <span style=\"color: black\">%d</span></h2>", pInfo.getMobile_no().longValue()) );
                if ( pInfo.getSalary() == null )
                {
                    out.println("<h2 class=\"ex2\">Employee Salary: <span style=\"color: black\">No Info Available</span></h2>");
                }
                else
                {
                    out.println( String.format("<h2 class=\"ex2\">Employee Salary: <span style=\"color: black\">%.2f</span></h2>", pInfo.getSalary().floatValue()) );
                }
            }
        %>
    </body>
</html>
