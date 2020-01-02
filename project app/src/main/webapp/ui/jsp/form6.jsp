<html>
<head>
    <title>Form 6</title>
    <jsp:include page="header.jsp" />
</head>
<body>
    <br>
    <center><b>STATEMENT OF CASE FOR PDC EXTENSION</b></center><br><center>Part-I</center>
    <br>

    <form method="post" action="getForm6PDF">
        <fieldset>
    <label class="labeldesign">1. Name of Lab</label>
    <input class="inputdesign" type="text" name="Name_of_lab" contenteditable="false" value="${project.nodalLabName}"/>
    <br>
    <br>
    <label class="labeldesign">2. Project/Programme No</label>
    <input class="inputdesign" type="text" name="projectNo" contenteditable="false" value="${project.projectNo}"/>
    <br>
    <br>
    <label class="labeldesign">3. Title of the Project</label>
    <input class="inputdesign" type="text" name="Title_Of_Project" contenteditable="false" value="${project.titleOfProject}"/>
    <br>
    <br>
    <label class="labeldesign">4. Sponsoring Agency</label>
    <input class="inputdesign" type="text" name="Sponsoring_Agency"  />
    <br>
    <br>
    <label class="labeldesign">5. Sanction Cost (in Cr)</label>

    <label style="position:absolute;left:480px">IC</label>
    <input type="text" name="Sanction_Cost_IC" style="position:absolute;left:510px;width:50px" contenteditable="false" value="${project.totalCost}"/>
    <label style="position:absolute;left:570px">FE</label>
    <input type="text" name="Sanction_Cost_FE" style="position:absolute;left:600px;width:48px" contenteditable="false" value="${project.foreignExchange}"/>
    <br>
    <br>

    <label class="labeldesign" >6. Date of Sanction</label>
    <input class="inputdesign" type="text" name="Date_Of_Sanction" contenteditable="false" value="${project.sanctionDate}"/>
    <br>
    <br>

    <label class="labeldesign">7. Amount spent so far (in Cr)</label>
    <label style="position:absolute;left:480px">Spent</label>
    <label style="position:absolute;left:570px">-IC</label>
    <input type="text" name="Amount_Spent_So_Far_Spent_IC" style="position:absolute;left:600px;width:50px"  />
    <label style="position:absolute;left:660px">FE</label>
    <input type="text" name="Amount_Spent_So_Far_Spent_FE" style="position:absolute;left:690px;width:50px"  />
    <br>
    <br>
    <label style="position:absolute;left:480px">Commited</label>
    <label style="position:absolute;left:570px">-IC</label>
    <input type="text" name="Amount_Spent_So_Far_Commited_IC" style="position:absolute;left:600px;width:50px"  />
    <label style="position:absolute;left:660px">FE</label>
    <input type="text" name="Amount_Spent_So_Far_Commited_FE" style="position:absolute;left:690px;width:50px"  />
    <br>
    <br>
    <label style="position:absolute;left:480px">In Pipeline</label>
    <label style="position:absolute;left:570px">-IC</label>
    <input type="text" name="Amount_Spent_So_Far_Pipeline_IC" style="position:absolute;left:600px;width:50px"  />
    <label style="position:absolute;left:660px">FE</label>
    <input type="text" name="Amount_Spent_So_Far_Pipeline_FE" style="position:absolute;left:690px;width:50px"  />
    <br>
    <br>

    <label class="labeldesign">8. PDC original</label>
    <input type="text" name="PDC_Date" style="position:absolute;left:480px;width:130px" contenteditable="false" value="${project.pdcList[0]}"/>
    <label style="position:absolute;left:620px">& Months </label>
    <input type="text" name="PDC_Months" style="position:absolute;left:700px;width:50px"  contenteditable="false" value="${project.duration}" />
    <br>
    <label class="labeldesign">&nbsp;&nbsp;&nbsp Subsequent, if any</label>
    <input type="text" name="Subsequent_Date" style="position:absolute;left:480px;width:130px" value="${project.pdc}"/>
    <label style="position:absolute;left:620px">& Months </label>
    <input type="text" name="Subsequent_Months" style="position:absolute;left:700px;width:50px"  />
    <br>
    <br>

    <label class="labeldesign">9. Revised PDC proposed with</label>
    <input type="Date" name="PDC_revised_Date_1" style="position:absolute;left:480px;width:130px"/>
    <label style="position:absolute;left:620px">& Months </label>
    <input type="text" name="PDC_revised_Months_1" style="position:absolute;left:700px;width:50px"  />
    <br>
    <label class="labeldesign">&nbsp;&nbsp;&nbsp Subsequent, if any</label>
    <input type="Date" name="PDC_revised_Date_2" style="position:absolute;left:480px;width:130px"/>
    <label style="position:absolute;left:620px">& Months </label>
    <input type="text" name="PDC_revised_Months_2" style="position:absolute;left:700px;width:50px"  />
    <br>
    <br>

        <input type="submit" class="inputdesign" value="Generate PDF" />
        </fieldset>
    </form>
</body>
</html>