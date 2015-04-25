<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<h2>Tests List</h2>
<ul>
    <c:if test="${not empty tests}">
        <c:forEach var="test" items="${tests}">
            <li>${test.getId()}: ${test.getName()} ${test.getType()} ${test.getDescription()} </li>
        </c:forEach>
    </c:if>
</ul>
<p><a href="tests/form">Add</a></p>

