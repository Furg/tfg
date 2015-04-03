<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<html>
<head>
    <title>Measure Form</title>
</head>
<body>

    <h3>Create Measure</h3>
    <c:set var="method" value="POST"/>
    <c:set var="action" value="/measures"/>

<form:form method="${method}" action="${action}" modelAttribute="measure">
    <table>
        <tr>
            <td><form:label path="weight">Weight</form:label></td>
            <td><form:input path="weight"/> <i><form:errors path="weight"></form:errors></i></td>
        </tr>
        <tr>
            <td><form:hidden path="username"/><i><form:errors path="username"></form:errors></i></td>
        </tr>
        <tr>
            <td><form:hidden path="date"/> <i><form:errors path="date"></form:errors></i></td>
        </tr>
        <tr>
            <td><input type="submit" value="Submit" /></td>
        </tr>
    </table>
</form:form>

</body>
</html>
