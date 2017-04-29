<%--
  Created by IntelliJ IDEA.
  User: ENVY
  Date: 4/28/2017
  Time: 7:42 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
        <style>
            h1.ex1 {
                font: normal 60px Helvetica,Arial ;
                text-align: center;
                color: forestgreen;
                position: relative;
                top: 10%;
            }

            h2.ex2 {
                font: normal 20px Helvetica,Arial ;
                text-align: center;
                color: red;
                position: relative;
                top: 10%;
            }

            input[type=text], select {
                width: 100%;
                padding: 12px 20px;
                margin: 8px 0;
                display: inline-block;
                border: 2px solid forestgreen;
                border-radius: 8px;
                box-sizing: border-box;
            }

            input[type=password], select {
                width: 100%;
                padding: 12px 20px;
                margin: 8px 0;
                display: inline-block;
                border: 2px solid forestgreen;
                border-radius: 8px;
                box-sizing: border-box;
            }

            input[type=submit] {
                width: 100%;
                background-color: forestgreen;
                color: white;
                padding: 14px 20px;
                margin: 8px 0;
                border: none;
                border-radius: 8px;
                cursor: pointer;
            }

            input[type=submit]:hover {
                box-shadow: 0 12px 16px 0 rgba(0,0,0,0.24),0 17px 50px 0 rgba(0,0,0,0.19);
            }

            div {
                position: relative;
                top: 10%;
                left: 35%;
                width: 30%;
                border-radius: 10px;
                background-color: rgba(12, 10, 14, 0.19);
                padding: 20px;
            }
        </style>
    </head>
    <body>
        <h1 class="ex1">Grocery Store Management System</h1>
        <div>
            <form action="login">
                <input type="text" name="usrName" placeholder="User Name" required/> <br>
                <input type="password" name="passWd" placeholder="Password" required/> <br>
                <br>
                <input type="submit" value="Login" />
            </form>
        </div>
        <h2 class="ex2">
            <%
                if(null!=request.getAttribute("errorLoginMessage"))
                {
                    out.println(request.getAttribute("errorLoginMessage"));
                    request.setAttribute("errorLoginMessage",null);
                }
            %>
        </h2>
    </body>
</html>
