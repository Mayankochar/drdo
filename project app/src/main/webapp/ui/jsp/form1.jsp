<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<html>
<head>
    <title>Form 1</title>
    <link rel="stylesheet" href="<c:url value="../../ui/static/form1.css" />" type="text/css">
	<script>
     //Making Global Variables For inlinine Calling Of Functions




		function dobjectives()
		{
			document.getElementById('dobjectives').innerHTML="<br><form:input type='text' path='objectives' class='form:inputdesign' />";
		}
		function dscopes()
		{
			document.getElementById('dscopes').innerHTML="<br><form:input type='text' path='scope' class='form:inputdesign' />";
		}
		function dynamicdeliverables()
		{

			document.getElementById('dynamicdeliverables').innerHTML="<br><form:input type='text' class='form:inputdesign' path='dynamicdeliverables' />";
		}

		function otherlabs()
		{
			document.getElementById('otherlabs').innerHTML="<br><label path='otherLabs' class='form:labeldesign'><b>If Other Labs Mention Them </b><form:label path='otherLabs' class='form:labeldesign'></form:label><form:input path='otherLabs' class='form:inputdesign' type='text' size="25" />";
		}
	</script>




	<script>
		var count=0;
		var count1=0;
		function dfunddetails()
		{
			dmcount++;
			console.log('value of dmcount is',dmcount);
			count++;
			count1=count+1;

			var str="<br><br><select class='labeldesign' id="+'fundtype'+count+" onchange='daddMajor(this.id)' required=\"required\"><option value='2080'>Revenue</option><option value='4076'>Capital</option></select><input type='text' id="+'idmajh'+count+" style=\"position:absolute;left:300px;width:130px\" placeholder='Major Head' value='Major Head is 2080' required=\"required\"/><select id="+'idminh'+count+" style=\"position:absolute;left:470px;width:130px\" id='idminh' required=\"required\"><option>Minor Head</option><option>105</option><option>110</option><option>111</option></select><select style=\"position:absolute;left:620px;width:130px\" id="+'title'+count+" required=\"required\"><option>Select Title</option><option value='Transportation'>Transportation(Movement Of Stores)</option><option value='Stores'>Stores</option><option value='Equipments'>Equipments</option><option value='Stores'>Stores</option><option value='CARS'>CARS</option><option value='CAPSI'>CAPSI</option><option value='Consultancy Contracts'>Consultancy Contracts</option><option value='Subprojects'>Sub-projects</option><option value='Job Work'>Job Work</option><option value='Contracts'>Contracts</option><option value='Hiring Of Transport'>Hiring Of Transport</option><option value='FOL for Project Vehicles'>FOL for Project Vehicles</option><option value='Hiring Of technical Services'>Hiring Of technical Services</option><option value='Contigency And Miscellaneous'>Contigency&Miscellaneous</option><option value='Works'>Works</option></select><input type='text' id="+'idic'+count+" style=\"position:absolute;left:770px;width:130px\" placeholder='IC' onkeypress=\"return isNumberKey(event,this)\" required=\"required\"/><input type='text' id="+'idfe'+count+" style=\"position:absolute;left:920px;width:130px\" placeholder='FE' onkeypress=\"return isNumberKey(event,this)\" required=\"required\"/><br><div id='dfunddetails"+count1+"'></div>"

			did='dfunddetails'+count;

			console.log(did);
			document.getElementById(did).innerHTML=str;

			console.log("count is",count);
			return did;
		}


	</script>
	<script>
		function addFundAjax()
		{
			console.log("Value of count in add fund ajax",count);
			var fundtypeArray=[];
			var fundminh=[];
			var fundit=[];
			var fundic=[];
			var fundfe=[];
			var fundtitle=[];
			//console.log('inside add fund');
			var element=document.getElementById('fundtype').value;
			var hiddenidminh=document.getElementById('idminh').value;
			var hiddentitle=document.getElementById('title').value;
			<!--var hiddenidit=document.getElementById('idit').value;-->
			var hiddenidic=document.getElementById('idic').value;
			var hiddenidfe=document.getElementById('idfe').value;
			console.log('before loop ',element);
			fundtypeArray.push(element);
			fundminh.push(hiddenidminh);
			//fundit.push(hiddenidit);
			fundic.push(hiddenidic);
			fundfe.push(hiddenidfe);
			fundtitle.push(hiddentitle);
			//console.log("Element is ",element);


			for(i=1;i<=count;i++)
			{	var element=document.getElementById('fundtype'+i).value;

				var hiddenidminh=document.getElementById('idminh'+i).value;
				var hiddentitle=document.getElementById('title'+i).value;
				//var hiddenidit=document.getElementById('idit'+i).value;
				var hiddenidic=document.getElementById('idic'+i).value;
				var hiddenidfe=document.getElementById('idfe'+i).value;
				console.log("Before Pushing Element is",element);
				fundtypeArray.push(element);
				console.log("After pushed value from array is ",fundtypeArray[i]);
				fundminh.push(hiddenidminh);
				//fundit.push(hiddenidit);
				fundic.push(hiddenidic);
				fundfe.push(hiddenidfe);
				fundtitle.push(hiddentitle);
				console.log("Loop is executing ",i);
				//console.log("Fund Type Element is ",element);
			}
			//Printong Array to console of fund details
			console.log("Printing FundTitle");

				for (var i in fundtitle)
				{

					console.log(" " + fundtitle[i]);
				}


			console.log("Printing FundType");

			for (var xx=0;xx<=count;xx++)
			{
				console.log(" " + fundtypeArray[xx]);
			}

			//console.log("Printing FundIt");

			/*for (var i in fundit)
			{
				console.log(" " + fundit[i]);
			}*/
			console.log("Printing FundIc");
			for (var i in fundic)
			{
				console.log(" " + fundic[i]);
			}

			console.log("Printing Fundfe");
			for (var i in fundfe)
			{
				console.log(" " + fundfe[i]);
			}

			console.log("Printing fundminh");
			for (var i in fundminh)
			{
				console.log(" " + fundminh);
			}
			console.log("Array Printed Sucessfully");
			document.getElementById('hiddentitle').value=fundtitle;
			document.getElementById('hiddenfundtype').value=fundtypeArray;
			//document.getElementById('hiddenit').value=fundit;
			document.getElementById('hiddenic').value=fundic;
			document.getElementById('hiddenfe').value=fundfe;
			document.getElementById('hiddenminh').value=fundminh;

			//document.getElementById('FundAddedSucessfully').innerHTML="Fund Added Sucessfully";

            adddeliverablesAjax();
            addScopesAjax();
            addOjectivesAjax();







		}
	</script>
	<script>
		function isNumberKey(evt, ctrlName)
		{
			var str = ctrlName.value;
			var charCode = (evt.which) ? evt.which : event.keyCode
			if (charCode > 31 && (charCode < 48 && charCode != 46) || charCode > 57)
			{
				return false;
			}
			else if (charCode == 46 && (str.indexOf(".") != -1))
			{
				return false;
			}
			else
			{
				return true;
			}
		}
	</script>
	<script>
		var objcount=0;
		var objcount1=0;
		function dobjectives()
		{
			objcount++;
			objcount1=objcount+1;

			var str="<input type='text' id="+'objectives'+objcount+" class='inputdesign' placeholder='Enter Objective'/><br><div id='dobjectives"+objcount1+"'></div>"

			objdid='dobjectives'+objcount;

			console.log(objdid);
			document.getElementById(objdid).innerHTML=str;

			console.log("count is",objcount);
			return objdid;
		}
		function addOjectivesAjax()
		{
			console.log("addObjectivesAjax Called");
			var objectivetypeArray=[];
			var objectives=document.getElementById('objectives').value;
			objectivetypeArray.push(objectives);
			for(j=1;j<=objcount;j++)
			{	var objectives=document.getElementById('objectives'+j).value;
				objectivetypeArray.push(objectives);
			}
			document.getElementById('objectivepass').value=objectivetypeArray;
			//document.getElementById('ObjectiveAdded').innerHTML="Objectives Added";
		}
	</script>

	<script>

		var scopecount=0;
		var scopecount1=0;
		function dscopes()
		{
			scopecount++;
			scopecount1=scopecount+1;

			var str="<input type='text' id="+'scopes'+scopecount+" class='inputdesign' placeholder='Enter Scopes'/><br><div id='dscopes"+scopecount1+"'></div>"

			scopedid='dscopes'+scopecount;

			console.log(scopedid);
			document.getElementById(scopedid).innerHTML=str;

			console.log("scopecount is",scopecount);
			return scopedid;
		}
		function addScopesAjax()
		{
			console.log("addScopesAjax Called");
			var scopetypeArray=[];
			var scopes=document.getElementById('scopes').value;
			scopetypeArray.push(scopes);
			for(s=1;s<=scopecount;s++)
			{	var scopes=document.getElementById('scopes'+s).value;
				scopetypeArray.push(scopes);
			}
			document.getElementById('scopespass').value=scopetypeArray;
			//document.getElementById('scopesAdded').innerHTML="Scopes Added";
		}




	</script>

	<script>

		var deliverablescount=0;
		var deliverablescount1=0;
		function ddeliverables()
		{
			deliverablescount++;
			deliverablescount1=deliverablescount+1;

			var str="<input type='text' id="+'deliverables'+deliverablescount+" class='inputdesign' placeholder='Enter deliverables'/><br><div id='ddeliverables"+deliverablescount1+"'></div>"

			deliverablesdid='ddeliverables'+deliverablescount;

			console.log(deliverablesdid);
			document.getElementById(deliverablesdid).innerHTML=str;

			console.log("deliverablescount is",deliverablescount);
			return deliverablesdid;
		}
		function adddeliverablesAjax()
		{
			console.log("addDeliveralesAjax Called");
			var deliverablestypeArray=[];
			var deliverables=document.getElementById('deliverables').value;
			deliverablestypeArray.push(deliverables);
			for(d=1;d<=deliverablescount;d++)
			{	var deliverables=document.getElementById('deliverables'+d).value;
				deliverablestypeArray.push(deliverables);
			}
			document.getElementById('deliverablespass').value=deliverablestypeArray;
			//document.getElementById('deliverablesAdded').innerHTML="Deliverables Saved";
		}




	</script>
	<script>
		function addMajor()
		{
			console.log("Inside Major Function");

			var major=document.getElementById('fundtype').value;
			if(major==2080)
			{
				console.log("Inside Major Function else");
				document.getElementById('idmajh').value="Major Head is 2080";
				document.getElementById('idminh').innerHTML="<option>Minor Head</option><option>105</option><option>110</option><option>111</option>";
			}
			else
			{
				document.getElementById('idmajh').value="Major Head is 4076";
				document.getElementById('idminh').innerHTML="<option>Minor Head</option><option>052</option><option>111</option>";
			}
		}
		var dmcount=0;
		function daddMajor(did)
		{
			console.log('value of id is',did);
			var dmajor=document.getElementById(did).value;
			//var dmajor=document.getElementById('fundtype'+dmcount).value;
			var lastChar = did[did.length -1];
			if(dmajor==2080)
			{
				console.log("Inside Major Function else");
				document.getElementById('idmajh'+lastChar).value="Major Head is 2080";
				document.getElementById('idminh'+lastChar).innerHTML="<option>Minor Head</option><option>105</option><option>110</option><option>111</option>";
			}
			else
			{
				document.getElementById('idmajh'+lastChar).value="Major Head is 4076";
				document.getElementById('idminh'+lastChar).innerHTML="<option>Minor Head</option><option>052</option><option>111</option>";
			}

		}
	</script>




	<!-- Mayank Script -->

	<script>


		var arrHead = new Array();
		arrHead = [ 'Para/Item Number', 'Description', 'Page Nos.' ];
		function createTable(id1) {
			var table1 = document.createElement('table');
			table1.setAttribute('id', id1);
			table1.setAttribute("class", "transform");
			var tr = table1.insertRow();
			for (var h = 0; h < arrHead.length; h++) {
				var th = document.createElement('th');
				th.innerHTML = arrHead[h];
				 th.style['border']='1px solid';
				tr.appendChild(th);
			}
			if (id1 == 'table1')
				var div = document.getElementById('cont');
			else
				var div = document.getElementById('contq');
			div.appendChild(table1);
		}
		function addrow1(id1) {
			var empTab = document.getElementById(id1);
			var rowCnt = empTab.rows.length;
			var tr = empTab.insertRow(rowCnt);
			tr = empTab.insertRow(rowCnt);
			for (var c = 0; c < arrHead.length; c++) {
				var td = document.createElement('td');
				td = tr.insertCell(c);
				var ele = document.createElement('input');
				if(c==0)
				ele.setAttribute('onkeypress','return isNumberKey(event,this)');
				if(c==2)
                				ele.setAttribute('onkeypress','return isNumberKey(event,this)');
				if(c==1)
					ele.style["textTransform"]='uppercase';
				ele.setAttribute('type', 'text');
				ele.setAttribute('value', '');
				ele.style['width'] = '220px';
				ele.style['height'] = '25px';
				ele.style['textAlign'] = 'center';
				ele.style['fontSize'] = '16px';
				ele.style['backgroundColor'] = 'white';
				ele.style['color'] = '#282828';
					ele.required='true';
                ele.style['border']='1px solid';
				td.appendChild(ele);
			}
		}
		var values1=new Array();
		var values2=new Array();
		function submittable(id1) {
			var myTab = document.getElementById(id1);

			row = myTab.rows.length - 2;
			 for (row = 1; row < myTab.rows.length - 1; row++) {
			for (c = 0; c < myTab.rows[row].cells.length; c++) {
				var element = myTab.rows.item(row).cells[c];
				if (id1 == 'table2')
					values1.push(element.childNodes[0].value);//MicroTable data array
				else
					values2.push(element.childNodes[0].value);//MacroTable data array
			}
			 }
				document.getElementById('microtable').value=values1;
            			document.getElementById('macrotable').value=values2;
			console.log(values2);
			console.log(values1);
		}
	</script>
	<!-- For Disabling Field By Vinay-->
	<script>
		function makedisable(str) {

			console.log('Inside makedisable',str);
				document.getElementById('d1').disabled=str;
				//document.getElementById('d2').disabled=str;
				document.getElementById('d3').disabled=str;
				document.getElementById('d4').disabled=str;
			}

	</script>





	<jsp:include page="header.jsp" />
