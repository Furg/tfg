<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:choose>
    <c:when test="${measure.getId()>0}">
        <h3>Editar Control</h3>
        <br/>
        <c:set var="method" value="POST"/>
        <c:set var="action" value="/measures/edit/${measure.getId()}"/>
    </c:when>
    <c:otherwise>
        <h3>Nuevo Control</h3>
        <br/>
        <c:set var="method" value="POST"/>
        <c:set var="action" value="/measures/form"/>
    </c:otherwise>
</c:choose>

<form:form method="${method}" action="${action}" modelAttribute="measure" class="form-horizontal">

    <div class="form-group">
        <form:label path="date" class="control-label col-sm-2">Fecha y Hora: <span style="color:red;font-weight:bold">*</span></form:label>
        <div class="col-sm-10">
            <div class="input-append date form_datetime">
                <c:choose>
                    <c:when test="${currentDateTime ne null}">
                        <form:input size="16" type="text" path="date" value='${currentDateTime}' readonly="readonly" class="form-control"/>
                    </c:when>

                    <c:otherwise>
                        <form:input size="16" type="text" path="date" readonly="readonly" class="form-control"/>
                    </c:otherwise>
                </c:choose>

                <span class="add-on"><i class="icon-th"></i></span>
            </div>
        </div>
        <form:errors path="date" class="col-sm-12 bg-danger"></form:errors>
    </div>

    <div class="form-group">
        <form:label path="firstCategory" class="control-label col-sm-2">Categoria: <span style="color:red;font-weight:bold">*</span></form:label>
        <div class="col-sm-10">
            <div class="col-sm-6">
                <form:select path="firstCategory" class="form-control">
                    <form:option value="Antes de">Antes de</form:option>
                    <form:option value="Después de">Después de</form:option>
                </form:select>
                <form:errors path="firstCategory" class="col-sm-12 bg-danger"></form:errors>
            </div>
            <div class="col-sm-6">
                <form:select path="secondCategory" class="form-control">
                    <form:option value="Desayunar">Desayunar</form:option>
                    <form:option value="Almorzar">Almorzar</form:option>
                    <form:option value="Comer">Comer</form:option>
                    <form:option value="Merendar">Merendar</form:option>
                    <form:option value="Cenar">Cenar</form:option>
                    <form:option value="Recenar">Recenar</form:option>
                </form:select>
                <form:errors path="secondCategory" class="col-sm-12 bg-danger"></form:errors>
            </div>
        </div>
    </div>

    <div class="form-group">
        <form:label path="rations" class="control-label col-sm-2">Raciones: <span style="color:red;font-weight:bold">*</span></form:label>
        <div class="col-sm-10">
            <form:input onClick="this.select();" path="rations" class="form-control"/>
        </div>
        <form:errors path="rations" class="col-sm-12 bg-danger"></form:errors>
    </div>

    <div class="form-group">
        <form:label path="glucose" class="control-label col-sm-2">Glucosa: <span style="color:red;font-weight:bold">*</span></form:label>
        <div class="col-sm-10">
            <form:input onClick="this.select();" path="glucose" class="form-control"/>
        </div>
        <form:errors path="glucose" class="col-sm-12 bg-danger"></form:errors>
    </div>

    <div class="form-group">
        <form:label path="weight" class="control-label col-sm-2">Peso: <span style="color:red;font-weight:bold">*</span></form:label>
        <div class="col-sm-10">
            <form:input onClick="this.select();" path="weight" class="form-control"/>
        </div>
        <form:errors path="weight" class="col-sm-12 bg-danger"></form:errors>
    </div>

    <div class="form-group">
        <form:label path="rInsulin" class="control-label col-sm-2">Insulina rápida:</form:label>
        <div class="col-sm-10">
            <form:input onClick="this.select();" path="rInsulin" class="form-control"/>
        </div>
        <form:errors path="rInsulin" class="col-sm-12 bg-danger"></form:errors>
    </div>

    <div class="form-group">
        <form:label path="sInsulin" class="control-label col-sm-2">Insulina lenta:</form:label>
        <div class="col-sm-10">
            <form:input onClick="this.select();" path="sInsulin" class="form-control"/>
        </div>
        <form:errors path="sInsulin" class="col-sm-12 bg-danger"></form:errors>
    </div>

    <div class="form-group">
        <form:label path="comment" class="control-label col-sm-2">Comentarios:</form:label>
        <div class="col-sm-10">
            <form:textarea path="comment" class="form-control"/>
        </div>
        <form:errors path="comment" class="col-sm-12 bg-danger"></form:errors>
    </div>

    <form:hidden path="username"/>

    <input type="submit" class="btn btn-success" value="Guardar"/>
</form:form>

