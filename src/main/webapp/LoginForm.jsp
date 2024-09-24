<%--
  Created by IntelliJ IDEA.
  User: swift
  Date: 2024-09-24
  Time: 오후 5:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <form method="post" action="${pageContext.request.contextPath}/login">
    ID : <input type="text" name="userId" /><br/>
    PWD : <input type="password" name="userPwd" /><br/>
    NAME : <input type="text" name="userName" /><br/>

    <input type="submit" value="로그인" />
    </form>
</body>
</html>