</head>
<body onload="createTable('table1'); addrow1('table1'); createTable('table2'); addrow1('table2'); ">
<h1 class="center1">STATEMENT OF CASE FOR SANCTION OF PROJECT</h1>
<br>
<br>

<form:form class="center2" id="form1" name="form1" method="post" action="getForm1PDF" modelAttribute="project">
	<form:label path="projectNo" class="labeldesign"><b>Project No</b></form:label>
	<form:input path="projectNo" class="inputdesign" name="" type="text" size="25" required="required"/>
	<br>
	<br>
	<form:label path="temporary" class="labeldesign" ><b>Project Sanctioned ?</b>
		<div class="checkboxdesign">
			<form:radiobutton path="temporary" value="n" required="required" onclick="makedisable(false)"/>Yes
			<form:radiobutton path="temporary" value="y" required="required" onclick="makedisable(true)"/>No
		</div>
	</form:label>
	<br>
	<br>
	<form:label path="titleOfProject" class="labeldesign"><b>Title of the Project:</b>
		<form:label class="labeldesign" path="titleOfProject"></form:label>
	<form:input class="inputdesign" path="titleOfProject" type="text" size="25" required="required" style="text-transform:uppercase"/>
	</form:label>
	<br>
	<br>
	<form:label path="nodalLabName" class="labeldesign"><b>Nodal Lab Name:</b>
		<form:label path="nodalLabName" class="labeldesign"></form:label>
		<form:input path="nodalLabName" class="inputdesign" type="text" size="25" style="text-transform:uppercase"/>
	</form:label>
	<br>
	<br>

	<form:label path="otherLabs" class="labeldesign"><b>If Other Labs Mention Them </b>
		<form:label path="otherLabs" class="labeldesign"></form:label>
		<form:input path="otherLabs" class="inputdesign" type="text" size="25" style="text-transform:uppercase"/>
		<div id="otherlabs"></div>

	</form:label>
	<br>
	<br>

	<form:label path="planningStatus" class="labeldesign"><b>Plan or Non-Plan Project ?</b>
		<div class="checkboxdesign">
			<form:radiobutton path="planningStatus" value="P" required="required"/>Yes
			<form:radiobutton path="planningStatus" value="N" required="required"/>No
		</div>
	</form:label>
	<br>
	<br>

	<form:label path="projectCategory" class="labeldesign"><b>Category:</b>
		<form:label path="projectCategory" class="labeldesign"></form:label>
		<br>
		<br>
		<div class="checkboxdesign">
			<form:select path="projectCategory" required="required">
				<option>Select Category</option>
				<option value="Mission Mode" > Mission Mode (MM) </option>
				<option value="Mission Mode" > Technology Demonstration (TD)  </option>
				<option  value="Science And Technology">Science & Technology (S & T) </option>
				<option  value="Infrastructure And Facilities">Infrastructure & Facilities (IF) </option>
				<option  value="Product Support">Product Support (PS) </option>
				<option  value="MMUT">Mission Mode (User Trials) (MM - UT)</option>
			</form:select>
		</div>
	</form:label >
    <br>
    <br>
	<form:label path="projectSecurityLevel" class="labeldesign">

        <b>Security classification of project:</b></form:label>
		<div class="checkboxdesign">
			<form:select path="projectSecurityLevel" required="required">
				<option>Select Security</option>
				<option value="Top Secret" > Top Secret </option>
				<option value="Secret" > Secret  </option>
				<option  value="Confidential">Confidential </option>
				<option  value="Restricted">Restricted </option>
				<option  value="Product Support">Product Support (PS) </option>
				<option  value="NIL">NIL</option>
			</form:select>
		</div>

	<br>
	<br>
	<form:label path="totalCost" class="labeldesign"><b>Cost (Rs in Cr):</b>

		<form:input class="inputdesign" onkeypress="return isNumberKey(event,this)" path="totalCost" type="text" size="25" value="" required="required"/>
	</form:label>
	<br>
	<br>

	<form:label path="foreignExchange" class="labeldesign"><b>FE(Rs in Cr)</b></form:label>
	<form:input path="foreignExchange" type="text" class="inputdesign" onkeypress="return isNumberKey(event,this)" required="required"></form:input>


	<br>
	<br>

	<form:label path="sanctionDate" class="labeldesign"><b>Sanction Date:</b>
		<form:label path="sanctionDate" class="labeldesign"></form:label>
		<form:input id="d1" class="inputdesign" path="sanctionDate" type="Date" size="25" value="" />
	</form:label>
	<br>
	<br>
	<form:label path="duration" class="labeldesign"><b>Duration(Months)</b></form:label>
	<form:input id="d2" type="text" path="duration" class="inputdesign" onkeypress="return isNumberKey(event,this)" />
	<br>
	<br>

	<form:label path="govtLetterNo" class="labeldesign"><b>Govt Letter No</b></form:label>
	<form:input id="d3" type="text" path="govtLetterNo" class="inputdesign" onkeypress="return isNumberKey(event,this)" />
	<br>
	<br>

	<form:label path="govtLetterDate" class="labeldesign"><b>govtLetterDate</b></form:label>
	<form:input id="d4" type="Date" path="govtLetterDate" class="inputdesign" />
	<br>
	<br>



	<label class="labeldesign"><b>Objectives</b></label>
	<input id="objectives" type="text" class="inputdesign" placeholder='Enter Objective' style="text-transform:uppercase"/>
	<br>
	<br>
	<div id="dobjectives1"></div>
	<input type="button" onclick="dobjectives()" class="button" value="Add More Objectives" />
	<br>
	<br>
	<!--<input type="button" onclick="addOjectivesAjax()" class="button1" value="Save Objectives" />-->
	<br>
	<div class="inputdesign" id="ObjectiveAdded"></div>
	<br>
	</label>


	<label class="labeldesign"><b>scopes</b></label>
	<input type="text" id="scopes" class="inputdesign" placeholder="Enter Scopes" style="text-transform:uppercase"/>
	<br>
	<br>
	<div id="dscopes1"></div>
	<input type="button" onclick="dscopes()" class="button" value="Add More Scopes" />
	<br>
	<br>
	<!--<input type="button" onclick="addScopesAjax()" class="button1" value="Save Scopes" />-->
	<br>
	<div class="inputdesign" id="scopesAdded"></div>
    <br>
    <br>






	<label class="labeldesign"><b>Deliverables</b></label>
	<input type="text" id="deliverables" class="inputdesign" placeholder="Enter Deliverables" style="text-transform:uppercase"/>
	<br>
	<br>
	<div id="ddeliverables1"></div>

	<input type="button" class="button" onclick="ddeliverables()" value="Add More Deliverables" />
	<br>
	<br>
	<!--<input type="button" class="button1" onclick="adddeliverablesAjax()" value="Save Deliverables" />-->
	<br>


	<div class="inputdesign" id="deliverablesAdded"></div>
	<br>
	<br>




	<label class="labeldesign"><b>FundDetails(In Crores)</b></label>




	<br>
	<br>
	<select class="labeldesign" id='fundtype' onchange="addMajor()" required="required">
		<option value='2080'>Revenue</option>
		<option value='4076'>Capital</option>
	</select>


	<input type='text'  style="position:absolute;left:300px;width:130px" placeholder="Major Head" id='idmajh' value="Major Head is 2080" required="required"/>

	<select style="position:absolute;left:470px;width:130px" id='idminh' required="required">

		<option>Minor Head</option>
		<option>105</option>
		<option>110</option>
		<option>111</option>
		</div>
	</select>


	<select style="position:absolute;left:620px;width:130px" id='title' required="required" >
		<option >Select Title</option>
		<option value="Transportation">Transportation(Movement Of Stores)</option>
		<option value="Stores">Stores</option>
		<option value="Equipments">Equipments</option>
		<option value="Stores">Stores</option>
		<option value="CARS">CARS</option>
		<option value="CAPSI">CAPSI</option>
		<option value="Consultancy Contracts">Consultancy Contracts</option>
		<option value="Subprojects">Sub-projects</option>
		<option value="Job Work">Job Work</option>
		<option value="Contracts">Contracts</option>
		<option value="Hiring Of Transport">Hiring Of Transport</option>
		<option value="FOL for Project Vehicles">FOL for Project Vehicles</option>
		<option value="Hiring Of technical Services">Hiring Of technical Services</option>
		<option value="Contigency And Miscellaneous">Contigency&Miscellaneous</option>
		<option value="Works">Works</option>
	</select>


	<input type='text' style="position:absolute;left:770px;width:130px" placeholder="IC" id='idic' onkeypress="return isNumberKey(event,this)" required="required" />

	<input type='text'  style="position:absolute;left:920px;width:130px" placeholder="FE" id='idfe' onkeypress="return isNumberKey(event,this)" required="required" />
	<br>
    <br>

	<div id="dfunddetails1"></div>
	<br>
	<br>
	<input type="button" onclick="dfunddetails()" class="button" value="Add More Funds" />
    <br>
    <br>
    <!--<input type="button" class="button1" onclick="addFundAjax()" value="Submit Funds" />-->
	<br>
    <div class="inputdesign" id="FundAddedSucessfully"></div>
	<br>
	<br>


	<input type="hidden" id="hiddenfundtype"  name="fundType" value="" />
	<input type="hidden" id="hiddenit"  name="item" value="" />
	<input type="hidden" id="hiddenic"  name="ic" value="" />
	<input type="hidden" id="hiddenfe"  name="fe" value="" />
	<input type="hidden" id="hiddenminh"  name="minor_head" value="" />





