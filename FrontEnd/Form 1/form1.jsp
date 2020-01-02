<html>
<body>
<link rel="stylesheet" href="design.css">
<h1 class="center1">STATEMENT OF CASE FOR SANCTION OF PROJECT</h1>
<br>
<br>
<form:form class="center2" id="form1" name="form1" method="post" action="" modelAttribute="project">
<form:label><b>Name of laboratory/establishment:</b>
<form:label class="form:labeldesign"></form:label>
<form:input path="Name_Of_Lab" class="form:inputdesign" name="" type="text" size="25" />
</form:label> 
<br>
<br>
<form:label><b>Title of the Project:</b>
<form:label class="labeldesign"></form:label>
<form:input class="inputdesign" path="Title_Of_Project" type="text" size="25" />
</form:label>
<br>
<br>
<form:label><b>Category:</b>
<form:label class="form:labeldesign"></form:label>
<br>
<br>

<b>Please tick in appropriate box:</b> 
<div class="checkboxdesign">
<br><form:input type="checkbox" path="MM" value="Mission Mode (MM)"/>Mission Mode (MM)
<br><form:input type="checkbox" path="TD" value="Technology Demonstration (TD)"/>Technology Demonstration (TD) 
<br><form:input type="checkbox" path="ST" value="Science & Technology (S & T)"/>Science & Technology (S & T) 
<br><form:input type="checkbox" path="IF" value="Infrastructure & Facilities (IF)"/>Infrastructure & Facilities (IF)
<br><form:input type="checkbox" path="PS" value="Product Support (PS)"/>Product Support (PS)
<br><form:input type="checkbox" path="MMUT" value="Mission Mode (User Trials) (MM - UT)"/>Mission Mode (User Trials) (MM - UT) 
</div>
</form:label>
<form:label>
<br>
<br>
<b>Security classification of project:</b>
<div class="checkboxdesign">
<br><form:input type="checkbox" path="TopSecret" value="Top Secret"/>Top Secret
<br><form:input type="checkbox" path="Secret" value="Secret"/>Secret 
<br><form:input type="checkbox" path="Confidential" value="Confidential"/>Confidential 
<br><form:input type="checkbox" path="Restricted" value="Restricted"/>Restricted
<br><form:input type="checkbox" path="NIL" value="NIL"/>NIL
</div>
</form:label>
<br>
<br>
<form:label><b>GSQR / NSR / ASR No:</b>
<form:label class="form:labeldesign"></form:label>
<form:input class="inputdesign" path="GSQR" type="text" size="25" />
</form:label>
<br>
<br>
<form:label><b>Cost (Rs in Cr):</b>
<form:label class="form:labeldesign"></form:label>
<form:input class="inputdesign" path="Cost" type="text" size="25" value=""/> Total(FE)
</form:label> 
<br>
<br>
<form:label><b>Duration (in months):</b>
<form:label class="form:labeldesign"></form:label>
<form:input class="inputdesign" path="Duration" type="text" size="25" value=""/>
</form:label>
<br>
<br>
<form:label><b>Is it a FYP Plan / LTTPP Project ?</b>
<div class="checkboxdesign">
<form:input  type="radio" path="radio" value="Yes" />Yes
<form:input 
 type="radio" path="radio" value="No" />No
</div>
</form:label>
<br>
<br>
<form:label><b>If yes, please give Reference:</b>
<form:label class="form:labeldesign"></form:label>
<form:input  class="inputdesign" path="Reference" type="text" size="25" value=""/>
<br>(please quote Page No Table S No of FYP Document)
</form:label>
<br>
<br>
<form:label><b>If No, please give Justification for undertaking the project:</b>
<form:label class="form:labeldesign"></form:label>
<form:input  class="inputdesign" path="Justification" type="text" size="25" value=""/>
</form:label>
<br>
<br>
<form:label><b>Is Detailed Feasibility Study Report enclosed ?</b>
<div class="checkboxdesign">
<form:input  type="radio" path="Report" value="Yes" />Yes
<form:input  type="radio" path="Report" value="No" />No
</div>
</form:label>
<br>
<br>
<form:label><b>Recommendation of Cluster Council / DMC ?</b>
<div class="checkboxdesign">
<form:input  type="radio" path="Council" value="Yes" />Yes
<form:input  type="radio" path="Council" value="No" />No
</div>
<br>(please attach the minutes)
</form:label>
<br>
<br>
<form:label><b>Is PEARL Analysis Report enclosed ?</b>
<div class="checkboxdesign">
<form:input  type="radio" path="Analysis" value="Yes" />Yes
<form:input  type="radio" path="Analysis" value="No" />No
</div>
<br>(In case of IF, PS and MM - UT category, if waiver is ! soughr, approval from CA is required)
</form:label>
<br>
<br>
<form:label><b>Is Project Execution Plan attached ?</b>
<div class="checkboxdesign">	
<form:input  type="radio" path="PlanAttached" value="Yes" />Yes
<form:input  type="radio" path="PlanAttached" value="No" />No
</div>
</form:label>

