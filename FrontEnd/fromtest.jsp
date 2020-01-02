 <html>
 <body>
 <%@ page import="java.io.*"%>
 <%@ page import="java.sql.*"%>
 <%@ page import="com.mysql.jdbc.Driver"%>
 <%@ page import="java.util.*"%>
  <%@ page import="java.text.*"%>
 <%@ page import="javax.servlet.*"%>
 <%@ page import="javax.servlet.http.*"%>
 <%@ page import="javax.servlet.http.HttpSession"%>
 <%@ page language="java"%>
 <%@ page session="false"%>
 <%
 String[] fundType=new fundType()
 fundType=request.getParameter("fundType")
 out.println("Values Of Fund Type are ")
 for(int i=0;i<fundType.length();i++)
 {
 out.print(fundType[i]);
}
%>
</body>
</html>