<!-- Mayank Code-->
	<h3 style="font-size: 120%; font: Comic Sans MS;">Part-I (Macro Details)</h3>
	<div id="cont"></div>
	<p></p>
	<input type="button" class="ex1" id="addRow" value="Add New Row"
		   onclick="addrow1('table1')" />

	<br>
	<br>
	<h3 style="font-size: 120%; font: Comic Sans MS;">Part-II (Micro Details)</h3>
	<p></p>
	<div id="contq"></div>
	<p></p>
	<input type="button" class="ex1" id="addRow" value="Add New Row"
		   onclick="addrow1('table2')" />
		   <br><br>

	<!--code of form1 html by varun starts from here -->

<br>
<!--
	<h4 class="center3">Part-II</h4>
<br>

<br>
<b>1. Brief Technical appreciation</b>(This should include objective, scope, relevances of the project to the charter of the Lab/Estt. and Mission in maximum 1 or 2 pages only).
<div class="checkboxdesign1">
<br><input  type="checkbox" name="checkbox1" value="point1"/>Justification(need) for undertaking the project/programme along with the recommendation of the cluster council/DMC(please attach minutes)
<br><input  type="checkbox" name="checkbox2" value="point2"/>Competence level/prelimenary work done to acquire the same.
<br><input  type="checkbox" name="checkbox3" value="point3"/>Brief of PEARL analysis. Initial MRL indices at the time of undertaking the project and likely MRL levels at the time of closure of the project as accepted by Peer Review Committee.
<br><input  type="checkbox" name="checkbox4" value="point4"/>Peer Review Committe recommendations (please enclose the approved copy of minutes of the peer review committtee meeting).
<br><input  type="checkbox" name="checkbox5" value="point5"/>PERT/Gantt Charts.
<br><input  type="checkbox" name="checkbox6" value="point6"/>Major milestones(not > 6) linking financial outlay and timelines.
<br><input  type="checkbox" name="checkbox6" value="point7"/>Critical factors/technology involved.
<br><input  type="checkbox" name="checkbox6" value="point8"/>High development risk areas and remedial actions proposed.
<br><input  type="checkbox" name="checkbox6" value="point9"/>Plan of action for prototype development/execution plan.
<br><input  type="checkbox" name="checkbox6" value="point10"/>Realisation Plan
<br><input  type="checkbox" name="checkbox6" value="point11"/>Testing Plan
<br><input  type="checkbox" name="checkbox6" value="point12"/>Development Partners.
<br><input  type="checkbox" name="checkbox6" value="point13"/>Production agencies proposed.
<br><input  type="checkbox" name="checkbox6" value="point14"/>Costs benefit analysis/spin-off benefits.
<br><input  type="checkbox" name="checkbox6" value="point15"/>Project management and monitoring structure proposed.
</div>
</label>
<br>