<form:label>
<br>
<br>
<b>Project Deliverables / Output:</b>(Please tick in appropriate box)
<div class="checkboxdesign">
<br><form:input  type="checkbox" path="Prototype" value=" Prototype"/>Prototype
<br><form:input  type="checkbox" path="Limited" value=" Limited Series Production"/>Limited Series Production
<br><form:input  type="checkbox" path="Technology" value="Technology"/>Technology
<br><form:input  type="checkbox" path="Assembly" value="Assembly or sub - assembly"/>Assembly or sub - assembly
<br><form:input  type="checkbox" path="Process" value="Process"/>Process
<br><form:input  type="checkbox" path="Others" value="Others"/>Others
</div>
</form:label>
<br>
<br>
<form:label><b>Name of the Project Director / Programme Director:</b>
<form:label class="labeldesign"></form:label>
<form:input class="inputdesign" path="Name_Of_Director" type="text" size="25" value=""/>
</form:label>
<br>
<br>
<br>
<h2 class="center3">Contents</h2>
<br>
<h3 class="center3">Part-I (Macro Details)</h3>
<br>
<div class="center">
<table border="1">
  <tr>
    <th> Para/Item Number</th>
    <th>Description</th> 
    <th>Page Nos.</th>
  </tr>
  <tr>
    <td><form:input  path="Item_Row1" type="text" size="25" value=""/></td>
    <td><form:input  path="Description_Row1" type="text"  size="25" value=""/></td> 
    <td><form:input  path="Page_Nos_Row1" type="text"  size="25" value=""/></td>
  </tr>
  <tr>
    <td><form:input  path="Item_Row2" type="text" size="25" value=""/></td>
    <td><form:input  path="Description_Row2" type="text" size="25" value=""/></td> 
    <td><form:input  path="Page_Nos_Row2" type="text" size="25" value=""/></td>
  </tr>
 <tr>
    <td><form:input  path="Item_Row3" type="text" size="25" value=""/></td>
    <td><form:input  path="Description_Row3" type="text" size="25" value=""/></td> 
    <td><form:input  path="Page_Nos_Row3" type="text" size="25" value=""/></td>
  </tr>
</table>
</div>


<br>
<br>
<br>
<h3 class="center3">Part-II (Micro Details)</h3>
<br>
<div class="center">
<table border="1">
  <tr>
    <th> Para/Item Number</th>
    <th>Description</th> 
    <th>Page Nos.</th>
  </tr>
  <tr>
    <td><form:input  path="Micro_ItemNo_Row1" type="text" size="25" value=""/></td>
    <td><form:input  path="Micro_Description_Row1" type="text"  size="25" value=""/></td> 
    <td><form:input  path="Micro_Page_Nos_Row1" type="text"  size="25" value=""/></td>
  </tr>
  <tr>
    <td><form:input  path="Micro_ItemNo_Row2" type="text" size="25" value=""/></td>
    <td><form:input  path="Micro_Description_Row2" type="text" size="25" value=""/></td> 
    <td><form:input  path="Micro_Page_Nos_Row2" type="text" size="25" value=""/></td>
  </tr>
 <tr>
    <td><form:input  path="Micro_ItemNo_Row3" type="text" size="25" value=""/></td>
    <td><form:input  path="Micro_Description_Row3" type="text" size="25" value=""/></td> 
    <td><form:input  path="Micro_Page_Nos_Row3" type="text" size="25" value=""/></td>
  </tr>
</table>
</div>

<form:button type="submit" form="form1" value="Submit">Submit</button>
</form>

</body>
</html>