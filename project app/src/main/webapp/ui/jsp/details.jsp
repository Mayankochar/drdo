<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <style>
        tr,td,th{padding: 20px;cell-spacing:10px;border: 1px solid black}
        table{border-collapse: collapse;}
    </style>
    <!--<link rel="stylesheet" href="design_display_form.css">-->
    <title>Show Details</title>
    <script>
        var arrHead = new Array();
        arrHead = [ 'Designation', 'Name', 'Phone No.','Email ID(1)','Email ID(2)' ];
          var cost = ${project.totalCost};
        function checking(){
            console.log("Inside Function checking",cost);
            if(cost>=5)
            {
                console.log("inside if");
                //both pmrc and eb
                document.getElementById('doubletable').innerHTML="<b>PMRC COMMITTEE DETAILS</b><br> <table><tbody><tr><th>Designation</th><th>Name</th><th>Phone No.</th><th>Email ID(1)</th><th>Email ID(2)</th></tr><c:forEach var="item" items="${project.pmrc}"><tr><td>${item.designation}</td><td>${item.name}</td><td>${item.phone}</td><td>${item.primaryEmail}</td><td>${item.secondaryEmail}</td></tr></c:forEach></tbody></table><br><b>EB COMMITTEE DETAILS <b><br> <table><tbody><tr><th>Designation</th><th>Name</th><th>Phone No.</th><th>Email ID(1)</th><th>Email ID(2)</th></tr><c:forEach var="item" items="${project.eb}"><tr><td>${item.designation}</td><td>${item.name}</td><td>${item.phone}</td><td>${item.primaryEmail}</td><td>${item.secondaryEmail}</td></tr></c:forEach></tbody></table>";
                //document.getElementById('doubletable').innerHTML="Hello";
            }
            else
            {
                console.log("inside else",cost);
               document.getElementById('singletable').innerHTML="<b>PMRC COMMITTEE DETAILS</b><br> <table><tbody><tr><th>Designation</th><th>Name</th><th>Phone No.</th><th>Email ID(1)</th><th>Email ID(2)</th></tr><c:forEach var="item" items="${project.pmrc}"><tr><td>${item.designation}</td><td>${item.name}</td><td>${item.phone}</td><td>${item.primaryEmail}</td><td>${item.secondaryEmail}</td></tr></c:forEach></tbody></table>";
            }

        }
    </script>
    <jsp:include page="header.jsp" />
</head>
<body onload="checking();">
<fieldset>
    <br>
    <center><b>Details for Project ${project.projectNo}</b>
    </center>
    <br>
    </center>
    <br>

    <label class="labeldesign">Project Number	:</label>
    <label class="inputdesign" type="text" name="Project_Number">${project.projectNo}</label>
    <br>
    <br>

    <label class="labeldesign">Title of Project	:</label>
    <label class="inputdesign" type="text" name="title_of_project">${project.titleOfProject}</label>
    <br>
    <br>

    <label class="labeldesign">Project Category	:</label>
    <label class="inputdesign" type="text" name="project_category">${project.projectCategory}</label>
    <br>
    <br>

    <label class="labeldesign">Nodal Labname	:</label>
    <label class="inputdesign" type="text" name="nodal_lab_name">${project.nodalLabName}</label>
    <br>
    <br>

    <label class="labeldesign">Other Labs	:</label>
    <c:forEach var="item" items="${project.otherLabs}">
        <label class="inputdesign" type="text" name="project_lab_mapping" style="display: block">${item}</label>
    </c:forEach>
    <br>
    <br>

    <label class="labeldesign">Planning status	:</label>
    <label class="inputdesign" type="text" name="planning_status">${project.planningStatus}</label>
    <br>
    <br>

    <label class="labeldesign">Project Security Level	:</label>
    <label class="inputdesign" type="text" name="project_security_level">${project.projectSecurityLevel}</label>
    <br>
    <br>

    <label class="labeldesign">Total Cost	:</label>
    <label class="inputdesign" type="text" name="total_cost_cr">${project.totalCost}</label>
    <br>
    <br>

    <label class="labeldesign">Sanction Date	:</label>
    <label class="inputdesign" type="text" name="date_of_sanction">${project.sanctionDate}</label>
    <br>
    <br>

    <label class="labeldesign">PDC	:</label>
    <label class="inputdesign" type="text" name="pdc">${project.pdc}</label>
    <br>
    <br>

    <label class="labeldesign">Govt. Letter Number	:</label>
    <label class="inputdesign" type="text" name="govt_letter_no">${project.govtLetterNo}</label>
    <br>
    <br>

    <label class="labeldesign">Govt. Letter Date	:</label>
    <label class="inputdesign" type="text" name="govt_letter_date">${project.govtLetterDate}</label>
    <br>
    <br>

    <label class="labeldesign">Objectives	:</label>
    <c:forEach var="item" items="${project.objectives}">
        <label class="inputdesign" type="text" name="project_lab_mapping" style="display: block">${item}</label>
    </c:forEach>
    <br>
    <br>

    <label class="labeldesign">Scopes	:</label>
    <c:forEach var="item" items="${project.scopes}">
        <label class="inputdesign" type="text" name="project_lab_mapping" style="display: block">${item}</label>
    </c:forEach>
    <br>
    <br>

    <!-- Code bY Vinay-->
   <!-- <center><b>Committee Details</b></center> -->
<div id="doubletable">

</div>

    <div id="singletable">

    </div>


</fieldset>
</body>
</html>