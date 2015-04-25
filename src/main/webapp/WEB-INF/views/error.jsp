<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<h1>Error</h1>
<c:if test="${not empty error}">
    <p>
        <b>Página de Error:</b> ${error.getUrl()}
    </p>
    <p>
        <b>Mensaje de Error:</b> ${error.getMessage()}
    </p>
</c:if>
