<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<h3>Nuevo Control</h3>
<c:set var="method" value="POST"/>
<c:set var="action" value="/measures"/>

<form:form method="${method}" action="${action}" modelAttribute="measure">
    <p>Fecha y Hora:</p>
    <div class="input-append date form_datetime">
        <input size="16" type="text" name="date" value="${currentDateTime}"  readonly>
        <span class="add-on"><i class="icon-th"></i></span>
    </div>
    <table>
        <tr>
            <td><form:label path="category">Categoria:</form:label></td>
            <td><select name="category">
                <option value="Antes de">Antes de</option>
                <option value="Después de">Después de</option>
            </select></td>
            <td><select name="category">
                <option value="Desayuno">Desayuno</option>
                <option value="Almuerzo">Almuerzo</option>
                <option value="Comida">Comida</option>
                <option value="Merienda">Merienda</option>
                <option value="Cena">Cena</option>
                <option value="Recena">Recena</option>
            </select></td>
        </tr>
        <tr>
            <td><form:label path="rations">Raciones:</form:label></td>
            <td><form:input onClick="this.select();" path="rations"/> <i><form:errors path="rations"></form:errors></i></td>
        </tr>
        <tr>
            <td><form:label path="glucose">Glucosa:</form:label></td>
            <td><form:input onClick="this.select();" path="glucose"/> <i><form:errors path="glucose"></form:errors></i></td>
        </tr>
        <tr>
            <td><form:label path="weight">Peso:</form:label></td>
            <td><form:input onClick="this.select();" path="weight"/> <i><form:errors path="weight"></form:errors></i></td>
        </tr>
        <tr>
            <td><form:label path="rInsulin">Insulina rápida:</form:label></td>
            <td><form:input onClick="this.select();" path="rInsulin"/> <i><form:errors path="rInsulin"></form:errors></i></td>
        </tr>
        <tr>
            <td><form:label path="sInsulin">Insulina lenta:</form:label></td>
            <td><form:input onClick="this.select();" path="sInsulin"/> <i><form:errors path="sInsulin"></form:errors></i></td>
        </tr>
        <tr>
            <td><form:label path="comment">Comentarios:</form:label></td>
            <td><form:textarea path="comment" /> <i><form:errors path="comment"></form:errors></i></td>
        </tr>
        <tr>
            <td><form:hidden path="username"/></td>
        </tr>
        <tr>
            <td><input type="submit" value="Guardar" /></td>
        </tr>
    </table>
</form:form>