<b>2. If the project is to be executed by multiple laboratories, please outline the agreed work-packages between the various labs/estts.</b>
<br>
<br>
<div class="box_left">
<table border="1">
  <tr>
    <th> S No.</th>
    <th>Nature of Work</th>
    <th>Lab/Estt.</th>
	<th>Cost(Rs. in Cr)</th>
	<th>PDC(in months)</th>
	<th>Remarks</th>
  </tr>
  <tr>
    <td><input  name="textfield8" type="text" size="25" value=""/></td>
    <td><input  name="textfield8" type="text"  size="25" value=""/></td>
    <td><input  name="textfield8" type="text"  size="25" value=""/></td>
	<td><input  name="textfield8" type="text"  size="25" value=""/></td>
	<td><input  name="textfield8" type="text"  size="25" value=""/></td>
	<td><input  name="textfield8" type="text"  size="25" value=""/></td>
  </tr>
  <tr>
    <td><input  name="textfield8" type="text" size="25" value=""/></td>
    <td><input  name="textfield8" type="text" size="25" value=""/></td>
    <td><input  name="textfield8" type="text" size="25" value=""/></td>
	<td><input  name="textfield8" type="text"  size="25" value=""/></td>
	<td><input  name="textfield8" type="text"  size="25" value=""/></td>
	<td><input  name="textfield8" type="text"  size="25" value=""/></td>
  </tr>
 <tr>
    <td><input  name="textfield8" type="text" size="25" value=""/></td>
    <td><input  name="textfield8" type="text" size="25" value=""/></td>
    <td><input  name="textfield8" type="text" size="25" value=""/></td>
	<td><input  name="textfield8" type="text"  size="25" value=""/></td>
	<td><input  name="textfield8" type="text"  size="25" value=""/></td>
	<td><input  name="textfield8" type="text"  size="25" value=""/></td>
  </tr>
