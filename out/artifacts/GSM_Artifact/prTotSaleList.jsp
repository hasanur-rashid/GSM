<%@ page import="org.hasan.model.PrTotSaleList" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: ENVY
  Date: 7/10/2017
  Time: 8:21 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <title>Total Sale List</title>
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
    <h1 class="ex1">Total Sale List Of Product:</h1>
    <form action="/backAdminHome">
        <button class="button pos0">Back To Home</button>
    </form>
    <%
        List<PrTotSaleList> pList = (List<PrTotSaleList>) request.getAttribute("pList");
        if( pList.size()==0 )
        {
            out.println("No Info Available From That Date !!!");
        }
        else
        {
            out.println("<table align=\"center\">");
            out.println("<tr>");
            out.println("<th>Product ID</th>");
            out.println("<th>Product Name</th>");
            out.println("<th>Total Sale</th>");
            out.println("</tr>");
            for ( PrTotSaleList p: pList )
            {
                out.println("<tr>");
                out.println( String.format("<td>%d</td>", p.getPid().longValue()));
                out.println( String.format("<td>%s</td>", p.getPname()) );
                out.println( String.format("<td>%.2f</td>", p.getTotSale().floatValue()));
                out.println("</tr>");
            }
            out.println("</table>");
        }
    %>
    </body>
</html>
