<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<title> Show Details</title>
    <jsp:include page="header.jsp" />
</head>
<body>
<%
    String old_project_no=request.getParameter("projectNo");

%>
<form action="update" method="post" onsubmit="submitt()">
<fieldset>

    <br>
    <center><b>Details for Project ${project.projectNo}</b>
    </center>
    <br>
    </center>
    <br>
    <label class="labeldesign">Project Number	:</label>
    <label class="inputdesign" id="projectnol" type="text" name="Project_Number">${project.projectNo}</label>
    <input id="projectno" type="text" style="display:none"/>
     <input type="button" value="edit" id="edit1" onclick="edit20('projectnol','projectno','1')"/>
    <br>
    <br>
    <label class="labeldesign">Title of Project	:</label>
    <label class="inputdesign" id="projecttitlel" type="text" name="title_of_project">${project.titleOfProject}</label>
    <input id="projecttitle" type="text" style="display: none"/>
     <input type="button" value="edit" id="edit2" onclick="edit20('projecttitlel','projecttitle','2')">
    <br>
    <br>
    <label class="labeldesign">Project Category	:</label>
    <label class="inputdesign" id="projectcategoryl"type="text" name="project_category">${project.projectCategory}</label>
     <input id="projectcategory" type="text" style="display: none"/>
     <input type="button" value="edit" id="edit3" onclick="edit20('projectcategoryl','projectcategory','3')">
    <br>
    <br>
    <label class="labeldesign">Nodal Labname	:</label>
    <label class="inputdesign" id="nodallabnamel"type="text" name="nodal_lab_name">${project.nodalLabName}</label>
     <input id="nodallabname" type="text" style="display: none"/>
     <input type="button" value="edit" id="edit4" onclick="edit20('nodallabnamel','nodallabname','4')">
    <br>
    <br>
    <label class="labeldesign">Planning status	:</label>
    <label class="inputdesign" id="planningstatusl"type="text" name="planning_status">${project.planningStatus}</label>
     <input id="planningstatus" type="text" style="display: none"/>
     <input type="button" value="edit" id="edit6" onclick="edit20('planningstatusl','planningstatus','6')">
    <br>
    <br>
    <label class="labeldesign">Project Security Level	:</label>
    <label class="inputdesign" id="projectsecurityl" type="text" name="project_security_level">${project.projectSecurityLevel}</label>
     <input id="projectsecurity" type="text" style="display: none"/>
     <input type="button" value="edit" id="edit7" onclick="edit20('projectsecurityl','projectsecurity','7')">
    <br>
    <br>
    <label class="labeldesign">Total Cost	:</label>
    <label class="inputdesign" id="totalcostl" type="text" name="total_cost_cr">${project.totalCost}</label>
     <input id="totalcost" type="text" style="display: none"/>
     <input type="button" value="edit" id="edit8" onclick="edit20('totalcostl','totalcost','8')">
    <br>
    <br>
    <label class="labeldesign">Sanction Date	:</label>
    <label class="inputdesign" id="sanctiondatel" type="text" name="date_of_sanction">${project.sanctionDate}</label>
     <input id="sanctiondate" type="text" style="display: none"/>
     <input type="button" value="edit" id="edit9" onclick="edit20('sanctiondatel','sanctiondate','9')">
    <br>
    <br>
    <label class="labeldesign">PDC	:</label>
    <label class="inputdesign" id="pdcl" type="text" name="pdc">${project.duration}</label>
     <input id="pdc" type="text" style="display: none"/>
     <input type="button" value="edit" id="edit10" onclick="edit20('pdcl','pdc','10')">
    <br>
    <br>
    <label class="labeldesign">Govt. Letter Number	:</label>
    <label class="inputdesign" id="govtletternol" type="text" name="govt_letter_no">${project.govtLetterNo}</label>
     <input id="govtletterno" type="text" style="display: none"/>
     <input type="button" value="edit" id="edit11" onclick="edit20('govtletternol','govtletterno','11')">
    <br>
    <br>
    <label class="labeldesign">Govt. Letter Date	:</label>
    <label class="inputdesign" id="govtletterdatel" type="text" name="govt_letter_date">${project.govtLetterDate}</label>
     <input id="govtletterdate" type="text" style="display: none"/>
     <input type="button" value="edit" id="edit12" onclick="edit20('govtletterdatel','govtletterdate','12')">
    <br>
    <br>
     <center><input type="submit" style="text-align:center;width:150;height:30;font-size:15" value="Submit Data"></center>
    </fieldset>
