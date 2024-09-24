<%@ page import="java.time.LocalDateTime" %>
<%@ page import="java.time.format.DateTimeFormatter" %><%--
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
<%
    HttpSession receivedSession=request.getSession();
    if(receivedSession.getAttribute("userId")==null)
    {
        response.setContentType("text/html;charset=UTF-8");
        response.getWriter().println("<script>alert('LoginOk 페이지로 바로 접속하지 마시오');");
        //response.sendRedirect("LoginForm.jsp");
        // 자바 코드에서 redirect 하면 alert 문구가 안 나옴
        response.getWriter().println("window.location.href = 'LoginForm.jsp';");
        response.getWriter().println("</script>");
        return;
    }

    LocalDateTime loginTime=(LocalDateTime)session.getAttribute("loginTime") ;
    DateTimeFormatter dateTimeFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
    String goodLoginTime=loginTime.format(dateTimeFormatter);
%>
<h1><%=session.getAttribute("userName")%>님 로그인 중</h1>
<div style="margin-bottom: 20px">접속시간 : <%= goodLoginTime%></div>

<img src="${pageContext.request.contextPath}/images/고양이.webp" alt="고양이" style="margin-bottom:20px"/>

<form action="${pageContext.request.contextPath}/logout" method="get">
    <input type="submit" value="로그아웃"/>
</form>

</body>
</html>
