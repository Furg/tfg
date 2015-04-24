<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%--
  Created by IntelliJ IDEA.
  User: Angel
  Date: 24/04/2015
  Time: 17:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
</head>
<body>

    <sec:authorize access="hasRole('USER')">
        <a href="/measures/form">Nuevo Control</a>
        <a href="#"></a>
        <a href="#">menu Item 1</a>
    </sec:authorize>

    <sec:authorize access="hasRole('ADMIN')">
        <a href="/tests/form">Nuevo Test</a>
        <a href="/tests">Tests</a>
    </sec:authorize>

</body>
</html>
