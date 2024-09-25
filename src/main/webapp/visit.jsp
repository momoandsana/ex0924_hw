<%--&lt;%&ndash;--%>
<%--  Created by IntelliJ IDEA.--%>
<%--  User: swift--%>
<%--  Date: 2024-09-24--%>
<%--  Time: 오후 5:33--%>
<%--  To change this template use File | Settings | File Templates.--%>
<%--&ndash;%&gt;--%>
<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%--<%@ page isELIgnored="false" %>--%>
<%--<html>--%>
<%--<head>--%>
<%--    <title>Title</title>--%>
<%--</head>--%>
<%--<%--%>
<%--    Integer count=(Integer)application.getAttribute("visitCount");// object 형식으로 반환하기 때문에 Integer 로 다운캐스팅--%>
<%--    if(count==null)--%>
<%--    {--%>
<%--        count=0;--%>
<%--    }--%>
<%--    else--%>
<%--  {--%>
<%--    if(session.isNew()) count++;--%>
<%--//        count++; 그냥 count++ 하면 새로고침해도 방문자수가 올라감--%>
<%--      //여러 명이 접근하면 동시성 이슈가 생길 수도. 동기화 기능이 필요함--%>
<%--      // atomic integer 사용하기--%>
<%--    }--%>
<%--    application.setAttribute("visitCount",count);--%>

<%--%>--%>
<%--<h2> 방문자수 : <%=count%></h2>--%>

<%--</body>--%>
<%--</html>--%>


<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@ page import="java.util.concurrent.atomic.AtomicInteger" %>
<html>
<head>
    <title>Title</title>
</head>
<%
    // AtomicInteger를 사용하여 방문자 수를 처리
    AtomicInteger visitCount = (AtomicInteger)application.getAttribute("visitCount");

    if (visitCount == null) {
        visitCount = new AtomicInteger(0);
        application.setAttribute("visitCount", visitCount);
    }

    if (session.isNew()) {
        visitCount.incrementAndGet(); // 새 세션일 경우 방문자 수 증가
        /*
       스레드들이 한 번에 값을 읽는 것은 가능하지만
       값을 쓰는 것은 하나만 독점적으로 진행
       단순히 증가/감소가 아니라 복잡한 식을 사용하고 싶다면
        visitCount.updateAndGet(value -> value * 2);
         */
    }
%>
<h2> 방문자수 : <%= visitCount.get() %></h2>

</body>
</html>
