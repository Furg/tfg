<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<h2>Users List</h2>
    <ul>
    <c:if test="${not empty users}">
        <c:forEach var="user" items="${users}">
        <li><a href="/users/${user.getUsername()}">${user.getUsername()}</a></li>
        </c:forEach>
    </c:if>
    </ul>

    <sec:authorize access="hasRole('USER')">
        You have USER role.<br/>
    </sec:authorize>

    <sec:authorize access="hasRole('ADMIN')">
        You have ADMIN role.<br/>
    </sec:authorize>
