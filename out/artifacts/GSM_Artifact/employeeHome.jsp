<%--
  Created by IntelliJ IDEA.
  User: ENVY
  Date: 4/28/2017
  Time: 7:33 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
                top: 5%;
                left: 80%;
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

            h1.ex1 {
                font-family: Helvetica,Arial ;
                font-size: 5vh;
                text-align: center;
                text-transform: uppercase;
                color: forestgreen;
                position: relative;
                top: 5%;
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
        <h1 class="ex1">Employee Home</h1>
        <form action="logout">
            <button class="button pos0">Log Out</button>
        </form>
        <button class="button pos1">New Product</button>
        <button class="button pos2">New Premiere Customer</button>
        <button class="button pos3" id="prInfoBtn">Product Information</button>
        <button class="button pos4">Employee Information</button>
        <button class="button pos5">Customer Information</button>
        <button class="button pos6">Company Information</button>
        <button class="button pos7">Representative Information</button>
        <button class="button pos8" id="sellBtn">Sell Product</button>
        <button class="button pos9" id="storeBtn">Store Product</button>
        <!-- The Modal -->
        <div id="prInfoModal" class="modal">

            <!-- Modal content -->
            <div class="modal-content">
                <span class="close">&times;</span>
                <form action="prBasicInfo">
                    <input type="text" name="pid" placeholder="Product ID" required/> <br>
                    <br>
                    <input type="submit" value="Submit" />
                </form>
            </div>

        </div>
        <!-- The Modal -->
        <div id="sellCheckModal" class="modal">

            <!-- Modal content -->
            <div class="modal-content">
                <span class="close">&times;</span>
                <input type='checkbox' onclick='handleClickPr();'> Premier Customer <br>
                <input type='checkbox' onclick='handleClickReg();'> Regular Customer
            </div>

        </div>
        <!-- The Modal -->
        <div id="sellRegModal" class="modal">

            <!-- Modal content -->
            <div class="modal-content">
                <span class="close">&times;</span>
                <form action="doSellToRegular">
                    <input type="text" name="name" placeholder="Customer Name" required/> <br>
                    <input type="text" name="mobile_no" placeholder="Mobile No." required/> <br>
                    <input type="text" name="pid" placeholder="Product ID" required/> <br>
                    <input type="text" name="quantity" placeholder="Quantity" required/> <br>
                    <br>
                    <input type="submit" value="Generate Memo" />
                </form>
            </div>

        </div>
        <!-- The Modal -->
        <div id="sellPrModal" class="modal">

            <!-- Modal content -->
            <div class="modal-content">
                <span class="close">&times;</span>
                <form action="doSellToPremier">
                    <input type="text" name="pid" placeholder="Product ID" required/> <br>
                    <input type="text" name="cuid" placeholder="Customer ID" required/> <br>
                    <input type="text" name="quantity" placeholder="Quantity" required/> <br>
                    <br>
                    <input type="submit" value="Generate Memo" />
                </form>
            </div>

        </div>
        <!-- The Modal -->
        <div id="storeModal" class="modal">

            <!-- Modal content -->
            <div class="modal-content">
                <span class="close">&times;</span>
                <form action="doStore">
                    <input type="text" name="pid" placeholder="Product ID" required/> <br>
                    <input type="text" name="price" placeholder="Product Price" required/> <br>
                    <input type="text" name="quantity" placeholder="Quantity" required/> <br>
                    <br>
                    <input type="submit" value="Generate Memo" />
                </form>
            </div>

        </div>
        <script>
            // Get the modal
            var prInfomodal = document.getElementById('prInfoModal');
            var sellCheckModal = document.getElementById('sellCheckModal');
            var sellRegModal = document.getElementById('sellRegModal');
            var sellPrModal = document.getElementById('sellPrModal');
            var storeModal = document.getElementById('storeModal');

            // Get the button that opens the modal
            var prInfoBtn = document.getElementById("prInfoBtn");
            var sellBtn = document.getElementById("sellBtn");
            var storeBtn = document.getElementById("storeBtn");

            // Get the <span> element that closes the modal
            var span = document.getElementsByClassName("close")[0];

            // When the user clicks the button, open the modal
            prInfoBtn.onclick = function() {
                prInfomodal.style.display = "block";
            }

            // When the user clicks the button, open the modal
            sellBtn.onclick = function() {
                sellCheckModal.style.display = "block";
            }

            // When the user clicks the button, open the modal
            storeBtn.onclick = function() {
                storeModal.style.display = "block";
            }

            function handleClickPr() {
                sellCheckModal.style.display = "none";
                sellPrModal.style.display = "block";
            }

            function handleClickReg() {
                sellCheckModal.style.display = "none";
                sellRegModal.style.display = "block";
            }


            // When the user clicks on <span> (x), close the modal
            span.onclick = function() {
                prInfomodal.style.display = "none";
                sellCheckModal.style.display = "none";
                sellRegModal.style.display = "none";
                sellPrModal.style.display = "none";
                storeModal.style.display = "none";
            }

            // When the user clicks anywhere outside of the modal, close it
            window.onclick = function(event) {
                if (event.target == prInfomodal ) {
                    prInfomodal.style.display = "none";
                }
                else if (event.target == sellCheckModal ) {
                    sellCheckModal.style.display = "none";
                }
                else if (event.target == sellRegModal ) {
                    sellRegModal.style.display = "none";
                }
                else if (event.target == sellPrModal ) {
                    sellPrModal.style.display = "none";
                }
                else if (event.target == storeModal ) {
                    storeModal.style.display = "none";
                }
            }
        </script>
    </body>
</html>