</table>
</div>
<br>

<b>3. List of major additional facilities(capital) required for the project</b>
<br>&nbsp&nbsp&nbsp&nbsp(Please highlight status of similar facilities existing with the laboratory as wekk as other RDO labs/estts. and why they cannot be utilized)
<br>
1. <input  name="textfield8" type="text" size="150" value=""/>
<br>
<br>
2. <input  name="textfield8" type="text" size="150" value=""/>
<br>
<br>

<b>4. Major training requirements</b>
<br>
<br>
<div class="box_left">
<table border="1">
  <tr>
    <th> S No.</th>
    <th>Discipline/area for training</th>
    <th>Agency contacted</th>
	<th>No of Personnel proposed to be trained</th>
	<th>Duration</th>
	<th>Cost</th>
	<th>Remarks</th>
  </tr>
  <tr>
    <td><input  name="textfield8" type="text" size="25" value=""/></td>
    <td><input  name="textfield8" type="text"  size="25" value=""/></td>
    <td><input  name="textfield8" type="text"  size="25" value=""/></td>
	<td><input  name="textfield8" type="text"  size="25" value=""/></td>
	<td><input  name="textfield8" type="text"  size="25" value=""/></td>
	<td><input  name="textfield8" type="text"  size="25" value=""/></td>
	<td><input  name="textfield8" type="text"  size="25" value=""/></td>
  </tr>
  <tr>
    <td><input  name="textfield8" type="text" size="25" value=""/></td>
    <td><input  name="textfield8" type="text" size="25" value=""/></td>
    <td><input  name="textfield8" type="text" size="25" value=""/></td>
	<td><input  name="textfield8" type="text"  size="25" value=""/></td>
	<td><input  name="textfield8" type="text"  size="25" value=""/></td>
	<td><input  name="textfield8" type="text"  size="25" value=""/></td>
	<td><input  name="textfield8" type="text"  size="25" value=""/></td>
  </tr>
 <tr>
    <td><input  name="textfield8" type="text" size="25" value=""/></td>
    <td><input  name="textfield8" type="text" size="25" value=""/></td>
    <td><input  name="textfield8" type="text" size="25" value=""/></td>
	<td><input  name="textfield8" type="text"  size="25" value=""/></td>
	<td><input  name="textfield8" type="text"  size="25" value=""/></td>
	<td><input  name="textfield8" type="text"  size="25" value=""/></td>
	<td><input  name="textfield8" type="text"  size="25" value=""/></td>
  </tr>
