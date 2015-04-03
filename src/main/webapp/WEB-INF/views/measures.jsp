<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="s" uri="http://www.springframework.org/tags"%>
<html>
<body>
<h2>Measure List</h2>
<ul>
    <c:if test="${not empty measures}">
        <c:forEach var="measure" items="${measures}">
            <li><a href="/measures/${measure.getId()}">${measure.getId()}</a>: ${fn:escapeXml(measure.getWeight())}</li>
        </c:forEach>
    </c:if>
</ul>
<p><a href="measures/form">Add</a></p>
</body>
</html>
