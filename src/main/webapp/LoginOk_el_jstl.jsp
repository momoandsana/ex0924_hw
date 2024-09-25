<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@ page import="java.time.LocalDateTime" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    HttpSession receivedSession = request.getSession();
    if (receivedSession.getAttribute("userId") == null) {
        response.setContentType("text/html;charset=UTF-8");
        response.getWriter().println("<script>alert('LoginOk 페이지로 바로 접속하지 마시오');");
        response.getWriter().println("window.location.href = 'LoginForm.jsp';");
        response.getWriter().println("</script>");
        return;
    }

    // LocalDateTime을 세션에서 가져옴
    LocalDateTime loginTime = (LocalDateTime) receivedSession.getAttribute("loginTime");
    DateTimeFormatter dateTimeFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
    String goodLoginTime = loginTime.format(dateTimeFormatter);
%>


<h1>${sessionScope.userName}님 로그인 중</h1>


<div style="margin-bottom: 20px">
    접속시간 : <%= goodLoginTime %>
</div>


<img src="${pageContext.request.contextPath}/images/고양이.webp" alt="고양이" style="margin-bottom:20px"/>

<form action="${pageContext.request.contextPath}/logout" method="get">
    <input type="submit" value="로그아웃"/>
</form>

</body>
</html>