</table>
</div>
<i>&nbsp&nbsp&nbsp&nbspNote: Correspondence made with the agencies contacted for impairting the training and their willingness for the same should be enclosed.</i>
<br>
<br>
<b>5. Details of Sub-Projects/Work Packages(Seperate Tables)</b>
<br>
<br>
<div class="box_left">
<table border="1">
  <tr>
    <th> S No.</th>
    <th>Title of Sub-Project</th>
    <th>Objectives and Scope of Work</th>
	<th>*DRDO Lab/Estt.</th>
	<th>Cost(Rs. in Cr)</th>
	<th>PDC(in months)</th>
  </tr>
  <tr>
    <td><input  name="textfield8" type="text" size="25" value=""/></td>
    <td><input  name="textfield8" type="text"  size="25" value=""/></td>
    <td><input  name="textfield8" type="text"  size="25" value=""/></td>
	<td><input  name="textfield8" type="text"  size="25" value=""/></td>
	<td><input  name="textfield8" type="text"  size="25" value=""/></td>
	<td><input  name="textfield8" type="text"  size="25" value=""/></td>
  </tr>
  <tr>
    <td><input  name="textfield8" type="text" size="25" value=""/></td>
    <td><input  name="textfield8" type="text" size="25" value=""/></td>
    <td><input  name="textfield8" type="text" size="25" value=""/></td>
	<td><input  name="textfield8" type="text"  size="25" value=""/></td>
	<td><input  name="textfield8" type="text"  size="25" value=""/></td>
	<td><input  name="textfield8" type="text"  size="25" value=""/></td>
  </tr>
 <tr>
    <td><input  name="textfield8" type="text" size="25" value=""/></td>
    <td><input  name="textfield8" type="text" size="25" value=""/></td>
    <td><input  name="textfield8" type="text" size="25" value=""/></td>
	<td><input  name="textfield8" type="text"  size="25" value=""/></td>
	<td><input  name="textfield8" type="text"  size="25" value=""/></td>
	<td><input  name="textfield8" type="text"  size="25" value=""/></td>
  </tr>
</table>
</div>
<i>&nbsp&nbsp&nbsp&nbsp*Sub-Projects can be gien to DRDO labs only. However, work packages can be given to other Govt. agencies like DAE, DoS, Council of Scientific and Industrial Research(CSIR), ISRO etc. Proposals of &nbsp&nbsp&nbsp&nbspSub-Projects/Work Packages duly signed by competent authority should be submitted along with the main proposal.</i>
<br>
<br>

<b>6. Details of CARS</b>
<br>
<br>
<div class="box_left">
<table border="1">
  <tr>
    <th> S No.</th>
    <th>Name of Institute/agency</th>
    <th>Area where R&D is required</th>
	<th>Cost</th>
	<th>PDC</th>
	<th>Confidence level of the agency</th>
	<th>Remarks</th>
  </tr>
  <tr>
    <td><input  name="textfield8" type="text" size="25" value=""/></td>
    <td><input  name="textfield8" type="text"  size="25" value=""/></td>
    <td><input  name="textfield8" type="text"  size="25" value=""/></td>
	<td><input  name="textfield8" type="text"  size="25" value=""/></td>
	<td><input  name="textfield8" type="text"  size="25" value=""/></td>
	<td><input  name="textfield8" type="text"  size="25" value=""/></td>
	<td><input  name="textfield8" type="text"  size="25" value=""/></td>
  </tr>
  <tr>
    <td><input  name="textfield8" type="text" size="25" value=""/></td>
    <td><input  name="textfield8" type="text" size="25" value=""/></td>
    <td><input  name="textfield8" type="text" size="25" value=""/></td>
	<td><input  name="textfield8" type="text"  size="25" value=""/></td>
	<td><input  name="textfield8" type="text"  size="25" value=""/></td>
	<td><input  name="textfield8" type="text"  size="25" value=""/></td>
	<td><input  name="textfield8" type="text"  size="25" value=""/></td>
  </tr>
 <tr>
    <td><input  name="textfield8" type="text" size="25" value=""/></td>
    <td><input  name="textfield8" type="text" size="25" value=""/></td>
    <td><input  name="textfield8" type="text" size="25" value=""/></td>
	<td><input  name="textfield8" type="text"  size="25" value=""/></td>
	<td><input  name="textfield8" type="text"  size="25" value=""/></td>
	<td><input  name="textfield8" type="text"  size="25" value=""/></td>
	<td><input  name="textfield8" type="text"  size="25" value=""/></td>
  </tr>
