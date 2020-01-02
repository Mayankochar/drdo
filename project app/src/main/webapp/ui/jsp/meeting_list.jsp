<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <script>
        function filename(value1)
        {
            console.log("INside filename functoin");
            var value=value1.substring(0,10);
            var name=document.getElementById('tempname').value;
            console.log(name);
            var filename=name+value;
            document.getElementById('name').value=filename;
            console.log(filename);

        }
    </script>
    <script>
        function dselect(projectno) {
            var selected=document.getElementById("dselect").value;
            //console.log(projectno);
            //console.log(selected);
            console.log("Length of pmrc is ",'${pmrc}'.length);
            console.log("Length of eb is ",'${eb}'.length);
            if(selected==='pmrc' && '${pmrc}'.length!=2)
            {
                document.getElementById("submit").disabled=false;
                var name="pm"+projectno;
                console.log("value of name is",name);
                document.getElementById('type').value='pmrc';
                document.getElementById('tempname').value=name;

                document.getElementById('pmr').innerHTML="<br><select onChange='filename(this.value)'><option>Select Date</option><c:forEach var='item' items='${pmrc}'><option><c:out value='${item}'/></option></c:forEach></select>";

            }
            if(selected==='pmrc' && '${pmrc}'.length==2)
            {
                document.getElementById("submit").disabled=true;
                document.getElementById('pmr').innerHTML="No Meetings For PMRC currently Requested";
            }
            if(selected==='eb' && '${eb}'.length==2)
            {
                document.getElementById("submit").disabled=true;
                document.getElementById('pmr').innerHTML="No Meetings For EB currently Requested";
            }
            if(selected==='eb' && '${eb}'.length!==2)
            {
                document.getElementById("submit").disabled=false;
                var name="eb"+projectno;
                document.getElementById('tempname').value=name;
                document.getElementById('type').value='eb';
                document.getElementById('pmr').innerHTML="<br><select onChange='filename(this.value)'><option>Select Date</option><c:forEach var='item1' items='${eb}'><option><c:out value='${item1}'/></option></c:forEach></select>";
            }

            if(selected==='select')
            {
                document.getElementById("submit").disabled=true;
                document.getElementById('pmr').innerHTML="<br>Please Select Proper Input";
            }

        }
    </script>
    <jsp:include page="header.jsp" />
</head>
<body>
<center>
    <b>Please Select Your Input</b>
    <br>

    <%

        String projectno=request.getParameter("projectNo");
    %>

    <select onchange="dselect(<%=projectno%>)" id="dselect">
        <option value="select">Select Your Option</option>
        <option value="pmrc">PMRC</option>
        <option value="eb">EB</option>
    </select>

    <div id="pmr" >

    </div>
    <form action="/project/getMinutes" method="post" >
        <input type="hidden" name="type" value="" id="type" />
        <input type="hidden" name="name" value="" id="name" />
        <input type="hidden" id="tempname" value="" />
        <input type="hidden" name="projectNo" value=<%=projectno%> />
                <input type="submit" value="submit" id="submit" disabled="true"/>
    </form>
</center>

</body>
</html>