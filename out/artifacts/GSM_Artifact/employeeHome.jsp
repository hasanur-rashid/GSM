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
        <form action="doNullOnPrBtn">
        <button class="button pos1" id="newPrBtn">New Product</button>
        </form>
        <button class="button pos2">New Premiere Customer</button>
        <button class="button pos3" id="prInfoBtn">Product Information</button>
        <button class="button pos4">Employee Information</button>
        <button class="button pos5">Customer Information</button>
        <button class="button pos6" id="comInfoBtn">Company Information</button>
        <button class="button pos7">Representative Information</button>
        <button class="button pos8" id="sellBtn">Sell Product</button>
        <button class="button pos9" id="storeBtn">Store Product</button>
        <!-- The Modal -->
        <div id="prInfoModal" class="modal">

            <!-- Modal content -->
            <div class="modal-content">
                <span class="close" id="c0">&times;</span>
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
                <span class="close" id="c1">&times;</span>
                <label><h4 style="color: forestgreen"><input type='checkbox' id="sellCheckPr">Premier Customer</h4></label>
                <label><h4 style="color: forestgreen"><input type='checkbox' id="sellCheckReg">Regular Customer</h4></label>
                <input type="submit" value="Ok" onclick="handleClickSellCheck();" />
            </div>

        </div>
        <!-- The Modal -->
        <div id="sellRegModal" class="modal">

            <!-- Modal content -->
            <div class="modal-content">
                <span class="close" id="c2">&times;</span>
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
                <span class="close" id="c3">&times;</span>
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
                <span class="close" id="c4">&times;</span>
                <form action="doStore">
                    <input type="text" name="pid" placeholder="Product ID" required/> <br>
                    <input type="text" name="price" placeholder="Product Price" required/> <br>
                    <input type="text" name="quantity" placeholder="Quantity" required/> <br>
                    <br>
                    <input type="submit" value="Generate Memo" />
                </form>
            </div>

        </div>
        <!-- The Modal -->
        <div id="comInfoModal" class="modal">

            <!-- Modal content -->
            <div class="modal-content">
                <span class="close" id="c5">&times;</span>
                <form action="comBasicInfo">
                    <input type="text" name="cmid" placeholder="Company ID" required/> <br>
                    <br>
                    <input type="submit" value="Submit" />
                </form>
            </div>

        </div>
        <!-- The Modal -->
        <div id="prComCheckModal" class="modal">

            <!-- Modal content -->
            <div class="modal-content">
                <span class="close" id="c6">&times;</span>
                <h3 style="color: forestgreen">Does product have a company?</h3>
                <label><h4 style="color: forestgreen"><input type='checkbox' id="prComYes">Yes</h4></label>
                <label><h4 style="color: red"><input type='checkbox' id="prComNo">No</h4></label>
                <input type="submit" value="Ok" onclick="handleClickPrComCheck();" />
            </div>

        </div>
        <!-- The Modal -->
        <div id="comIdModal" class="modal">

            <!-- Modal content -->
            <div class="modal-content">
                <span class="close" id="c7">&times;</span>
                <form action="checkComId">
                    <input type="text" name="cmid" placeholder="Company ID" required/><br>
                    <br>
                    <input type="submit" value="Submit" />
                </form>
            </div>

        </div>
        <!-- The Modal -->
        <div id="newComModal" class="modal">

            <!-- Modal content -->
            <div class="modal-content">
                <span class="close" id="c8">&times;</span>
                <form action="addNewCom">
                    <input type="text" name="name" placeholder="Company Name" required/>
                    <input type="text" name="address" placeholder="Company Address" required/>
                    <br>
                    <input type="submit" value="Submit" />
                </form>
            </div>

        </div>
        <!-- The Modal -->
        <div id="errPidModal" class="modal">

            <!-- Modal content -->
            <div class="modal-content change-border">
                <span class="close" id="c9">&times;</span>
                <h2 class="ex2">
                    <%
                        out.println(request.getAttribute("errorValidPid"));
                    %>
                </h2>
            </div>

        </div>
        <!-- The Modal -->
        <div id="errCmidModal" class="modal">

            <!-- Modal content -->
            <div class="modal-content change-border">
                <span class="close" id="c10">&times;</span>
                <h2 class="ex2">
                    <%
                        out.println(request.getAttribute("errorValidCmid"));
                    %>
                </h2>
            </div>

        </div>
        <!-- The Modal -->
        <div id="errCuidModal" class="modal">

            <!-- Modal content -->
            <div class="modal-content change-border">
                <span class="close" id="c11">&times;</span>
                <h2 class="ex2">
                    <%
                        out.println(request.getAttribute("errorValidCuid"));
                    %>
                </h2>
            </div>

        </div>
        <!-- The Modal -->
        <div id="prRepCheckModal" class="modal">

            <!-- Modal content -->
            <div class="modal-content">
                <span class="close" id="c12">&times;</span>
                <h3 style="color: forestgreen">Does product have a representative?</h3>
                <label><h4 style="color: forestgreen"><input type='checkbox' id="prRepYes">Yes</h4></label>
                <label><h4 style="color: red"><input type='checkbox' id="prRepNo">No</h4></label>
                <input type="submit" value="Ok" onclick="handleClickPrRepCheck();" />
            </div>

        </div>
        <!-- The Modal -->
        <div id="repIdModal" class="modal">

            <!-- Modal content -->
            <div class="modal-content">
                <span class="close" id="c13">&times;</span>
                <form action="checkRepId">
                    <input type="text" name="rid" placeholder="Representative ID" required/><br>
                    <br>
                    <input type="submit" value="Submit" />
                </form>
            </div>

        </div>
        <!-- The Modal -->
        <div id="newRepModal" class="modal">

            <!-- Modal content -->
            <div class="modal-content">
                <span class="close" id="c14">&times;</span>
                <form action="addNewRep">
                    <input type="text" name="name" placeholder="Representative Name" required/>
                    <input type="text" name="mobile_no" placeholder="Representative Mobile No." required/>
                    <br>
                    <input type="submit" value="Submit" />
                </form>
            </div>

        </div>
        <!-- The Modal -->
        <div id="newPrModal" class="modal">

            <!-- Modal content -->
            <div class="modal-content">
                <span class="close" id="c15">&times;</span>
                <form action="addNewPr">
                    <input type="text" name="pid" placeholder="Product ID" required/>
                    <input type="text" name="name" placeholder="Product Name" required/>
                    <input type="text" name="price" placeholder="Product Price" required/>
                    <input type="text" name="quantity" placeholder="Product Quantity" required/>
                    <input type="text" name="category" placeholder="Product Category" required/>
                    <input type="submit" value="Submit" />
                </form>
            </div>

        </div>
        <!-- The Modal -->
        <div id="showNewComModal" class="modal">

            <!-- Modal content -->
            <div class="modal-content">
                <span class="close" id="c16">&times;</span>
                <h3 style="color: red">No valid company found in the database by given id.</h3>
                <label><h4 style="color: forestgreen"><input type='checkbox' id="showNewCom">Include new company info by using given id.</h4></label>
                <label><h4 style="color: blue"><input type='checkbox' id="showComId">Try giving another id.</h4></label>
                <input type="submit" value="Ok" onclick="handleClickShowNewCom();" />
            </div>

        </div>
        <!-- The Modal -->
        <div id="showNewRepModal" class="modal">

            <!-- Modal content -->
            <div class="modal-content">
                <span class="close" id="c17">&times;</span>
                <h3 style="color: red">No valid representative found in the database by given id.</h3>
                <label><h4 style="color: forestgreen"><input type='checkbox' id="showNewRep">Include new representative info by using given id.</h4></label>
                <label><h4 style="color: blue"><input type='checkbox' id="showRepId">Try giving another id.</h4></label>
                <input type="submit" value="Ok" onclick="handleClickShowNewRep();" />
            </div>

        </div>
        <!-- The Modal -->
        <div id="addPrAgainModal" class="modal">

            <!-- Modal content -->
            <div class="modal-content">
                <span class="close" id="c18">&times;</span>
                <h3 style="color: forestgreen">Product successfully added in the database.</h3>
                <h3 style="color: red">Do you want to add another product of same company?</h3>
                <button class="button" id="addPrSameBtn">Add Product</button>
            </div>

        </div>
        <script>
            // Get the modal
            var prInfoModal = document.getElementById('prInfoModal');
            var sellCheckModal = document.getElementById('sellCheckModal');
            var sellRegModal = document.getElementById('sellRegModal');
            var sellPrModal = document.getElementById('sellPrModal');
            var storeModal = document.getElementById('storeModal');
            var comInfoModal = document.getElementById('comInfoModal');
            var prComCheckModal = document.getElementById('prComCheckModal');
            var comIdModal = document.getElementById('comIdModal');
            var newComModal = document.getElementById('newComModal');
            var errPidModal = document.getElementById('errPidModal');
            var errCmidModal = document.getElementById('errCmidModal');
            var errCuidModal = document.getElementById('errCuidModal');
            var prRepCheckModal = document.getElementById('prRepCheckModal');
            var repIdModal = document.getElementById('repIdModal');
            var newRepModal = document.getElementById('newRepModal');
            var newPrModal = document.getElementById('newPrModal');
            var showNewComModal = document.getElementById('showNewComModal');
            var showNewRepModal = document.getElementById('showNewRepModal');
            var addPrAgainModal = document.getElementById('addPrAgainModal');

            // Get the button that opens the modal
            var prInfoBtn = document.getElementById("prInfoBtn");
            var sellBtn = document.getElementById("sellBtn");
            var storeBtn = document.getElementById("storeBtn");
            var comInfoBtn = document.getElementById("comInfoBtn");
            var newPrBtn = document.getElementById("newPrBtn");
            var addPrSameBtn = document.getElementById("addPrSameBtn");

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

            var errPid = '${errorValidPid}';
            var errCmid = '${errorValidCmid}';
            var errCuid = '${errorValidCuid}';
            var openPrComCheck = '${openPrComCheck}';
            var openPrRepCheck = '${openPrRepCheck}';
            var openShowNewCom = '${openShowNewCom}';
            var openShowNewRep = '${openShowNewRep}';
            var openNewPr = '${openNewPr}';
            var openAddPrAgain = '${openAddPrAgain}';

            if ( openAddPrAgain!=null && openAddPrAgain!="" ){
                addPrAgainModal.style.display = "block";
            }

            if ( openNewPr!=null && openNewPr!="" ){
                newPrModal.style.display = "block";
            }

            if ( openShowNewRep!=null && openShowNewRep!="" ){
                showNewRepModal.style.display = "block";
            }

            if ( openShowNewCom!=null && openShowNewCom!="" ){
                showNewComModal.style.display = "block";
            }

            if ( errPid!=null && errPid!="" ){
                errPidModal.style.display = "block";
            }

            if ( errCmid!=null && errCmid!="" ){
                errCmidModal.style.display = "block";
            }

            if ( errCuid!=null && errCuid!="" ){
                errCuidModal.style.display = "block";
            }

            if ( openPrComCheck!=null && openPrComCheck!="" ){
                prComCheckModal.style.display = "block";
            }

            if ( openPrRepCheck!=null && openPrRepCheck!="" ){
                prRepCheckModal.style.display = "block";
            }

            // When the user clicks the button, open the modal
            prInfoBtn.onclick = function() {
                prInfoModal.style.display = "block";
            }

            // When the user clicks the button, open the modal
            sellBtn.onclick = function() {
                sellCheckModal.style.display = "block";
            }

            // When the user clicks the button, open the modal
            storeBtn.onclick = function() {
                storeModal.style.display = "block";
            }

            // When the user clicks the button, open the modal
            comInfoBtn.onclick = function() {
                comInfoModal.style.display = "block";
            }

            // When the user clicks the button, open the modal
            newPrBtn.onclick = function() {
                prComCheckModal.style.display = "block";
            }

            // When the user clicks the button, open the modal
            addPrSameBtn.onclick = function() {
                newPrModal.style.display = "block";
                addPrAgainModal.style.display = "none";
            }

            function handleClickShowNewCom() {
                if ( document.getElementById("showNewCom").checked && !document.getElementById("showComId").checked )
                {
                    newComModal.style.display = "block";
                    showNewComModal.style.display = "none";
                    document.getElementById("showNewCom").checked = false;
                }
                else if ( document.getElementById("showComId").checked && !document.getElementById("showNewCom").checked )
                {
                    comIdModal.style.display = "block";
                    showNewComModal.style.display = "none";
                    document.getElementById("showComId").checked = false;
                }
                else
                {
                    alert("Please check one checkbox !!!");
                    document.getElementById("showNewCom").checked = false;
                    document.getElementById("showComId").checked = false;
                    return false;
                }
            }

            function handleClickShowNewRep() {
                if ( document.getElementById("showNewRep").checked && !document.getElementById("showRepId").checked )
                {
                    newRepModal.style.display = "block";
                    showNewRepModal.style.display = "none";
                    document.getElementById("showNewRep").checked = false;
                }
                else if ( document.getElementById("showRepId").checked && !document.getElementById("showNewRep").checked )
                {
                    repIdModal.style.display = "block";
                    showNewRepModal.style.display = "none";
                    document.getElementById("showRepId").checked = false;
                }
                else
                {
                    alert("Please check one checkbox !!!");
                    document.getElementById("showNewRep").checked = false;
                    document.getElementById("showRepId").checked = false;
                    return false;
                }
            }

            function handleClickPrComCheck() {
                if ( document.getElementById("prComYes").checked && !document.getElementById("prComNo").checked )
                {
                    comIdModal.style.display = "block";
                    prComCheckModal.style.display = "none";
                    document.getElementById("prComYes").checked = false;
                }
                else if ( document.getElementById("prComNo").checked && !document.getElementById("prComYes").checked )
                {
                    prRepCheckModal.style.display = "block";
                    prComCheckModal.style.display = "none";
                    document.getElementById("prComNo").checked = false;
                }
                else
                {
                    alert("Please check one checkbox !!!");
                    document.getElementById("prComYes").checked = false;
                    document.getElementById("prComNo").checked = false;
                    return false;
                }
            }

            function handleClickPrRepCheck() {
                if ( document.getElementById("prRepYes").checked && !document.getElementById("prRepNo").checked )
                {
                    repIdModal.style.display = "block";
                    prRepCheckModal.style.display = "none";
                    document.getElementById("prRepYes").checked = false;
                }
                else if ( document.getElementById("prRepNo").checked && !document.getElementById("prRepYes").checked )
                {
                    newPrModal.style.display = "block";
                    prRepCheckModal.style.display = "none";
                    document.getElementById("prRepNo").checked = false;
                }
                else
                {
                    alert("Please check one checkbox !!!");
                    document.getElementById("prRepYes").checked = false;
                    document.getElementById("prRepNo").checked = false;
                    return false;
                }
            }

            function handleClickSellCheck() {
                if ( document.getElementById("sellCheckPr").checked && !document.getElementById("sellCheckReg").checked )
                {
                    sellCheckModal.style.display = "none";
                    sellPrModal.style.display = "block";
                    document.getElementById("sellCheckPr").checked = false;
                }
                else if ( document.getElementById("sellCheckReg").checked && !document.getElementById("sellCheckPr").checked )
                {
                    sellCheckModal.style.display = "none";
                    sellRegModal.style.display = "block";
                    document.getElementById("sellCheckReg").checked = false;
                }
                else
                {
                    alert("Please check one checkbox !!!");
                    document.getElementById("sellCheckPr").checked = false;
                    document.getElementById("sellCheckReg").checked = false;
                    return false;
                }
            }

            // When the user clicks on <span> (x), close the modal
            span0.onclick = function() {
                prInfoModal.style.display = "none";
            }
            span1.onclick = function() {
                sellCheckModal.style.display = "none";
            }
            span2.onclick = function() {
                sellRegModal.style.display = "none";
            }
            span3.onclick = function() {
                sellPrModal.style.display = "none";
            }
            span4.onclick = function() {
                storeModal.style.display = "none";
            }
            span5.onclick = function() {
                comInfoModal.style.display = "none";
            }
            span6.onclick = function() {
                prComCheckModal.style.display = "none";
            }
            span7.onclick = function() {
                comIdModal.style.display = "none";
            }
            span8.onclick = function() {
                newComModal.style.display = "none";
            }
            span9.onclick = function() {
                errPidModal.style.display = "none";
            }
            span10.onclick = function() {
                errCmidModal.style.display = "none";
            }
            span11.onclick = function() {
                errCuidModal.style.display = "none";
            }
            span12.onclick = function() {
                prRepCheckModal.style.display = "none";
            }
            span13.onclick = function() {
                repIdModal.style.display = "none";
            }
            span14.onclick = function() {
                newRepModal.style.display = "none";
            }
            span15.onclick = function() {
                newPrModal.style.display = "none";
            }
            span16.onclick = function() {
                showNewComModal.style.display = "none";
            }
            span17.onclick = function() {
                showNewRepModal.style.display = "none";
            }
            span18.onclick = function() {
                addPrAgainModal.style.display = "none";
            }
            // When the user clicks anywhere outside of the modal, close it
            window.onclick = function(event) {
                if (event.target == prInfoModal ) {
                    prInfoModal.style.display = "none";
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
                else if (event.target == comInfoModal ) {
                    comInfoModal.style.display = "none";
                }
                else if (event.target == prComCheckModal ) {
                    prComCheckModal.style.display = "none";
                }
                else if (event.target == comIdModal ) {
                    comIdModal.style.display = "none";
                }
                else if (event.target == newComModal ) {
                    newComModal.style.display = "none";
                }
                else if (event.target == errPidModal ) {
                    errPidModal.style.display = "none";
                }
                else if (event.target == errCmidModal ) {
                    errCmidModal.style.display = "none";
                }
                else if (event.target == errCuidModal ) {
                    errCuidModal.style.display = "none";
                }
                else if (event.target == prRepCheckModal ) {
                    prRepCheckModal.style.display = "none";
                }
                else if (event.target == repIdModal ) {
                    repIdModal.style.display = "none";
                }
                else if (event.target == newRepModal ) {
                    newRepModal.style.display = "none";
                }
                else if (event.target == newPrModal ) {
                    newPrModal.style.display = "none";
                }
                else if (event.target == showNewComModal ) {
                    showNewComModal.style.display = "none";
                }
                else if (event.target == showNewRepModal ) {
                    showNewRepModal.style.display = "none";
                }
                else if (event.target == addPrAgainModal ) {
                    addPrAgainModal.style.display = "none";
                }
            }
        </script>
    </body>
</html>
