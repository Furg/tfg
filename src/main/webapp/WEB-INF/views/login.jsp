<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<div class="page-header">
    <h1>Login</h1>
</div>

<sec:authorize access="isAnonymous()">
    <!-- Social Sign In Buttons -->
    <a class="btn btn-social btn-twitter" href="${pageContext.request.contextPath}/auth/twitter">
        <i class="fa fa-twitter"></i> Entrar con Twitter
    </a>
</sec:authorize>

<sec:authorize access="isAuthenticated()">
    <p>Usuario conectado:</p>

    <h2>
        ${pageContext.request.userPrincipal.name}
    </h2>

</sec:authorize>

