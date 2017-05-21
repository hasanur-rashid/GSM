<%--
  Created by IntelliJ IDEA.
  User: ENVY
  Date: 5/18/2017
  Time: 2:29 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page import = "org.hasan.model.ProductInformation" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
    <head>
        <title>Basic Product Info</title>
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
        </style>
    </head>
    <h1 class="ex1">Product Information:</h1>
    <%
        ProductInformation pInfo = (ProductInformation) request.getAttribute("pInfo");
        if(pInfo==null)
        {
            out.println("System has no information about the product.");
        }
        else
        {
            out.println( String.format("<h2 class=\"ex2\">Product ID: <span style=\"color: black\">%d</span></h2>", pInfo.getPid().longValue()) );
            out.println( String.format("<h2 class=\"ex2\">Product Name: <span style=\"color: black\">%s</span></h2>", pInfo.getPname()) );
            out.println( String.format("<h2 class=\"ex2\">Product Price: <span style=\"color: black\">%.2f</span></h2>", pInfo.getPrice().floatValue()) );
            out.println( String.format("<h2 class=\"ex2\">Product Quantity: <span style=\"color: black\">%d</span></h2>", pInfo.getQuantity().longValue()) );
            out.println( String.format("<h2 class=\"ex2\">Product Category: <span style=\"color: black\">%s</span></h2>", pInfo.getCategory()) );
            if ( pInfo.getCmid() == null )
            {
                out.println("<h2 class=\"ex2\">Product Company ID: <span style=\"color: black\">No Info Available</span></h2>");
            }
            else
            {
                out.println( String.format("<h2 class=\"ex2\">Product Company ID: <span style=\"color: black\">%d</span></h2>", pInfo.getCmid().longValue()) );
            }
            if ( pInfo.getCmname() == null )
            {
                out.println("<h2 class=\"ex2\">Product Company Name: <span style=\"color: black\">No Info Available</span></h2>");
            }
            else
            {
                out.println( String.format("<h2 class=\"ex2\">Product Company Name: <span style=\"color: black\">%s</span></h2>", pInfo.getCmname()) );
            }
            if ( pInfo.getRid() == null )
            {
                out.println("<h2 class=\"ex2\">Product Representative ID: <span style=\"color: black\">No Info Available</span></h2>");
            }
            else
            {
                out.println( String.format("<h2 class=\"ex2\">Product Representative ID: <span style=\"color: black\">%d</span></h2>", pInfo.getRid().longValue()) );
            }
            if ( pInfo.getRname() == null )
            {
                out.println("<h2 class=\"ex2\">Product Representative: <span style=\"color: black\">No Info Available</span></h2>");
            }
            else
            {
                out.println( String.format("<h2 class=\"ex2\">Product Representative: <span style=\"color: black\">%s</span></h2>", pInfo.getRname()) );
            }
            if ( pInfo.getMobile_no() == null )
            {
                out.println("<h2 class=\"ex2\">Representative Mobile No.: <span style=\"color: black\">No Info Available</span></h2>");
            }
            else
            {
                out.println( String.format("<h2 class=\"ex2\">Representative Mobile No.: <span style=\"color: black\">%d</span></h2>", pInfo.getMobile_no().longValue()) );
            }
        }
    %>
    <body>

    </body>
</html>
