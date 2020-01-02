<%@ page contentType="text/html;charset=UTF-8"%>
<html>
<head>
    <!link rel="stylesheet" href="design_welcome_form.css">
    <title>Welcome</title>
</head>
<body>
<fieldset>
    <br>
    <center style="font-size:50"><b>Welcome to Project Automation</b>
    </center>
    <br>
    <br>
    <form action="/project/form1" method="get">
        <center><button class="button" style="text-align:center;width:150;height:75;font-size:25" type="submit"> Form1</button></center>
        <br>
        <br>
        <br>
        <br>
    </form>
    <form action="/project/getList" method="get">
        <center><button class="button" style="text-align:center;width:150;height:75;font-size:25" > List</button></center>
        <br>
        <br>
        <br>
        <br>
    </form>
    <form action="/logout">
        <center><button class="button" style="text-align:center;width:150;height:75;font-size:25" > Log Out</button></center>
        <br>
        <br>
        <br>
        <br>
    </form>
</fieldset>
</body>
</html>