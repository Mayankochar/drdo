<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%--     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> --%>
<!DOCTYPE html>
<html>
<head>
    <style>
        table {
            border: 1px solid;
            width: 50%;
            font: 18px Times New Roman;
            margin-left: 300px;
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
        .border {
            position: fixed;
            top: 0;
            left: 0;
            border: 1px solid #000;
            width: 98%;
            height: 98%;
            margin-left: 12px;
            margin-right: 10px;
            margin-top: 10px;
            margin-bottom: 30px;
        }
    </style>
    <jsp:include page="header.jsp" />
</head>
<h2>ADD MEETING</h2>
<!-- <div class="border"></div> -->
<body class="border">
<br>
<form method="post" action="/project/upload" enctype="multipart/form-data">
    <select style="font-size:80%; margin-left: 595px"id = "selmemberlist" onchange="changedisplay()">
        <option>Select Members List</option>
        <option value="pmrc" id="pmrc">PMRC</option>
        <option value="eb" id="eb">EB</option>
    </select><br><br><br><br>
    <div id="cont"></div>
    <br><br><br><br><br><br><br><br><br><br><br><br>
    <center><input type="submit" style="visibility: hidden"onclick="buttonpressed()"value="submit" id="sub"></center>

    <input type="hidden" id="pmrc1"  name="pmrc" value="" />
    <input type="hidden" id="eb1"  name="eb" value="" />
    <input type="hidden" id="pdf"  name="pdf" value="" />
    <input type="hidden" id="url"  name="url" value="" />
    <input type="hidden" id="type"  name="type" value="" />
    <input type="hidden" id="name"  name="name" value="" />
    <input type="hidden" name="projectNo" value=<%=request.getParameter("projectNo")%> />

</form>
</body>
<script>
    var arrHead = new Array();
    arrHead = [ 'DATE', 'PDF' ];
    var value1;
    var count=0;
    var  _OBJECT_URL;
    function changedisplay(){
             document.getElementById("sub").style.visibility = "visible";
        var value2=document.getElementById("selmemberlist");
        var value1=value2.value;
        console.log(value1);
        count++;
        if(count==1)
            createTable();
    }
    function createTable() {
        var table1 = document.createElement('table');
        table1.setAttribute('id', 'table1');
        var tr = table1.insertRow(0);
        for (var h = 0; h < arrHead.length; h++) {
            var th = document.createElement('th');
            th.innerHTML = arrHead[h];
            tr.appendChild(th);
        }
        var div = document.getElementById('cont');
        div.appendChild(table1);
        var tr=table1.insertRow(1);
        for (var c = 0; c < 2; c++) {
            var td = document.createElement('td');
            td = tr.insertCell(c);
            if(c==0){
                var ele = document.createElement('input');
                ele.setAttribute('id', 'date');
                ele.setAttribute('type', 'date');
                ele.setAttribute('name', 'date');

                ele.setAttribute('value', '');
                ele.required='true';
                ele.style['width'] = '400px';
                ele.style['height'] = '25px';
                ele.style['textAlign'] = 'center';
                ele.style['fontSize'] = '20px';
                ele.style['backgroundColor'] = 'white';}
            else{
                var ele = document.createElement('input');
                ele.setAttribute('name','file')
                ele.setAttribute('type', 'file');
                ele.setAttribute('value', 'Upload PDF');
                ele.setAttribute('id', 'pdf-file');
                ele.required='true';
                ele.style['width'] = '300px';
                ele.style['height'] = '25px';
                ele.style['textAlign'] = 'center';
                ele.style['fontSize'] = '16px';
            }
            td.appendChild(ele);
        }
        document.getElementById("pdf-file").addEventListener('change', function() {
            var file=document.createElement('file');
            file = this.files[0];
            var mime_types = [ 'application/pdf' ];
            if(mime_types.indexOf(file.type) == -1) {
                alert('Error : Incorrect file type');
                return;
            }
            if(file.size > 10*1024*1024) {
                alert('Error : Exceeded size 10MB');
                return;
            }
            _OBJECT_URL = URL.createObjectURL(file);
            console.log(_OBJECT_URL);
            var myNewFile = new File([this.files[0]], 'abc.pdf', {type: file.type});
            this.files[0].name="edef.pdf";
            console.log(file.value);
        });
    }
    function buttonpressed(){
        if(document.getElementById("selmemberlist").value=='pmrc')
        {
            console.log("inside if");
            var name="pm"+'<%=request.getParameter("projectNo")%>'+document.getElementById('date').value;
            console.log("Name is ",name);
            document.getElementById("name").value=name;
        }
        if(document.getElementById("selmemberlist").value=='eb')
        {
            console.log("inside if");
            var name="eb"+'<%=request.getParameter("projectNo")%>'+document.getElementById('date').value;
            console.log("Name is ",name);
            document.getElementById("name").value=name;
        }
        var mytab=document.getElementById('table1');
        var value11= document.getElementById('selmemberlist').value;
        console.log(value11);
        var element = mytab.rows.item(1).cells[0];
        if(value11=='pmrc'){
            document.getElementById('type').value=value11;
            document.getElementById('pmrc1').value=element.childNodes[0].value;
            console.log(document.getElementById('pmrc1').value);}
        else if(value11=='eb'){
            document.getElementById('type').value=value11;
            document.getElementById('eb1').value=element.childNodes[0].value;
            console.log(document.getElementById('eb1').value);}
        document.getElementById('pdf').value=document.getElementById('pdf-file').value;
        document.getElementById('url').value=_OBJECT_URL;
        console.log(document.getElementById('url').value);
        console.log(document.getElementById('pdf').value);
    }
</script>


</html>