</table>
</div>
<i>&nbsp&nbsp&nbsp&nbspNote: Correspondence made with the agencies contacted for undertaking the research activity and their willingness for the same should be enclosed..</i>
<br>
<br>

<b>7. Details of Consulatancy requirements</b>
<br>
<br>
<div class="box_left">
<table border="1">
  <tr>
    <th> S No.</th>
    <th>Discipline Area</th>
    <th>Agency</th>
	<th>Cost</th>
	<th>Confidence level of the agency</th>
	<th>Remarks</th>
  </tr>
  <tr>
    <td><input  name="textfield8" type="text" size="25" value=""/></td>
    <td><input  name="textfield8" type="text"  size="25" value=""/></td>
    <td><input  name="textfield8" type="text"  size="25" value=""/></td>
	<td><input  name="textfield8" type="text"  size="25" value=""/></td>
	<td><input  name="textfield8" type="text"  size="25" value=""/></td>
	<td><input  name="textfield8" type="text"  size="25" value=""/></td>
  </tr>
  <tr>
    <td><input  name="textfield8" type="text" size="25" value=""/></td>
    <td><input  name="textfield8" type="text" size="25" value=""/></td>
    <td><input  name="textfield8" type="text" size="25" value=""/></td>
	<td><input  name="textfield8" type="text"  size="25" value=""/></td>
	<td><input  name="textfield8" type="text"  size="25" value=""/></td>
	<td><input  name="textfield8" type="text"  size="25" value=""/></td>
  </tr>
 <tr>
    <td><input  name="textfield8" type="text" size="25" value=""/></td>
    <td><input  name="textfield8" type="text" size="25" value=""/></td>
    <td><input  name="textfield8" type="text" size="25" value=""/></td>
	<td><input  name="textfield8" type="text"  size="25" value=""/></td>
	<td><input  name="textfield8" type="text"  size="25" value=""/></td>
	<td><input  name="textfield8" type="text"  size="25" value=""/></td>
  </tr>
</table>
</div>
<i>&nbsp&nbsp&nbsp&nbspNote: Correspondence nade with the agency contacted for offering consultancy and their willingness for the sme shoukd be enclosed.</i>
<br>
<br>

<b>8. Details of additional manpower requirements</b>
<br>
<br>
<div class="box_left">
<table border="1">
  <tr>
    <th> S No.</th>
    <th>Designation/Rank</th>
    <th>Discipline</th>
	<th>Number(s)</th>
	<th>Period/Duration</th>
	<th>Remarks</th>
  </tr>
  <tr>
    <td><input  name="textfield8" type="text" size="25" value=""/></td>
    <td><input  name="textfield8" type="text"  size="25" value=""/></td>
    <td><input  name="textfield8" type="text"  size="25" value=""/></td>
	<td><input  name="textfield8" type="text"  size="25" value=""/></td>
	<td><input  name="textfield8" type="text"  size="25" value=""/></td>
	<td><input  name="textfield8" type="text"  size="25" value=""/></td>
  </tr>
  <tr>
    <td><input  name="textfield8" type="text" size="25" value=""/></td>
    <td><input  name="textfield8" type="text" size="25" value=""/></td>
    <td><input  name="textfield8" type="text" size="25" value=""/></td>
	<td><input  name="textfield8" type="text"  size="25" value=""/></td>
	<td><input  name="textfield8" type="text"  size="25" value=""/></td>
	<td><input  name="textfield8" type="text"  size="25" value=""/></td>
  </tr>
 <tr>
    <td><input  name="textfield8" type="text" size="25" value=""/></td>
    <td><input  name="textfield8" type="text" size="25" value=""/></td>
    <td><input  name="textfield8" type="text" size="25" value=""/></td>
	<td><input  name="textfield8" type="text"  size="25" value=""/></td>
	<td><input  name="textfield8" type="text"  size="25" value=""/></td>
	<td><input  name="textfield8" type="text"  size="25" value=""/></td>
  </tr>
</table>
</div>
<i>&nbsp&nbsp&nbsp&nbspNote: Addtional manpower requirement should be in consonance with the manpower roadmap submitted to DHRD. Demand for additional manpower will acccrue negative score and will lead towards &nbsp&nbsp&nbsp&nbspless chances of project sanction.</i>
<br>
<br>

