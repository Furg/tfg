<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<p><a href="/users">Users</a></p>

<c:if test="${not empty user}">
    <h2>User ${user.getUsername()}</h2>
    <c:if test="${not empty user.getEmail()}">
        <p>E-mail: ${user.getEmail()}</p>
    </c:if>
    <c:if test="${not empty user.getImageUrl()}">
        <img src="${user.getImageUrl()}"/>
    </c:if>

    <c:if test="${user.getUsername() eq username}">
        <h3>User Measures</h3>
        <c:forEach var="measure" items="${usermeasures.getMeasures()}">
            <li>${measure.getId()}: ${measure.getDate()} ${measure.getWeight()}</li>
        </c:forEach>
    </c:if>

    <c:if test="${not empty user.getGreetings()}">
        <h3>User Greetings</h3>
        <c:forEach var="greeting" items="${user.getGreetings()}">
            <li><a href="/greetings/${greeting.getId()}">${greeting.getId()}</a>: ${fn:escapeXml(greeting.getContent())}</li>
        </c:forEach>
    </c:if>
</c:if>
