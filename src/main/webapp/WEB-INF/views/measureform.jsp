<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<html>
<head>
    <title>Nuevo Control</title>
</head>
<body>

    <h3>Nuevo Control</h3>
    <c:set var="method" value="POST"/>
    <c:set var="action" value="/measures"/>

<form:form method="${method}" action="${action}" modelAttribute="measure">
    <table>
        <tr>
            <td><form:label path="weight">Peso:</form:label></td>
            <td><form:input path="weight"/> <i><form:errors path="weight"></form:errors></i></td>
        </tr>
        <tr>
            <td><form:hidden path="username"/><i><form:errors path="username"></form:errors></i></td>
        </tr>
        <tr>
            <td><form:hidden path="date"/> <i><form:errors path="date"></form:errors></i></td>
        </tr>

        <tr>
            <td><form:label path="date">Fecha y Hora:</form:label></td>
            <td><form:input path="date"/> <i><form:errors path="date"></form:errors></i></td>
        </tr>

        <div class="input-append date form_datetime">
            <input size="16" type="text" name="date" value="" readonly>
            <span class="add-on"><i class="icon-th"></i></span>
        </div>

        <tr>
            <td><input type="submit" value="Guardar" /></td>
        </tr>
    </table>
</form:form>

    <script type="text/javascript">
        $(".form_datetime").datetimepicker({
            format: "dd MM yyyy - hh:ii",
            autoclose: true,
            todayBtn: true,
            pickerPosition: "bottom-left",
            language: "es"
        });
    </script>

</body>
</html>
