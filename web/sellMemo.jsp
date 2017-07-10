<%@ page import="java.util.List" %>
<%@ page import="org.hasan.model.SoldProductList" %><%--
  Created by IntelliJ IDEA.
  User: ENVY
  Date: 7/10/2017
  Time: 4:09 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
    <head>
        <title>Memo</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <style>
            table, th, td
            {
                font-family: Helvetica,Arial;
                font-size: 3vh;
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
                background-color: yellow;
            }

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

            th
            {
                background-color: #4CAF50;
                color: white;
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
        <h1 class="ex1">Printed Memo:</h1>
        <form action="backEmployeeHome">
            <button class="button pos0">Back To Home</button>
        </form>
        <%
            List<SoldProductList> sList = (List<SoldProductList>) request.getAttribute("sList");
            if(sList==null)
            {
                out.println("Error Generating Memo !!!");
            }
            else
            {
                String name = (String) session.getAttribute("cuname");
                Long mobile_no = (Long) session.getAttribute("cumob");
                Long cuid = (Long) session.getAttribute("cuid");
                out.println( String.format("<h2 class=\"ex2\">Customer ID: <span style=\"color: black\">%d</span></h2>", cuid) );
                out.println( String.format("<h2 class=\"ex2\">Customer Name: <span style=\"color: black\">%s</span></h2>", name) );
                out.println( String.format("<h2 class=\"ex2\">Customer Mobile No.: <span style=\"color: black\">%d</span></h2>", mobile_no) );
                out.println("<h1 class=\"ex1\">Sold Product List:</h1>");
                out.println("<table>");
                out.println("<tr>");
                out.println("<th>Product ID</th>");
                out.println("<th>Product Name</th>");
                out.println("<th>Product Sold Time</th>");
                out.println("<th>Product Price(per unit)</th>");
                out.println("<th>Product Quantity</th>");
                out.println("<th>Total Price(per product)</th>");
                out.println("</tr>");
                float total = (float) 0.0;
                for ( SoldProductList s: sList )
                {
                    out.println("<tr>");
                    out.println( String.format("<td>%d</td>", s.getPid().longValue()));
                    out.println( String.format("<td>%s</td>", s.getName()) );
                    out.println( String.format("<td>%s</td>", s.getDate()) );
                    out.println( String.format("<td>%.2f</td>", s.getPrice().floatValue()) );
                    out.println( String.format("<td>%d</td>", s.getQuantity().longValue()) );
                    out.println( String.format("<td>%.2f</td>", s.getPrice().floatValue()*s.getQuantity().longValue()) );
                    out.println("</tr>");
                    total += s.getPrice().floatValue()*s.getQuantity().longValue();
                }
                out.println("</table>");
                out.println( String.format("<h2 class=\"ex2\">Total Price: <span style=\"color: black\">%.2f</span></h2>", total) );
            }
        %>
    </body>
</html>
