<%@ page import="org.hasan.model.CustomerInformation" %><%--
  Created by IntelliJ IDEA.
  User: ENVY
  Date: 7/9/2017
  Time: 1:21 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
    <head>
        <title>Basic Customer Info</title>
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
        <h1 class="ex1">Customer Information:</h1>
        <form action="backEmployeeHome">
            <button class="button pos0">Back To Home</button>
        </form>
        <%
            CustomerInformation pInfo = (CustomerInformation) request.getAttribute("cuInfo");
            if(pInfo==null)
            {
                out.println("System has no information about this customer.");
            }
            else
            {
                out.println( String.format("<h2 class=\"ex2\">Customer ID: <span style=\"color: black\">%d</span></h2>", pInfo.getCuid().longValue()) );
                out.println( String.format("<h2 class=\"ex2\">Customer Name: <span style=\"color: black\">%s</span></h2>", pInfo.getCuname()) );
                out.println( String.format("<h2 class=\"ex2\">Customer Mobile No.: <span style=\"color: black\">%d</span></h2>", pInfo.getMobile_no().longValue()) );
                if ( pInfo.getCuaddress() == null )
                {
                    out.println("<h2 class=\"ex2\">Customer Address: <span style=\"color: black\">No Info Available</span></h2>");
                }
                else
                {
                    out.println( String.format("<h2 class=\"ex2\">Customer Address: <span style=\"color: black\">%s</span></h2>", pInfo.getCuaddress()) );
                }
                if ( pInfo.getPurchase() == null )
                {
                    out.println("<h2 class=\"ex2\">Customer Total Purchase: <span style=\"color: black\">No Info Available</span></h2>");
                }
                else
                {
                    out.println( String.format("<h2 class=\"ex2\">Customer Total Purchase: <span style=\"color: black\">%.2f</span></h2>", pInfo.getPurchase().floatValue()) );
                }
                if ( pInfo.getCommission_pct() == null )
                {
                    out.println("<h2 class=\"ex2\">Customer Commission Percentage: <span style=\"color: black\">No Info Available</span></h2>");
                }
                else
                {
                    out.println( String.format("<h2 class=\"ex2\">Customer Commission Percentage: <span style=\"color: black\">%.2f</span></h2>", pInfo.getCommission_pct().floatValue()) );
                }
                if ( pInfo.getJoindate() == null )
                {
                    out.println("<h2 class=\"ex2\">Customer Join Date: <span style=\"color: black\">No Info Available</span></h2>");
                }
                else
                {
                    out.println( String.format("<h2 class=\"ex2\">Customer Join Date: <span style=\"color: black\">%s</span></h2>", pInfo.getJoindate()) );
                }
            }
        %>
    </body>
</html>
