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

            h2.ex3 {
                font: normal 4vh Helvetica,Arial ;
                text-align: center;
                color: blue;
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
        <button class="button pos2" id="statBtn">Statistics</button>
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
        <!-- The Modal -->
        <div id="statModal" class="modal">

            <!-- Modal content -->
            <div class="modal-content">
                <span class="close" id="c23">&times;</span>
                <button class="modalButton" id="totPrSaleBtn">Total Product Sale</button>
            </div>

        </div>
        <!-- The Modal -->
        <div id="totPrSaleModal" class="modal">

            <!-- Modal content -->
            <div class="modal-content">
                <span class="close" id="c24">&times;</span>
                <form action="totPrSale">
                    <input type="date" name="sdate" placeholder="From" required/> <br>
                    <br>
                    <input type="submit" value="Ok" />
                </form>
            </div>

        </div>
        <!-- The Modal -->
        <div id="editPrPriceModal" class="modal">

            <!-- Modal content -->
            <div class="modal-content">
                <span class="close" id="c25">&times;</span>
                <form action="editPrPrice">
                    <input type="number" name="pid" placeholder="Product ID" required/> <br>
                    <input type="number" name="price" placeholder="New Price" required/> <br>
                    <br>
                    <input type="submit" value="Ok" />
                </form>
            </div>

        </div>
        <!-- The Modal -->
        <div id="editPrNameModal" class="modal">

            <!-- Modal content -->
            <div class="modal-content">
                <span class="close" id="c26">&times;</span>
                <form action="editPrName">
                    <input type="number" name="pid" placeholder="Product ID" required/> <br>
                    <input type="text" name="name" placeholder="New Name" required/> <br>
                    <br>
                    <input type="submit" value="Ok" />
                </form>
            </div>

        </div>
        <!-- The Modal -->
        <div id="editCuAdrModal" class="modal">

            <!-- Modal content -->
            <div class="modal-content">
                <span class="close" id="c27">&times;</span>
                <form action="editCuAdr">
                    <input type="number" name="cuid" placeholder="Customer ID" required/> <br>
                    <input type="text" name="address" placeholder="New Address" required/> <br>
                    <br>
                    <input type="submit" value="Ok" />
                </form>
            </div>

        </div>
        <!-- The Modal -->
        <div id="editCuMobModal" class="modal">

            <!-- Modal content -->
            <div class="modal-content">
                <span class="close" id="c28">&times;</span>
                <form action="editCuMob">
                    <input type="number" name="cuid" placeholder="Customer ID" required/> <br>
                    <input type="number" name="mobile_no" placeholder="New Mobile No." required/> <br>
                    <br>
                    <input type="submit" value="Ok" />
                </form>
            </div>

        </div>
        <!-- The Modal -->
        <div id="editEmSalModal" class="modal">

            <!-- Modal content -->
            <div class="modal-content">
                <span class="close" id="c29">&times;</span>
                <form action="editEmSal">
                    <input type="number" name="emid" placeholder="Employee ID" required/> <br>
                    <input type="number" name="salary" placeholder="New Salary" required/> <br>
                    <br>
                    <input type="submit" value="Ok" />
                </form>
            </div>

        </div>
        <!-- The Modal -->
        <div id="editEmDesgModal" class="modal">

            <!-- Modal content -->
            <div class="modal-content">
                <span class="close" id="c30">&times;</span>
                <form action="editEmDesg">
                    <input type="number" name="emid" placeholder="Employee ID" required/> <br>
                    <input type="text" name="designation" placeholder="New Designation" required/> <br>
                    <br>
                    <input type="submit" value="Ok" />
                </form>
            </div>

        </div>
        <!-- The Modal -->
        <div id="editEmMobModal" class="modal">

            <!-- Modal content -->
            <div class="modal-content">
                <span class="close" id="c31">&times;</span>
                <form action="editEmMob">
                    <input type="number" name="emid" placeholder="Employee ID" required/> <br>
                    <input type="number" name="mobile_no" placeholder="New Mobile No." required/> <br>
                    <br>
                    <input type="submit" value="Ok" />
                </form>
            </div>

        </div>
        <!-- The Modal -->
        <div id="editEmAdrModal" class="modal">

            <!-- Modal content -->
            <div class="modal-content">
                <span class="close" id="c32">&times;</span>
                <form action="editEmAdr">
                    <input type="number" name="emid" placeholder="Employee ID" required/> <br>
                    <input type="text" name="address" placeholder="New Address" required/> <br>
                    <br>
                    <input type="submit" value="Ok" />
                </form>
            </div>

        </div>
        <!-- The Modal -->
        <div id="editComAdrModal" class="modal">

            <!-- Modal content -->
            <div class="modal-content">
                <span class="close" id="c33">&times;</span>
                <form action="editComAdr">
                    <input type="number" name="cmid" placeholder="Company ID" required/> <br>
                    <input type="text" name="address" placeholder="New Address" required/> <br>
                    <br>
                    <input type="submit" value="Ok" />
                </form>
            </div>

        </div>
        <!-- The Modal -->
        <div id="editRepMobModal" class="modal">

            <!-- Modal content -->
            <div class="modal-content">
                <span class="close" id="c34">&times;</span>
                <form action="editRepMob">
                    <input type="number" name="rid" placeholder="Representative ID" required/> <br>
                    <input type="number" name="mobile_no" placeholder="New Mobile No." required/> <br>
                    <br>
                    <input type="submit" value="Ok" />
                </form>
            </div>

        </div>
        <!-- The Modal -->
        <div id="succMsgModal" class="modal">

            <!-- Modal content -->
            <div class="modal-content">
                <span class="close" id="c35">&times;</span>
                <h2 class="ex3">
                    <%
                        out.println(request.getAttribute("succMsg"));
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
            var statModal = document.getElementById('statModal');
            var totPrSaleModal = document.getElementById('totPrSaleModal');
            var editPrPriceModal = document.getElementById('editPrPriceModal');
            var editPrNameModal = document.getElementById('editPrNameModal');
            var editCuAdrModal = document.getElementById('editCuAdrModal');
            var editCuMobModal = document.getElementById('editCuMobModal');
            var editEmSalModal = document.getElementById('editEmSalModal');
            var editEmDesgModal = document.getElementById('editEmDesgModal');
            var editEmMobModal = document.getElementById('editEmMobModal');
            var editEmAdrModal = document.getElementById('editEmAdrModal');
            var editComAdrModal = document.getElementById('editComAdrModal');
            var editRepMobModal = document.getElementById('editRepMobModal');
            var succMsgModal = document.getElementById('succMsgModal');

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
            var span23 = document.getElementById("c23");
            var span24 = document.getElementById("c24");
            var span25 = document.getElementById("c25");
            var span26 = document.getElementById("c26");
            var span27 = document.getElementById("c27");
            var span28 = document.getElementById("c28");
            var span29 = document.getElementById("c29");
            var span30 = document.getElementById("c30");
            var span31 = document.getElementById("c31");
            var span32 = document.getElementById("c32");
            var span33 = document.getElementById("c33");
            var span34 = document.getElementById("c34");
            var span35 = document.getElementById("c35");

            var errNewEm = '${errNewEm}';
            var addNewEm = '${addNewEm}';
            var errPid = '${errPid}';
            var errCmid = '${errCmid}';
            var errCuid = '${errCuid}';
            var errRid = '${errRid}';
            var errEmid = '${errEmid}';
            var succMsg = '${succMsg}';

            if ( errPid!=null && errPid!="" ){
                errPidModal.style.display = "block";
            }

            if ( errCmid!=null && errCmid!="" ){
                errCmidModal.style.display = "block";
            }

            if ( errCuid!=null && errCuid!="" ){
                errCuidModal.style.display = "block";
            }

            if ( errRid!=null && errRid!="" ){
                errRidModal.style.display = "block";
            }

            if ( errEmid!=null && errEmid!="" ){
                errEmidModal.style.display = "block";
            }

            if ( succMsg!=null && succMsg!="" ){
                succMsgModal.style.display = "block";
            }

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
            var totPrSaleBtn = document.getElementById("totPrSaleBtn");
            var statBtn = document.getElementById("statBtn");
            var editPrPriceBtn = document.getElementById('editPrPriceBtn');
            var editPrNameBtn = document.getElementById('editPrNameBtn');
            var editCuAdrBtn = document.getElementById('editCuAdrBtn');
            var editCuMobBtn = document.getElementById('editCuMobBtn');
            var editEmSalBtn = document.getElementById('editEmSalBtn');
            var editEmDesgBtn = document.getElementById('editEmDesgBtn');
            var editEmMobBtn = document.getElementById('editEmMobBtn');
            var editEmAdrBtn = document.getElementById('editEmAdrBtn');
            var editComAdrBtn = document.getElementById('editComAdrBtn');
            var editRepMobBtn = document.getElementById('editRepMobBtn');

            // When the user clicks the button, open the modal
            editPrPriceBtn.onclick = function() {
                editPrPriceModal.style.display = "block";
            }
            editPrNameBtn.onclick = function() {
                editPrNameModal.style.display = "block";
            }
            editCuAdrBtn.onclick = function() {
                editCuAdrModal.style.display = "block";
            }
            editCuMobBtn.onclick = function() {
                editCuMobModal.style.display = "block";
            }
            editEmSalBtn.onclick = function() {
                editEmSalModal.style.display = "block";
            }
            editEmDesgBtn.onclick = function() {
                editEmDesgModal.style.display = "block";
            }
            editEmMobBtn.onclick = function() {
                editEmMobModal.style.display = "block";
            }
            editEmAdrBtn.onclick = function() {
                editEmAdrModal.style.display = "block";
            }
            editComAdrBtn.onclick = function() {
                editComAdrModal.style.display = "block";
            }
            editRepMobBtn.onclick = function() {
                editRepMobModal.style.display = "block";
            }
            sellInfoBtn.onclick = function() {
                sellInfoModal.style.display = "block";
            }
            totPrSaleBtn.onclick = function() {
                totPrSaleModal.style.display = "block";
            }
            statBtn.onclick = function() {
                statModal.style.display = "block";
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
            span23.onclick = function() {
                statModal.style.display = "none";
            }
            span24.onclick = function() {
                totPrSaleModal.style.display = "none";
            }
            span25.onclick = function() {
                editPrPriceModal.style.display = "none";
            }
            span26.onclick = function() {
                editPrNameModal.style.display = "none";
            }
            span27.onclick = function() {
                editCuAdrModal.style.display = "none";
            }
            span28.onclick = function() {
                editCuMobModal.style.display = "none";
            }
            span29.onclick = function() {
                editEmSalModal.style.display = "none";
            }
            span30.onclick = function() {
                editEmDesgModal.style.display = "none";
            }
            span31.onclick = function() {
                editEmMobModal.style.display = "none";
            }
            span32.onclick = function() {
                editEmAdrModal.style.display = "none";
            }
            span33.onclick = function() {
                editComAdrModal.style.display = "none";
            }
            span34.onclick = function() {
                editRepMobModal.style.display = "none";
            }
            span35.onclick = function() {
                succMsgModal.style.display = "none";
            }

            // When the user clicks anywhere outside of the modal, close it
            window.onclick = function(event) {
                if (event.target == sellInfoModal) {
                    sellInfoModal.style.display = "none";
                }
                else if (event.target == storeInfoModal) {
                    storeInfoModal.style.display = "none";
                }
                else if (event.target == editInfoModal) {
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
                else if (event.target == statModal) {
                    statModal.style.display = "none";
                }
                else if (event.target == totPrSaleModal) {
                    totPrSaleModal.style.display = "none";
                }
                else if (event.target == editPrPriceModal) {
                    editPrPriceModal.style.display = "none";
                }
                else if (event.target == editPrNameModal) {
                    editPrNameModal.style.display = "none";
                }
                else if (event.target == editCuAdrModal) {
                    editCuAdrModal.style.display = "none";
                }
                else if (event.target == editCuMobModal) {
                    editCuMobModal.style.display = "none";
                }
                else if (event.target == editEmSalModal) {
                    editEmSalModal.style.display = "none";
                }
                else if (event.target == editEmDesgModal) {
                    editEmDesgModal.style.display = "none";
                }
                else if (event.target == editEmMobModal) {
                    editEmMobModal.style.display = "none";
                }
                else if (event.target == editEmAdrModal) {
                    editEmAdrModal.style.display = "none";
                }
                else if (event.target == editComAdrModal) {
                    editComAdrModal.style.display = "none";
                }
                else if (event.target == editRepMobModal) {
                    editRepMobModal.style.display = "none";
                }
                else if (event.target == succMsgModal) {
                    succMsgModal.style.display = "none";
                }
            }
        </script>
    </body>
</html>