<b>9. Details of additional building space requirement</b>
<div class="checkboxdesign1">
<br><input  type="checkbox" name="checkbox1" value="point1"/>(Funds for construction of building shoukd be booked under the Major Head-4076(Capital)/Sub Head-111(Works)
<br><input  type="checkbox" name="checkbox2" value="point2"/>(AE's should be obtained from concerned CCE/DCW&E and appended with the proposal)
</div>
<br>

<b>10. Any other information</b>(Important for the project but not covered above).
<br>
<br>
<input  name="textfield8" type="text" size="184" value="(max 500 characters)"/>
<br>
<br>

<b>11. Comments of Project Director with signature and date</b>
<br>
<br>
<input  name="textfield8" type="text" size="184" value="(max 500 characters)"/>
<br>
<br>

<b>12. Following detials need to be certified by Lab Director</b>
<br>
<b>(i) Manpower of Lab:	&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp		DRDS-  ?		&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp	DRTC  - ??</b>
<br>
<b>Details of the ongoing Projects/Programmes of the lab in hand:	&nbsp&nbsp&nbsp&nbsp	?	</b>
<br>
<br>
<div class="box_left">
<table border="1">
  <tr>
    <th> S No.</th>
    <th>Title of Project</th>
    <th>Project No.</th>
	<th>Cost(in Cr) <br>Original Current</th>
	<th>Date of sanction</th>
	<th>PDC <br>Original/Current</th>
	<th>Name of project Director</th>
	<th>Status of complaints<br>(Desing/Realisation/Testing Stage)</th>
  </tr>
  <tr>
    <td><input  name="textfield8" type="text" size="25" value=""/></td>
    <td><input  name="textfield8" type="text"  size="25" value=""/></td>
    <td><input  name="textfield8" type="text"  size="25" value=""/></td>
	<td><input  name="textfield8" type="text"  size="25" value=""/></td>
	<td><input  name="textfield8" type="text"  size="25" value=""/></td>
	<td><input  name="textfield8" type="text"  size="25" value=""/></td>
	<td><input  name="textfield8" type="text"  size="25" value=""/></td>
	<td><input  name="textfield8" type="text"  size="25" value=""/></td>
  </tr>
  <tr>
    <td><input  name="textfield8" type="text" size="25" value=""/></td>
    <td><input  name="textfield8" type="text" size="25" value=""/></td>
    <td><input  name="textfield8" type="text" size="25" value=""/></td>
	<td><input  name="textfield8" type="text"  size="25" value=""/></td>
	<td><input  name="textfield8" type="text"  size="25" value=""/></td>
	<td><input  name="textfield8" type="text"  size="25" value=""/></td>
	<td><input  name="textfield8" type="text"  size="25" value=""/></td>
	<td><input  name="textfield8" type="text"  size="25" value=""/></td>
  </tr>
 <tr>
    <td><input  name="textfield8" type="text" size="25" value=""/></td>
    <td><input  name="textfield8" type="text" size="25" value=""/></td>
    <td><input  name="textfield8" type="text" size="25" value=""/></td>
	<td><input  name="textfield8" type="text"  size="25" value=""/></td>
	<td><input  name="textfield8" type="text"  size="25" value=""/></td>
	<td><input  name="textfield8" type="text"  size="25" value=""/></td>
	<td><input  name="textfield8" type="text"  size="25" value=""/></td>
	<td><input  name="textfield8" type="text"  size="25" value=""/></td>
  </tr>
</table>
</div>
<br>
<br>


<b>13.	Attribute Table as filled by Director(PM) of cluster DG during Annual Selection of Projects</b>
<br>
<br>
<div class="box_left">
		<table border="1">
		<tr>
			<th>1</th>
			<th>2</th>
			<th>3</th>
			<th>4</th>
			<th colspan="2">5</th>
			<th>6</th>
			<th>7</th>
		</tr>
		<tr>
			<th rowspan = "2">Project Name</th>
			<th rowspan = "2">Alignment with Lab's <br>Mandate/Mission<br><br>(0-5)</th>
			<th rowspan = "2">Core Competence of Lab<br><br>(0-5)</th>
			<th rowspan = "2">Alignment with DRDO's LTTPP<br><br>(0-5)</th>
			<th colspan = "2">Project Output</th>
			<th rowspan = "2">Need for additional HR<br><br>(0 to -5)</th>
			<th rowspan = "2">Total Score<br><br>(Sum of Col 1-6)</th>
		</tr>
		<tr>
			<th>S&T merit<br>(for TD/S&T projects)<br><br>(1 - 5)<br><br>1. low impact<br>5. high imapact/high use</th>
			<th> Potentianl for transisition to next Category/ToT<br>(for TD/MM projects)<br><br>(1 - 5)</th>
		</tr>
		<tr>
			<td><input  name="textfield8" type="text" size="25" value=""/></td>
			<td><input  name="textfield8" type="text" size="25" value=""/></td>
			<td><input  name="textfield8" type="text" size="25" value=""/></td>
			<td><input  name="textfield8" type="text" size="25" value=""/></td>
			<td><input  name="textfield8" type="text" size="25" value=""/></td>
			<td><input  name="textfield8" type="text" size="25" value=""/></td>
			<td><input  name="textfield8" type="text" size="25" value=""/></td>
			<td><input  name="textfield8" type="text" size="25" value=""/></td>
		</tr>
		<tr>
			<td><input  name="textfield8" type="text" size="25" value=""/></td>
			<td><input  name="textfield8" type="text" size="25" value=""/></td>
			<td><input  name="textfield8" type="text" size="25" value=""/></td>
			<td><input  name="textfield8" type="text" size="25" value=""/></td>
			<td><input  name="textfield8" type="text" size="25" value=""/></td>
			<td><input  name="textfield8" type="text" size="25" value=""/></td>
			<td><input  name="textfield8" type="text" size="25" value=""/></td>
			<td><input  name="textfield8" type="text" size="25" value=""/></td>
		</tr>
		<tr>
			<td><input  name="textfield8" type="text" size="25" value=""/></td>
			<td><input  name="textfield8" type="text" size="25" value=""/></td>
			<td><input  name="textfield8" type="text" size="25" value=""/></td>
			<td><input  name="textfield8" type="text" size="25" value=""/></td>
			<td><input  name="textfield8" type="text" size="25" value=""/></td>
			<td><input  name="textfield8" type="text" size="25" value=""/></td>
			<td><input  name="textfield8" type="text" size="25" value=""/></td>
			<td><input  name="textfield8" type="text" size="25" value=""/></td>
		</tr>
		</table>
</div>

<br>
<br>

<b>14. Recommendations of concerned Cluster DG with signature and date.</b>
<br>
<center> ?????? </center>
<br>
<i>Note: Cluster DG will offer his comments/recommendations taking a holistic view on necessity, availability of technology/expertise, manpower, resource availability and overall possibility of successful execution of the project/programme within project timelines.</i>
<br>
<br>
-->
	<!-- code of form1 by Varun ends here -->
	<input type="hidden" id="objectivepass"  name="objectives" value="" />
	<input type="hidden" id="hiddentitle"  name="title" value="" />
	<input type="hidden" id="microtable"  name="microtable" value="" />
    <input type="hidden" id="macrotable"  name="macrotable" value="" />
	<input type="hidden" id="scopespass" name="scopes" value="" />


	<input type="hidden" id="deliverablespass"  name="deliverables" value="" />
	<input type="submit" onclick="addFundAjax();submittable('table2');submittable('table1')" class="button2" value="Submit Form"  />
    <br>
    <br>
    <br><br><br><br>
</form:form>
</body>
</html>
