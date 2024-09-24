<%--
  Created by IntelliJ IDEA.
  User: swift
  Date: 2024-09-24
  Time: 오후 5:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<html>
<head>
    <title>Title</title>
</head>
<%
    Integer count=(Integer)application.getAttribute("visitCount");// object 형식으로 반환하기 때문에 Integer 로 다운캐스팅
    if(count==null)
    {
        count=0;
    }
    else
    {
        count++;
    }
    application.setAttribute("visitCount",count);

%>
<h2> 방문자수 : <%=count%></h2>

</body>
</html>