<script>
var temp=${project.temporary};
function edit20(id2,id3,id4){
 if((id3=="projectno"||id3=="sanctiondate"||id3=="govtletterdate"||id3=="govtletterno")&&(temp=='n'))
 { document.getElementById("edit"+id4).style.display="none";
 alert("cannot be edited");
 }
 else
 {
	document.getElementById(id3).style.display="";
	document.getElementById(id2).style.display="none";
	var abc=document.getElementById(id3);
	var bca=document.getElementById(id2);
	abc.setAttribute("value",bca.innerHTML);
	document.getElementById("edit"+id4).style.display="none";
    if(id3=="projectno"||id3=="sanctiondate"||id3=="govtletterdate"||id3=="govtletterno")
    document.getElementById("TEMPORARY").value='n';
}}
function submitt(){
	var abcq=document.getElementById("projectno");
	var abcq1=document.getElementById("projecttitle");
	var abcq2=document.getElementById("projectcategory");
	var abcq3=document.getElementById("nodallabname");
	var abcq4=document.getElementById("planningstatus");
	var abcq5=document.getElementById("projectsecurity");
	var abcq6=document.getElementById("totalcost");
	var abcq7=document.getElementById("sanctiondate");
	var abcq8=document.getElementById("pdc");
	var abcq9=document.getElementById("govtletterno");
	var abcq10=document.getElementById("govtletterdate");
	var bcaq=document.getElementById("projectnol");
	var bcaq1=document.getElementById("projecttitlel");
	var bcaq2=document.getElementById("projectcategoryl");
	var bcaq3=document.getElementById("nodallabnamel");
	var bcaq4=document.getElementById("planningstatusl");
	var bcaq5=document.getElementById("projectsecurityl");
	var bcaq6=document.getElementById("totalcostl");
	var bcaq7=document.getElementById("sanctiondatel");
	var bcaq8=document.getElementById("pdcl");
	var bcaq9=document.getElementById("govtletternol");
	var bcaq10=document.getElementById("govtletterdatel");
	abcq.setAttribute("value",bcaq.innerHTML);
	abcq1.setAttribute("value",bcaq1.innerHTML);
	abcq2.setAttribute("value",bcaq2.innerHTML);
	abcq3.setAttribute("value",bcaq3.innerHTML);
	abcq4.setAttribute("value",bcaq4.innerHTML);
	abcq5.setAttribute("value",bcaq5.innerHTML);
	abcq6.setAttribute("value",bcaq6.innerHTML);
	abcq7.setAttribute("value",bcaq7.innerHTML);
	abcq8.setAttribute("value",bcaq8.innerHTML);
	abcq9.setAttribute("value",bcaq9.innerHTML);
	abcq10.setAttribute("value",bcaq10.innerHTML);
var abc=document.getElementById("projectno").value;
var abc1=document.getElementById("projecttitle").value;
var abc2=document.getElementById("projectcategory").value;
var abc3=document.getElementById("nodallabname").value;
var abc4=document.getElementById("planningstatus").value;
var abc5=document.getElementById("projectsecurity").value;
var abc6=document.getElementById("totalcost").value;
var abc7=document.getElementById("sanctiondate").value;
var abc8=document.getElementById("pdc").value;
var abc9=document.getElementById("govtletterno").value;
var abc10=document.getElementById("govtletterdate").value;
console.log(abc);
document.getElementById("PROJECTNO").value=abc;
document.getElementById("PROJECTTITLE").value=abc1;
document.getElementById("PROJECTCATEGORY").value=abc2;
document.getElementById("NODALLABNAME").value=abc3;
document.getElementById("PLANNINGSTATUS").value=abc4;
document.getElementById("PROJECTSECURITY").value=abc5;
document.getElementById("TOTALCOST").value=abc6;
document.getElementById("SANCTIONDATE").value=abc7;
document.getElementById("PDC").value=abc8;
document.getElementById("GOVTLETTERNO").value=abc9;
document.getElementById("GOVTLETTERDATE").value=abc10;
}
</script>
<input type="hidden" id="PROJECTNO"  name="PROJECTNO" value="" />
<input type="hidden" id="PROJECTTITLE"  name="PROJECTTITLE" value="" />
<input type="hidden" id="PROJECTCATEGORY"  name="PROJECTCATEGORY" value="" />
<input type="hidden" id="NODALLABNAME"  name="NODALLABNAME" value="" />
<input type="hidden" id="PLANNINGSTATUS"  name="PLANNINGSTATUS" value="" />
<input type="hidden" id="PROJECTSECURITY"  name="PROJECTSECURITY" value="" />
<input type="hidden" id="TOTALCOST"  name="TOTALCOST" value="" />
<input type="hidden" id="SANCTIONDATE"  name="SANCTIONDATE" value="" />
<input type="hidden" id="PDC"  name="PDC" value="" />
<input type="hidden" id="GOVTLETTERNO"  name="GOVTLETTERNO" value="" />
<input type="hidden" id="GOVTLETTERDATE"  name="GOVTLETTERDATE" value="" />
<input type="hidden" id="TEMPORARY" name='TEMPORARY' value=""/>
    <input type="hidden" name="old_project_no" value=<%=old_project_no%> />
 </form>
    </body>
</html>
