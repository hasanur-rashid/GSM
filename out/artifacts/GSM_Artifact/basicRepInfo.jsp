<%@ page import="org.hasan.model.RepresentativeInformation" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: ENVY
  Date: 7/9/2017
  Time: 1:21 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
    <head>
        <title>Basic Representative Info</title>
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
            table, th, td
            {
                border-radius: 8px;
                border-collapse: collapse;
            }
            th, td
            {
                padding: 5px;
                text-align: center;
            }

            tr:nth-child(even)
            {
                background-color: lightgreen;
            }

            tr:nth-child(odd)
            {
                background-color: #dee3e9;
            }

            tr:hover
            {
                background-color: forestgreen;
            }

            th
            {
                background-color: #4CAF50;
                color: white;
            }
        </style>
    </head>
    <body>
        <h1 class="ex1">Representative Information:</h1>
        <form action="backBasicPrInfo">
            <button class="button pos0">Back To Home</button>
        </form>
        <%
            RepresentativeInformation comInfo = (RepresentativeInformation) request.getAttribute("rInfo");
            if(comInfo==null)
            {
                out.println("System has no information about the representative.");
            }
            else
            {
                out.println( String.format("<h2 class=\"ex2\">Representative ID: <span style=\"color: black\">%d</span></h2>", comInfo.getRid().longValue()) );
                out.println( String.format("<h2 class=\"ex2\">Representative Name: <span style=\"color: black\">%s</span></h2>", comInfo.getRname()) );
                out.println( String.format("<h2 class=\"ex2\">Representative Mobile No.: <span style=\"color: black\">%d</span></h2>", comInfo.getMobile_no().longValue()) );
                if ( comInfo.getCmid() == null )
                {
                    out.println("<h2 class=\"ex2\">Representative Company ID: <span style=\"color: black\">No Info Available</span></h2>");
                }
                else
                {
                    out.println( String.format("<h2 class=\"ex2\">Representative Company ID: <span style=\"color: black\">%d</span></h2>", comInfo.getCmid().longValue()) );
                }
                if ( comInfo.getCmname() == null )
                {
                    out.println("<h2 class=\"ex2\">Representative Company Name: <span style=\"color: black\">No Info Available</span></h2>");
                }
                else
                {
                    out.println( String.format("<h2 class=\"ex2\">Representative Company Name: <span style=\"color: black\">%s</span></h2>", comInfo.getCmname()) );
                }
                out.println("<h1 class=\"ex1\">Representative Product Information:</h1>");
                out.println("<table>");
                out.println("<tr>");
                out.println("<th>Product ID</th>");
                out.println("<th>Product Name</th>");
                out.println("</tr>");
                List<Long> pid = comInfo.getPid();
                List<String> pname = comInfo.getPname();
                for ( int  i = 0 ; i<pid.size() ; i++ )
                {
                    out.println("<tr>");
                    out.println( String.format("<td>%d</td>", pid.get(i)));
                    out.println( String.format("<td>%s</td>", pname.get(i)) );
                    out.println("</tr>");
                }
                out.println("</table>");
            }
        %>
    </body>
</html>
