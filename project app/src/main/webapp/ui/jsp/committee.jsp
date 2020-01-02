
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%--     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> --%>
<!DOCTYPE html>
<html>
<head>
<style>
table {
	border: 1px solid;
	width: 10%;
	font: 18px Times New Roman;
	margin-left: 35px;
}
th {
	border: 1px solid;
	padding: 7px;
}
table, th, td {
	border: 1px solid;
	text-align: center;
	font-weight: bold;
}
h2 {
	font-size: 150%;
	font: Comic Sans MS;
	text-align: center;
}
h1 {
	font-size: 120%;
	font: Comic Sans MS;
	margin-left:35px;
}
input.ex1 {
	margin-left: 35px;
}
</style>
	<jsp:include page="header.jsp" />
</head>
<h2>COMMITTEE MEMBERS LIST</h2>
<body
	onload="checking();">
	<form action="addCommittee" method="post" onsubmit="submittt()">
	<label style="visibility: hidden; font-size:120%; font-weight:bold; margin-left: 35px"id="pmrc" type="text">PMRC MEMBERS LIST</label><br><br>
	<div id="cont"></div>
	<p></p>
	<input type="button" class="ex1" id="addRow" value="Add New Members" style= "visibility: hidden"
		onclick="addrow12('table1')" />
	<br>
	<br>
<label style="visibility: hidden; font-size:120%; font-weight:bold; margin-left: 35px"id="eb" type="text">EB MEMBERS LIST</label><br><br>
	<div id="contq"></div>
	<p></p>
	<input type="button" class="ex1" id="addRow1" value="Add New Members" style= "visibility: hidden"
		onclick="addrow12('table2')" /><br><br>
		<center><input type="submit" class="ex1" id="bt1" value="Submit Data" />
		<br><br>
			<input type="hidden" id="pmrc1"  name="pmrc1" value="" />
			<input type="hidden" id="eb1"  name="eb1" value="" />
			<input type="hidden" id="projectNo"  name="projectNo" value="${project.projectNo}" />
		</center>
		</form>
</body>
<script>
	var arrHead = new Array();
	arrHead = [ 'Designation', 'Name', 'Phone No.','Email ID(1)','Email ID(2)' ];
	var cost = ${project.totalCost};
	function checking(){
		if(cost>=5)
			{
			document.getElementById("pmrc").style.visibility = "visible";
			document.getElementById("eb").style.visibility = "visible";
			document.getElementById("addRow").style.visibility = "visible";
			document.getElementById("addRow1").style.visibility = "visible";
			createTable('table1'); 
			addrow12('table1'); 
			addrow12('table1'); 
			createTable('table2'); 
			addrow12('table2'); 
			addrow12('table2');
			}
		else
			{
			document.getElementById("pmrc").style.visibility = "visible";
			document.getElementById("addRow").style.visibility = "visible";
			createTable('table1'); 
			addRow('table1'); 
			addRow('table1');
			}
		
	}
	function createTable(id1) {
		var table1 = document.createElement('table');
		table1.setAttribute('id', id1);
		var tr = table1.insertRow();
		for (var h = 0; h < arrHead.length; h++) {
			var th = document.createElement('th');
			th.innerHTML = arrHead[h];
			tr.appendChild(th);
		}
		if (id1 == 'table1')
			var div = document.getElementById('cont');
		else
			var div = document.getElementById('contq');
		div.appendChild(table1);
	}
	function addrow12(id1) {
		var empTab = document.getElementById(id1);
		var rowCnt = empTab.rows.length;
		var tr = empTab.insertRow(rowCnt);
		tr = empTab.insertRow(rowCnt);
		for (var c = 0; c < arrHead.length; c++) {
			var td = document.createElement('td');
			td = tr.insertCell(c);
			var ele = document.createElement('input');
			ele.setAttribute('type', 'text');
			ele.setAttribute('value', '');
			if(c==arrHead.length-1);
			else
			ele.required='true';
			ele.style['width'] = '200px';
			ele.style['height'] = '25px';
			ele.style['textAlign'] = 'center';
			ele.style['fontSize'] = '16px';
			ele.style['backgroundColor'] = 'white';
			if(c==0&&rowCnt==1)
				ele.setAttribute("value","Chairman");
			else if(c==0&&rowCnt==3)
				ele.setAttribute("value","Member Secretary");
			else if(c==0&&rowCnt>3)
				ele.setAttribute("value","Member");
			td.appendChild(ele);
		}
		console.log(rowCnt);
	}
	function submittt() {
		var values1 = new Array();
		var values=new Array();
		var myTab = document.getElementById("table1");
		 for (row = 1; row < myTab.rows.length - 1; row++) {
		for (c = 0; c < myTab.rows[row].cells.length; c++) {
			var element = myTab.rows.item(row).cells[c];
				values.push(element.childNodes[0].value);//pmrc
		}
		 }
		 if(cost>=5){
		 var myTab1 = document.getElementById("table2");
			 for (row = 1; row < myTab1.rows.length - 1; row++) {
			for (c = 0; c < myTab1.rows[row].cells.length; c++) {
				var element = myTab1.rows.item(row).cells[c];
					values1.push(element.childNodes[0].value);//eb
			}
			 } }
			 document.getElementById('pmrc1').value=values;
 			document.getElementById('eb1').value=values1;
		console.log(values);
		console.log(values1);
	}
</script>


</html>
