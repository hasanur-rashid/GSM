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
                padding: 14px 20px;
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
        <button class="button pos1" id="newEmBtn">New Employee</button>
        <button class="button pos2">Statistics</button>
        <button class="button pos3" id="sellInfoBtn">Sell Information</button>
        <button class="button pos4" id="storeInfoBtn">Store Information</button>
        <button class="button pos5" id="editInfoBtn">Edit Information</button>
        <!-- The Modal -->
        <div id="sellInfoModal" class="modal">

            <!-- Modal content -->
            <div class="modal-content">
                <span class="close" id="c0">&times;</span>
                <button class="modalButton" id="sellPrInfoBtn">Product</button>
                <button class="modalButton" id="sellEmInfoBtn">Employee</button>
                <button class="modalButton" id="sellCuInfoBtn">Customer</button>
                <button class="modalButton" id="sellDateInfoBtn">Date</button>
            </div>

        </div>
        <!-- The Modal -->
        <div id="storeInfoModal" class="modal">

            <!-- Modal content -->
            <div class="modal-content">
                <span class="close" id="c1">&times;</span>
                    <button class="modalButton" id="storePrInfoBtn">Product</button>
                    <button class="modalButton" id="storeEmInfoBtn">Employee</button>
                    <button class="modalButton" id="storeDateInfoBtn">Date</button>
            </div>

        </div>
        <!-- The Modal -->
        <div id="editInfoModal" class="modal">

            <!-- Modal content -->
            <div class="modal-content">
                <span class="close" id="c2">&times;</span>
                    <button class="modalButton" id="editPrInfoBtn">Product</button>
                    <button class="modalButton" id="editComInfoBtn">Company</button>
                    <button class="modalButton" id="editEmInfoBtn">Employee</button>
                    <button class="modalButton" id="editRepInfoBtn">Representative</button>
                    <button class="modalButton" id="editCuInfoBtn">Customer</button>
                </form>
            </div>

        </div>
        <!-- The Modal -->
        <div id="newEmModal" class="modal">

            <!-- Modal content -->
            <div class="modal-content">
                <span class="close" id="c3">&times;</span>
                <form action="addNewEm">
                    <input type="number" name="emid" placeholder="Employee ID" required/>
                    <input type="text" name="name" placeholder="Employee Name" required/>
                    <input type="number" name="mobile_no" placeholder="Employee Mobile No." required/>
                    <input type="text" name="address" placeholder="Employee Address" required/>
                    <input type="text" name="designation" placeholder="Employee Designation" required/>
                    <input type="submit" value="Submit" />
                </form>
            </div>

        </div>
        <!-- The Modal -->
        <div id="errNewEmModal" class="modal">

            <!-- Modal content -->
            <div class="modal-content change-border">
                <span class="close" id="c4">&times;</span>
                <h2 class="ex2">
                    <%
                        out.println(request.getAttribute("errNewEm"));
                    %>
                </h2>
            </div>

        </div>
        <!-- The Modal -->
        <div id="addedNewEmModal" class="modal">

            <!-- Modal content -->
            <div class="modal-content">
                <span class="close" id="c5">&times;</span>
                <h3 style="color: forestgreen">Employee successfully added in the database.</h3>
            </div>

        </div>
        <!-- The Modal -->
        <div id="sellPrInfoModal" class="modal">

            <!-- Modal content -->
            <div class="modal-content">
                <span class="close" id="c6">&times;</span>
                <form action="sellPrInfo">
                    <input type="number" name="pid" placeholder="Product ID" required/> <br>
                    <br>
                    <input type="submit" value="Submit" />
                </form>
            </div>

        </div>
        <!-- The Modal -->
        <div id="sellEmInfoModal" class="modal">

            <!-- Modal content -->
            <div class="modal-content">
                <span class="close" id="c7">&times;</span>
                <form action="sellEmInfo">
                    <input type="number" name="emid" placeholder="Employee ID" required/> <br>
                    <br>
                    <input type="submit" value="Submit" />
                </form>
            </div>

        </div>
        <!-- The Modal -->
        <div id="sellCuInfoModal" class="modal">

            <!-- Modal content -->
            <div class="modal-content">
                <span class="close" id="c8">&times;</span>
                <form action="sellCuInfo">
                    <input type="number" name="cuid" placeholder="Customer ID" required/> <br>
                    <br>
                    <input type="submit" value="Submit" />
                </form>
            </div>

        </div>
        <!-- The Modal -->
        <div id="sellDateInfoModal" class="modal">

            <!-- Modal content -->
            <div class="modal-content">
                <span class="close" id="c9">&times;</span>
                <form action="sellDateInfo">
                    <input type="date" name="sdate" placeholder="Start Date" required/> <br>
                    <input type="date" name="edate" placeholder="End Date" required/> <br>
                    <br>
                    <input type="submit" value="Submit" />
                </form>
            </div>

        </div>
        <!-- The Modal -->
        <div id="storePrInfoModal" class="modal">

            <!-- Modal content -->
            <div class="modal-content">
                <span class="close" id="c10">&times;</span>
                <form action="storePrInfo">
                    <input type="number" name="pid" placeholder="Product ID" required/> <br>
                    <br>
                    <input type="submit" value="Submit" />
                </form>
            </div>

        </div>
        <!-- The Modal -->
        <div id="storeEmInfoModal" class="modal">

            <!-- Modal content -->
            <div class="modal-content">
                <span class="close" id="c11">&times;</span>
                <form action="storeEmInfo">
                    <input type="number" name="emid" placeholder="Employee ID" required/> <br>
                    <br>
                    <input type="submit" value="Submit" />
                </form>
            </div>

        </div>
        <!-- The Modal -->
        <div id="storeDateInfoModal" class="modal">

            <!-- Modal content -->
            <div class="modal-content">
                <span class="close" id="c12">&times;</span>
                <form action="storeDateInfo">
                    <input type="date" name="sdate" placeholder="Start Date" required/> <br>
                    <input type="date" name="edate" placeholder="End Date" required/> <br>
                    <br>
                    <input type="submit" value="Submit" />
                </form>
            </div>

        </div>
        <!-- The Modal -->
        <div id="editPrInfoModal" class="modal">

            <!-- Modal content -->
            <div class="modal-content">
                <span class="close" id="c13">&times;</span>
                <button class="modalButton" id="editPrPriceBtn">Price</button>
                <button class="modalButton" id="editPrNameBtn">Name</button>
            </div>

        </div>
        <!-- The Modal -->
        <div id="editCuInfoModal" class="modal">

            <!-- Modal content -->
            <div class="modal-content">
                <span class="close" id="c14">&times;</span>
                <button class="modalButton" id="editCuAdrBtn">Address</button>
                <button class="modalButton" id="editCuMobBtn">Mobile No.</button>
            </div>

        </div>
        <!-- The Modal -->
        <div id="editEmInfoModal" class="modal">

            <!-- Modal content -->
            <div class="modal-content">
                <span class="close" id="c15">&times;</span>
                <button class="modalButton" id="editEmSalBtn">Salary</button>
                <button class="modalButton" id="editEmDesgBtn">Designation</button>
                <button class="modalButton" id="editEmMobBtn">Mobile No.</button>
                <button class="modalButton" id="editEmAdrBtn">Address</button>
            </div>

        </div>
        <!-- The Modal -->
        <div id="editComInfoModal" class="modal">

            <!-- Modal content -->
            <div class="modal-content">
                <span class="close" id="c16">&times;</span>
                <button class="modalButton" id="editComAdrBtn">Address</button>
            </div>

        </div>
        <!-- The Modal -->
        <div id="editRepInfoModal" class="modal">

            <!-- Modal content -->
            <div class="modal-content">
                <span class="close" id="c17">&times;</span>
                <button class="modalButton" id="editRepMobBtn">Mobile No.</button>
            </div>

        </div>
        <!-- The Modal -->
        <div id="errPidModal" class="modal">

            <!-- Modal content -->
            <div class="modal-content change-border">
                <span class="close" id="c18">&times;</span>
                <h2 class="ex2">
                    <%
                        out.println(request.getAttribute("errPid"));
                    %>
                </h2>
            </div>

        </div>
        <!-- The Modal -->
        <div id="errEmidModal" class="modal">

            <!-- Modal content -->
            <div class="modal-content change-border">
                <span class="close" id="c19">&times;</span>
                <h2 class="ex2">
                    <%
                        out.println(request.getAttribute("errEmid"));
                    %>
                </h2>
            </div>

        </div>
        <!-- The Modal -->
        <div id="errCmidModal" class="modal">

            <!-- Modal content -->
            <div class="modal-content change-border">
                <span class="close" id="c20">&times;</span>
                <h2 class="ex2">
                    <%
                        out.println(request.getAttribute("errCmid"));
                    %>
                </h2>
            </div>

        </div>
        <!-- The Modal -->
        <div id="errCuidModal" class="modal">

            <!-- Modal content -->
            <div class="modal-content change-border">
                <span class="close" id="c21">&times;</span>
                <h2 class="ex2">
                    <%
                        out.println(request.getAttribute("errCuid"));
                    %>
                </h2>
            </div>

        </div>
        <!-- The Modal -->
        <div id="errRidModal" class="modal">

            <!-- Modal content -->
            <div class="modal-content change-border">
                <span class="close" id="c22">&times;</span>
                <h2 class="ex2">
                    <%
                        out.println(request.getAttribute("errRid"));
                    %>
                </h2>
            </div>

        </div>
        <script>
            // Get the modal
            var sellInfoModal = document.getElementById('sellInfoModal');
            var sellPrInfoModal = document.getElementById('sellPrInfoModal');
            var sellEmInfoModal = document.getElementById('sellEmInfoModal');
            var sellCuInfoModal = document.getElementById('sellCuInfoModal');
            var sellDateInfoModal = document.getElementById('sellDateInfoModal');
            var storeInfoModal = document.getElementById('storeInfoModal');
            var storePrInfoModal = document.getElementById('storePrInfoModal');
            var storeEmInfoModal = document.getElementById('storeEmInfoModal');
            var storeDateInfoModal = document.getElementById('storeDateInfoModal');
            var editInfoModal = document.getElementById('editInfoModal');
            var editPrInfoModal = document.getElementById('editPrInfoModal');
            var editEmInfoModal = document.getElementById('editEmInfoModal');
            var editCuInfoModal = document.getElementById('editCuInfoModal');
            var editComInfoModal = document.getElementById('editComInfoModal');
            var editRepInfoModal = document.getElementById('editRepInfoModal');
            var newEmModal = document.getElementById('newEmModal');
            var errNewEmModal = document.getElementById('errNewEmModal');
            var errPidModal = document.getElementById('errPidModal');
            var errEmidModal = document.getElementById('errEmidModal');
            var errCuidModal = document.getElementById('errCuidModal');
            var errCmidModal = document.getElementById('errCmidModal');
            var errRidModal = document.getElementById('errRidModal');
            var addedNewEmModal = document.getElementById('addedNewEmModal');

            // Get the <span> element that closes the modal
            var span0 = document.getElementById("c0");
            var span1 = document.getElementById("c1");
            var span2 = document.getElementById("c2");
            var span3 = document.getElementById("c3");
            var span4 = document.getElementById("c4");
            var span5 = document.getElementById("c5");
            var span6 = document.getElementById("c6");
            var span7 = document.getElementById("c7");
            var span8 = document.getElementById("c8");
            var span9 = document.getElementById("c9");
            var span10 = document.getElementById("c10");
            var span11 = document.getElementById("c11");
            var span12 = document.getElementById("c12");
            var span13 = document.getElementById("c13");
            var span14 = document.getElementById("c14");
            var span15 = document.getElementById("c15");
            var span16 = document.getElementById("c16");
            var span17 = document.getElementById("c17");
            var span18 = document.getElementById("c18");
            var span19 = document.getElementById("c19");
            var span20 = document.getElementById("c20");
            var span21 = document.getElementById("c21");
            var span22 = document.getElementById("c22");

            var errNewEm = '${errNewEm}';
            var addNewEm = '${addNewEm}';

            if ( errNewEm!=null && errNewEm!="" ){
                errNewEmModal.style.display = "block";
            }

            if ( addNewEm!=null && addNewEm!="" ){
                addedNewEmModal.style.display = "block";
            }

            // Get the button that opens the modal
            var sellInfoBtn = document.getElementById("sellInfoBtn");
            var storeInfoBtn = document.getElementById("storeInfoBtn");
            var editInfoBtn = document.getElementById("editInfoBtn");
            var newEmBtn = document.getElementById("newEmBtn");
            var sellPrInfoBtn = document.getElementById("sellPrInfoBtn");
            var sellEmInfoBtn = document.getElementById("sellEmInfoBtn");
            var sellCuInfoBtn = document.getElementById("sellCuInfoBtn");
            var sellDateInfoBtn = document.getElementById("sellDateInfoBtn");
            var storePrInfoBtn = document.getElementById("storePrInfoBtn");
            var storeEmInfoBtn = document.getElementById("storeEmInfoBtn");
            var storeDateInfoBtn = document.getElementById("storeDateInfoBtn");
            var editPrInfoBtn = document.getElementById("editPrInfoBtn");
            var editEmInfoBtn = document.getElementById("editEmInfoBtn");
            var editComInfoBtn = document.getElementById("editComInfoBtn");
            var editCuInfoBtn = document.getElementById("editCuInfoBtn");
            var editRepInfoBtn = document.getElementById("editRepInfoBtn");

            // When the user clicks the button, open the modal
            sellInfoBtn.onclick = function() {
                sellInfoModal.style.display = "block";
            }
            sellPrInfoBtn.onclick = function() {
                sellPrInfoModal.style.display = "block";
            }
            sellEmInfoBtn.onclick = function() {
                sellEmInfoModal.style.display = "block";
            }
            sellCuInfoBtn.onclick = function() {
                sellCuInfoModal.style.display = "block";
            }
            sellDateInfoBtn.onclick = function() {
                sellDateInfoModal.style.display = "block";
            }
            storeInfoBtn.onclick = function() {
                storeInfoModal.style.display = "block";
            }
            storePrInfoBtn.onclick = function() {
                storePrInfoModal.style.display = "block";
            }
            storeEmInfoBtn.onclick = function() {
                storeEmInfoModal.style.display = "block";
            }
            storeDateInfoBtn.onclick = function() {
                storeDateInfoModal.style.display = "block";
            }
            editInfoBtn.onclick = function() {
                editInfoModal.style.display = "block";
            }
            editPrInfoBtn.onclick = function() {
                editPrInfoModal.style.display = "block";
            }
            editCuInfoBtn.onclick = function() {
                editCuInfoModal.style.display = "block";
            }
            editComInfoBtn.onclick = function() {
                editComInfoModal.style.display = "block";
            }
            editEmInfoBtn.onclick = function() {
                editEmInfoModal.style.display = "block";
            }
            editRepInfoBtn.onclick = function() {
                editRepInfoModal.style.display = "block";
            }
            newEmBtn.onclick = function() {
                newEmModal.style.display = "block";
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
            span3.onclick = function() {
                newEmModal.style.display = "none";
            }
            span4.onclick = function() {
                errNewEmModal.style.display = "none";
            }
            span5.onclick = function() {
                addedNewEmModal.style.display = "none";
            }
            span6.onclick = function() {
                sellPrInfoModal.style.display = "none";
            }
            span7.onclick = function() {
                sellEmInfoModal.style.display = "none";
            }
            span8.onclick = function() {
                sellCuInfoModal.style.display = "none";
            }
            span9.onclick = function() {
                sellDateInfoModal.style.display = "none";
            }
            span10.onclick = function() {
                storePrInfoModal.style.display = "none";
            }
            span11.onclick = function() {
                storeEmInfoModal.style.display = "none";
            }
            span12.onclick = function() {
                storeDateInfoModal.style.display = "none";
            }
            span13.onclick = function() {
                editPrInfoModal.style.display = "none";
            }
            span14.onclick = function() {
                editCuInfoModal.style.display = "none";
            }
            span15.onclick = function() {
                editEmInfoModal.style.display = "none";
            }
            span16.onclick = function() {
                editComInfoModal.style.display = "none";
            }
            span17.onclick = function() {
                editRepInfoModal.style.display = "none";
            }
            span18.onclick = function() {
                errPidModal.style.display = "none";
            }
            span19.onclick = function() {
                errEmidModal.style.display = "none";
            }
            span20.onclick = function() {
                errCmidModal.style.display = "none";
            }
            span21.onclick = function() {
                errCuidModal.style.display = "none";
            }
            span22.onclick = function() {
                errRidModal.style.display = "none";
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
                else if (event.target == newEmModal) {
                    newEmModal.style.display = "none";
                }
                else if (event.target == errNewEmModal) {
                    errNewEmModal.style.display = "none";
                }
                else if (event.target == addedNewEmModal) {
                    addedNewEmModal.style.display = "none";
                }
                else if (event.target == sellPrInfoModal) {
                    sellPrInfoModal.style.display = "none";
                }
                else if (event.target == sellEmInfoModal) {
                    sellEmInfoModal.style.display = "none";
                }
                else if (event.target == sellCuInfoModal) {
                    sellCuInfoModal.style.display = "none";
                }
                else if (event.target == sellDateInfoModal) {
                    sellDateInfoModal.style.display = "none";
                }
                else if (event.target == storePrInfoModal) {
                    storePrInfoModal.style.display = "none";
                }
                else if (event.target == storeEmInfoModal) {
                    storeEmInfoModal.style.display = "none";
                }
                else if (event.target == storeDateInfoModal) {
                    storeDateInfoModal.style.display = "none";
                }
                else if (event.target == editPrInfoModal) {
                    editPrInfoModal.style.display = "none";
                }
                else if (event.target == editCuInfoModal) {
                    editCuInfoModal.style.display = "none";
                }
                else if (event.target == editComInfoModal) {
                    editComInfoModal.style.display = "none";
                }
                else if (event.target == editEmInfoModal) {
                    editEmInfoModal.style.display = "none";
                }
                else if (event.target == editRepInfoModal) {
                    editRepInfoModal.style.display = "none";
                }
                else if (event.target == errPidModal) {
                    errPidModal.style.display = "none";
                }
                else if (event.target == errRidModal) {
                    errRidModal.style.display = "none";
                }
                else if (event.target == errEmidModal) {
                    errEmidModal.style.display = "none";
                }
                else if (event.target == errCuidModal) {
                    errCuidModal.style.display = "none";
                }
                else if (event.target == errCmidModal) {
                    errCmidModal.style.display = "none";
                }
            }
        </script>
    </body>
</html>
