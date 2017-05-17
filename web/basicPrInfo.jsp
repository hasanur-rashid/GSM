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
    </head>
    <h1>Product Information:</h1>
    <%
        ProductInformation pInfo = (ProductInformation) request.getAttribute("pInfo");
        if(pInfo==null)
        {
            out.println("System has no information about the product.");
        }
        else
        {
            out.println("<table>");
            out.println("<tr>");
            out.println( String.format("<td>Product ID</td><td>:%d</td>", pInfo.getPid().longValue()) );
            out.println("</tr>");
            out.println("<tr>");
            out.println( String.format("<td>Product Name</td><td>:%s</td>", pInfo.getPname()) );
            out.println("</tr>");
            out.println("<tr>");
            out.println( String.format("<td>Product Price</td><td>:%.2f</td>", pInfo.getPrice().floatValue()) );
            out.println("</tr>");
            out.println("<tr>");
            out.println( String.format("<td>Product Quantity</td><td>:%d</td>", pInfo.getQuantity().longValue()) );
            out.println("</tr>");
            out.println("<tr>");
            out.println( String.format("<td>Product Category</td><td>:%s</td>", pInfo.getCategory()) );
            out.println("</tr>");
            out.println("<tr>");
            if ( pInfo.getCmid() == null )
            {
                out.println("<td>Product Company ID</td><td>:</td>");
            }
            else
            {
                out.println( String.format("<td>Product Company ID</td><td>:%d</td>", pInfo.getCmid().longValue()) );
            }
            out.println("</tr>");
            out.println("<tr>");
            if ( pInfo.getCmname() == null )
            {
                out.println("<td>Product Company Name</td><td>:</td>");
            }
            else
            {
                out.println( String.format("<td>Product Company Name</td><td>:%s</td>", pInfo.getCmname()) );
            }
            out.println("</tr>");
            out.println("<tr>");
            if ( pInfo.getRid() == null )
            {
                out.println("<td>Product Representative ID</td><td>:</td>");
            }
            else
            {
                out.println( String.format("<td>Product Representative ID</td><td>:%d</td>", pInfo.getRid().longValue()) );
            }
            out.println("</tr>");
            out.println("<tr>");
            if ( pInfo.getRname() == null )
            {
                out.println("<td>Product Representative</td><td>:</td>");
            }
            else
            {
                out.println( String.format("<td>Product Representative</td><td>:%s</td>", pInfo.getRname()) );
            }
            out.println("</tr>");
            out.println("<tr>");
            if ( pInfo.getMobile_no() == null )
            {
                out.println("<td>Representative Mobile No.</td><td>:</td>");
            }
            else
            {
                out.println( String.format("<td>Representative Mobile No.</td><td>:%d</td>", pInfo.getMobile_no().longValue()) );
            }
            out.println("</tr>");
            out.println("</table>");
        }
    %>
    <body>

    </body>
</html>
