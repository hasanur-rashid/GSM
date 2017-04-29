<%--
  Created by IntelliJ IDEA.
  User: ENVY
  Date: 4/25/2017
  Time: 7:14 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
    <head>
        <title>GSM</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <style>
            /* The Modal (background) */
            .modal {
                display: none; /* Hidden by default */
                position: fixed; /* Stay in place */
                z-index: 1; /* Sit on top */
                padding-top: 15%; /* Location of the box */
                left: 0;
                top: 0;
                width: 100%; /* Full width */
                height: 100%; /* Full height */
                overflow: auto; /* Enable scroll if needed */
                background-color: rgb(0,0,0); /* Fallback color */
                background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
            }

            .modal1 {
                display: none; /* Hidden by default */
                position: fixed; /* Stay in place */
                z-index: 1; /* Sit on top */
                padding-top: 15%; /* Location of the box */
                left: 0;
                top: 0;
                width: 100%; /* Full width */
                height: 100%; /* Full height */
                overflow: auto; /* Enable scroll if needed */
                background-color: rgb(0,0,0); /* Fallback color */
                background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
            }

            /* Modal Content */
            .modal-content {
                background-color: white;
                margin: auto;
                padding: 20px;
                border: 5px solid rgba(80, 159, 13, 0.94);
                border-radius: 10px;
                width: 20%;
            }

            /* Modal Content */
            .modal-content1 {
                background-color: white;
                margin: auto;
                padding: 20px;
                border: 5px solid red;
                border-radius: 10px;
                width: 20%;
            }

            /* The Close Button */
            .close {
                color: #aaaaaa;
                float: right;
                font-size: 28px;
                font-weight: bold;
            }

            .close:hover,
            .close:focus {
                color: #000;
                text-decoration: none;
                cursor: pointer;
            }

            .close1 {
                color: #aaaaaa;
                float: right;
                font-size: 28px;
                font-weight: bold;
            }

            .close1:hover,
            .close1:focus {
                color: #000;
                text-decoration: none;
                cursor: pointer;
            }

            .button {
                background-color: white;
                border: 2px solid forestgreen;
                border-radius: 8px;
                color: forestgreen;
                padding: 15px 60px;
                position: absolute;
                top: 40%;
                left: 40%;
                text-align: center;
                text-decoration: none;
                display: block;
                font-size: 24px;
                /*margin: auto;*/
                cursor: pointer;
                -webkit-transition-duration: 0.4s; /* Safari */
                transition-duration: 0.4s;
            }

            .button:hover {
                box-shadow: 0 12px 16px 0 rgba(0,0,0,0.24),0 17px 50px 0 rgba(0,0,0,0.19);
            }

            h1.ex1 {
                font: normal 60px Helvetica,Arial ;
                text-align: center;
                color: forestgreen;
                position: relative;
                top: 25%;
            }

            h2.ex2 {
                font: normal 20px Helvetica,Arial ;
                text-align: center;
                color: red;
                position: relative;
                top: 35%;
                left: -2%;
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
        </style>
    </head>
    <body>
        <h1 class="ex1">Grocery Store Management System</h1>
        <%--<form action="loginField.jsp">
            <button type="submit" class="button">Log In</button>
        </form>--%>
        <button id="myBtn" class="button">Log In</button>
        <!-- The Modal -->
        <div id="myModal" class="modal">

            <!-- Modal content -->
            <div class="modal-content">
                <span class="close">&times;</span>
                <form action="login">
                    <input type="text" name="usrName" placeholder="User Name" required/> <br>
                    <input type="password" name="passWd" placeholder="Password" required/> <br>
                    <br>
                    <input type="submit" value="Login" />
                </form>
            </div>

        </div>
        <!-- The Modal -->
        <div id="myModal1" class="modal1">

            <!-- Modal content -->
            <div class="modal-content1">
                <span class="close1">&times;</span>
                <h2 class="ex2">
                    <%
                        out.println(request.getAttribute("errorLoginMessage"));
                    %>
                </h2
            </div>

        </div>
        <script>
            // Get the modal
            var modal = document.getElementById('myModal');
            var modal1 = document.getElementById('myModal1');

            // Get the button that opens the modal
            var btn = document.getElementById("myBtn");

            // Get the <span> element that closes the modal
            var span = document.getElementsByClassName("close")[0];
            var span1 = document.getElementsByClassName("close1")[0];

            var err = '${errorLoginMessage}';

            if ( err!=null && err!="" ){
                modal1.style.display = "block";
            }

            // When the user clicks the button, open the modal
            btn.onclick = function() {
                modal.style.display = "block";
            }

            // When the user clicks on <span> (x), close the modal
            span.onclick = function() {
                modal.style.display = "none";
            }
            span1.onclick = function() {
                modal1.style.display = "none";
            }

            // When the user clicks anywhere outside of the modal, close it
            window.onclick = function(event) {
                if (event.target == modal ) {
                    modal.style.display = "none";
                }
                else if (event.target == modal1 ) {
                    modal1.style.display = "none";
                }
            }
        </script>
    </body>
</html>
