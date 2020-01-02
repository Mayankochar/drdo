<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
    <head>
        <!link rel="stylesheet" href="design_welcome_form.css">
        <title>List</title>

        <script>
            document.addEventListener('DOMContentLoaded', function () {
                var no = document.getElementById('projectno').options[0].value;
                document.getElementById('pdc').value=no;
                document.getElementById('form7').value=no;
                document.getElementById('showdetails').value=no;
                document.getElementById('updatedetails').value=no;
                document.getElementById('committedetails').value=no;
                document.getElementById('meetingdetails').value=no;
                document.getElementById('downloaddetails').value=no;
                document.getElementById('minutesdetails').value=no;

            });
            function projectno()
            {
                console.log("Inside Function");
                var select = document.getElementById('projectno');
                var no= select.options[select.selectedIndex].value;
                console.log("After no");
                document.getElementById('committedetails').value=no;
                document.getElementById('pdc').value=no;
                document.getElementById('form7').value=no;
                document.getElementById('showdetails').value=no;
                document.getElementById('updatedetails').value=no;
                document.getElementById('meetingdetails').value=no;
                document.getElementById('downloaddetails').value=no;
                document.getElementById('minutesdetails').value=no;
                console.log("No is",no);

            }

        </script>
        <jsp:include page="header.jsp" />
    </head>

    <body>
    <div id="pageid">
    <fieldset>
        <br>
        <center style="font-size:"><b>Welcome to Project Automation</b>
        </center>
        <br>
        <br>
        <center>
            <label class="labeldesign"  style="position:absolute;left:500px"/>	Project Number :</label>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <select style="position:relative;left:200px" id="projectno" onchange="projectno()">
                <c:forEach var="item" items="${list}">
                    <option><c:out value="${item}"/></option>
                </c:forEach>
            </select>




           <!-- <input class="inputdesign" id="projectno" type="text" style="position:absolute;left:700px;width:200px" name="project_number" onselect="projectno()"/>-->
        </center>
        <br>
        <br>
        <br>
        <form action="/project/form6" method="get">

            <button class="button" type="submit" style="position:absolute;left:500px;text-align:center;width:150;height:75;font-size:25"  > PDC Form</button>
            <input id="pdc" type="hidden" name="projectNo" value="" />
        </form>
        <form action="/project/form7" method="get">
        <button type="submit" class="button" style="position:absolute;left:800px;text-align:center;width:150;height:75;font-size:25" > Form7</button>

            <input id="form7" type="hidden" name="projectNo" value="" />
        </form>
        <br>
        <br>
        <br>
        <br>
        <br>
        <br>
        <form action="/project/getDetails" method="post">
        <button type="submit" class="button" style="position:absolute;left:500px;up:500px;text-align:center;width:150;height:75;font-size:25">Show Details</button>
            <input id="showdetails" type="hidden" name="projectNo" value="" />
        </form>
        <form action="/project/updateDetails" method="get">
        <button type="submit" class="button" style="position:absolute;left:800px;text-align:center;width:150;height:75;font-size:25" > Update Details</button>

            <input id="updatedetails" type="hidden" name="projectNo" value="" />
        </form>
        <br>
        <br>
        <br>
        <br>
        <br>
        <br>
        <form action="/project/addMeeting" method="get">
            <button type="submit" class="button" style="position:absolute;left:500px;text-align:center;width:150;height:75;font-size:25" >Add Meeting</button>

            <input id="meetingdetails" type="hidden" name="projectNo" value="" />
        </form>
        <form action="/project/committee" method="get">
            <button type="submit" class="button" style="position:absolute;left:800px;text-align:center;width:150;height:75;font-size:25" >Committee</button>

            <input id="committedetails" type="hidden" name="projectNo" value="" />
        </form>
        <br>
        <br>
        <br>
        <br>
        <br>
        <br>

        <form action="/project/download" method="get">
            <button type="submit" class="button" style="position:absolute;left:500px;text-align:center;width:150;height:75;font-size:25" >Download MOM</button>

            <input id="downloaddetails" type="hidden" name="projectNo" value="" />
        </form>
        <br>
        <br>
        <br>
        <br>
        <br>
        <br>
    </fieldset>
    </div>
    </body>

</html>