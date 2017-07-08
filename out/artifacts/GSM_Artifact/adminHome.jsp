<%--
  Created by IntelliJ IDEA.
  User: ENVY
  Date: 4/29/2017
  Time: 10:05 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
    <head>
        <title>Welcome</title>
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

            /* Modal Content */
            .modal-content {
                background-color: white;
                margin: auto;
                padding: 20px;
                border: 5px solid rgba(80, 159, 13, 0.94);
                border-radius: 10px;
                width: 20%;
            }

            .change-border{
                border: 5px solid red;
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

            .modalButton {
                width: 100%;
                background-color: forestgreen;
                color: white;
                border: none;
                border-radius: 8px;
                padding: 4px 8px;
                margin: 8px 0;
                cursor: pointer;
            }

            .modalButton:hover {
                box-shadow: 0 12px 16px 0 rgba(0,0,0,0.24),0 17px 50px 0 rgba(0,0,0,0.19);
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

            .pos1{
                top: 15%;
                left: 5%;
            }

            .pos2{
                top: 23%;
                left: 5%;
            }

            .pos3{
                top: 31%;
                left: 5%;
            }

            .pos4{
                top: 39%;
                left: 5%;
            }

            .pos5{
                top: 47%;
                left: 5%;
            }

            .pos6{
                top: 55%;
                left: 5%;
            }

            .pos7{
                top: 63%;
                left: 5%;
            }

            .pos8{
                top: 71%;
                left: 5%;
            }

            .pos9{
                top: 79%;
                left: 5%;
            }

            .pos10{
                top: 0%;
                left: 5%;
                color: red;
            }

            h1.ex1 {
                font-family: Helvetica,Arial ;
                font-size: 5vh;
                text-align: center;
                text-transform: uppercase;
                color: forestgreen;
                position: relative;
                top: 5%;
            }

            h2.ex2 {
                font: normal 4vh Helvetica,Arial ;
                text-align: center;
                color: red;
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

            input[type=number], select {
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
        <h1 class="ex1">Admin Home</h1>
        <form action="logout">
            <button class="button pos0">Log Out</button>
        </form>
        <form action="employeeHome.jsp">
            <button class="button pos10">Go To Employee</button>
        </form>
        <button class="button pos1">New Employee</button>
        <button class="button pos2">Statistics</button>
        <button class="button pos3" id="sellInfoBtn">Sell Information</button>
        <button class="button pos4" id="storeInfoBtn">Store Information</button>
        <button class="button pos5" id="editInfoBtn">Edit Information</button>
        <!-- The Modal -->
        <div id="sellInfoModal" class="modal">

            <!-- Modal content -->
            <div class="modal-content">
                <span class="close" id="c0">&times;</span>
                <form action="sellInfoPr">
                <button class="modalButton">Product</button>
                </form>
                <form action="sellInfoEmp">
                <button class="modalButton">Employee</button>
                </form>
                <form action="sellInfoCu">
                <button class="modalButton">Customer</button>
                </form>
                <form action="sellInfoDate">
                <button class="modalButton">Date</button>
                </form>
            </div>

        </div>
        <!-- The Modal -->
        <div id="storeInfoModal" class="modal">

            <!-- Modal content -->
            <div class="modal-content">
                <span class="close" id="c1">&times;</span>
                <form action="storeInfoPr">
                    <button class="modalButton">Product</button>
                </form>
                <form action="storeInfoEmp">
                    <button class="modalButton">Employee</button>
                </form>
                <form action="storeInfoDate">
                    <button class="modalButton">Date</button>
                </form>
            </div>

        </div>
        <!-- The Modal -->
        <div id="editInfoModal" class="modal">

            <!-- Modal content -->
            <div class="modal-content">
                <span class="close" id="c2">&times;</span>
                <form action="editInfoPr">
                    <button class="modalButton">Product</button>
                </form>
                <form action="editInfoCom">
                    <button class="modalButton">Company</button>
                </form>
                <form action="editInfoEmp">
                    <button class="modalButton">Employee</button>
                </form>
                <form action="editInfoRep">
                    <button class="modalButton">Representative</button>
                </form>
                <form action="editInfoCu">
                    <button class="modalButton">Customer</button>
                </form>
            </div>

        </div>
        <script>
            // Get the modal
            var sellInfoModal = document.getElementById('sellInfoModal');
            var storeInfoModal = document.getElementById('storeInfoModal');
            var editInfoModal = document.getElementById('editInfoModal');

            // Get the <span> element that closes the modal
            var span0 = document.getElementById("c0");
            var span1 = document.getElementById("c1");
            var span2 = document.getElementById("c2");

            // Get the button that opens the modal
            var sellInfoBtn = document.getElementById("sellInfoBtn");
            var storeInfoBtn = document.getElementById("storeInfoBtn");
            var editInfoBtn = document.getElementById("editInfoBtn");

            // When the user clicks the button, open the modal
            sellInfoBtn.onclick = function() {
                sellInfoModal.style.display = "block";
            }
            storeInfoBtn.onclick = function() {
                storeInfoModal.style.display = "block";
            }
            editInfoBtn.onclick = function() {
                editInfoModal.style.display = "block";
            }

            // When the user clicks on <span> (x), close the modal
            span0.onclick = function() {
                sellInfoModal.style.display = "none";
            }
            span1.onclick = function() {
                storeInfoModal.style.display = "none";
            }
            span2.onclick = function() {
                editInfoModal.style.display = "none";
            }

            // When the user clicks anywhere outside of the modal, close it
            window.onclick = function(event) {
                if (event.target == sellInfoModal) {
                    sellInfoModal.style.display = "none";
                }
                else if (event.target == storeInfoModal) {
                    storeInfoModal.style.display = "none";
                }
                else if (event.target == sellRegModal) {
                    editInfoModal.style.display = "none";
                }
            }
        </script>
    </body>
</html>
