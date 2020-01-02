<hmtl>
    <head>
        <link rel="stylesheet" href="design.css">
        <title>Form 7</title>
        <jsp:include page="header.jsp" />
    </head>
    <body>
    <form method="post" action="getForm7PDF">
    <fieldset>
        <center><b>STATEMENT OF CASE FOR RE-ALLOCATION OF FUNDS AND</center><br><center>PROJECT COST ENHANCEMENT</center><br><br><center>Part-I</center>
        <br>

        <label class="labeldesign">1. Name of Lab</label>
        <input class="inputdesign" type="text" name="Name_of_lab" contenteditable="false" value="${project.nodalLabName}" />
        <br>
        <br>
        <label class="labeldesign">2. Project/Programme No</label>
        <input class="inputdesign" type="text" name="projectNo" contenteditable="false" value="${project.projectNo}" />
        <br>
        <br>
        <label class="labeldesign">3. Title of the Project</label>
        <input class="inputdesign" type="text" name="Title_Of_Project"contenteditable="false" value="${project.titleOfProject}" />
        <br>
        <br>
        <label class="labeldesign">4. Sponsoring Agency</label>
        <input class="inputdesign" type="text" name="Sponsoring_Agency" />
        <br>
        <br>
        <label class="labeldesign">5. Sanction Cost (in Cr)</label>

        <label style="position:absolute;left:380px">IC</label>
        <input type="text" name="Sanction_Cost_IC" style="position:absolute;left:410px;width:50px" value="${project.totalCost}"/>
        <label style="position:absolute;left:466px">FE</label>
        <input type="text" name="Sanction_Cost_FE" style="position:absolute;left:494px;width:48px" value="${project.foreignExchange}"/>
        <br>
        <br>

        <label class="labeldesign">6. Date of Initiation</label>
        <input class="inputdesign" type="text" name="Date_Of_Initiation" contenteditable="false" value="${project.sanctionDate}"/>
        <br>
        <br>

        <label class="labeldesign">7. Amount spent so far (in Cr)</label>
        <label style="position:absolute;left:380px">Spent</label>
        <label style="position:absolute;left:470px">-IC</label>
        <input type="text" name="Amount_Spent_So_Far_Spent_IC" style="position:absolute;left:500px;width:50px"  />
        <label style="position:absolute;left:560px">FE</label>
        <input type="text" name="Amount_Spent_So_Far_Spent_FE" style="position:absolute;left:585px;width:50px"  />
        <br>
        <br>
        <label style="position:absolute;left:380px">Commited</label>
        <label style="position:absolute;left:470px">-IC</label>
        <input type="text" name="Amount_Spent_So_Far_Commited_IC" style="position:absolute;left:500px;width:50px" />
        <label style="position:absolute;left:560px">FE</label>
        <input type="text" name="Amount_Spent_So_Far_Commited_FE" style="position:absolute;left:585px;width:50px"  />
        <br>
        <br>
        <label style="position:absolute;left:380px">In Pipeline</label>
        <label style="position:absolute;left:470px">-IC</label>
        <input type="text" name="Amount_Spent_So_Far_Pipeline_IC" style="position:absolute;left:500px;width:50px"  />
        <label style="position:absolute;left:560px">FE</label>
        <input type="text" name="Amount_Spent_So_Far_Pipeline_FE" style="position:absolute;left:585px;width:50px"  />
        <br>
        <br>
        <label class="labeldesign">8. PDC original given and </label>
        <input type="text" name="PDC_Date" style="position:absolute;left:380px;width:130px" contenteditable="false" value="${project.pdc}"/>
        <label style="position:absolute;left:520px">& Months </label>
        <input type="text" name="PDC_Months" style="position:absolute;left:600px;width:50px"  contenteditable="false" value="${project.duration}"/>
        <br>
        <label class="labeldesign">&nbsp;&nbsp;&nbsp Subsequent, if any</label>
        <input type="text" name="Subsequent_Date" style="position:absolute;left:380px;width:130px" />
        <label style="position:absolute;left:520px">& Months </label>
        <input type="text" name="Subsequent_Months" style="position:absolute;left:600px;width:50px"  />
        <br>
        <br>
        <input type="submit" class="inputdesign" value="Generate PDF" />
    </fieldset>
        </form>
    </body>
    </html>