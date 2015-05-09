
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<h3>Creación de un test</h3>
<br/>
<c:set var="method" value="POST"/>
<c:set var="action" value="/tests/form"/>

<form:form method="${method}" action="${action}" modelAttribute="test" id="questionListForm" class="form-horizontal">

    <div class="form-group">
        <form:label path="name" class="control-label col-sm-2">Nombre: <span style="color:red;font-weight:bold">*</span></form:label>
        <div class="col-sm-10">
            <form:input path="name" class="form-control"/>
        </div>
        <form:errors path="name" class="col-sm-12 bg-danger"></form:errors>

    </div>

    <div class="form-group">
        <form:label path="type" class="control-label col-sm-2">Tema: <span style="color:red;font-weight:bold">*</span></form:label>
        <div class="col-sm-10">
            <form:select path="type" class="form-control">
                <form:option value="" label="" />
                <form:options items="${types}" />
            </form:select>
        </div>
        <form:errors path="type" class="col-sm-12 bg-danger"></form:errors>
    </div>

    <div class="form-group">
        <form:label path="description" class="control-label col-sm-2">Descripción:</form:label>
        <div class="col-sm-10">
            <form:textarea path="description" class="form-control"/>
        </div>
        <form:errors path="description" class="col-sm-12 bg-danger"></form:errors>
    </div>

    <div class="form-group" id="questionListContainer">

        <c:forEach items="${test.questions}" var="qtest" varStatus="i" begin="0" >
            <div class="qtest alert alert-info">
                <label class="control-label col-sm-2">Pregunta:</label>
                <div class="col-sm-10">
                    <form:input path="questions[${i.index}].question" id="question${i.index}" class="form-control"/>
                </div>
                <label class="control-label col-sm-2">Respuesta:</label>
                <div class="col-sm-10">
                    <form:select path="questions[${i.index}].answer" id="answer${i.index}" class="form-control">
                        <form:option value="Verdadero">Verdadero</form:option>
                        <form:option value="Falso">Falso</form:option>
                    </form:select>
                </div>
                <div class="text-right">
                    <a href="#" class="removeQuestion"><span class="glyphicon glyphicon-remove-circle" aria-hidden="true"></span></a>
                </div>
            </div>
        </c:forEach>


        <c:if test="${test.questions.size() == 0}">
            <div class="qtest defaultRow alert alert-info">
                <label class="control-label col-sm-2">Pregunta:</label>
                <div class="col-sm-10">
                    <input type="text" name="questions[].question" value="" class="form-control"/>
                </div>
                <label class="control-label col-sm-2">Respuesta:</label>
                <div class="col-sm-10">
                    <select name="questions[].answer" class="form-control">
                        <option value="Verdadero">Verdadero</option>
                        <option value="Falso">Falso</option>
                    </select>
                </div>
                <div class="text-right">
                    <a href="#" class="removeQuestion"><span class="glyphicon glyphicon-remove-circle" aria-hidden="true"></span></a>
                </div>
            </div>
        </c:if>
    </div>


    <input type="submit" class="btn btn-success" value="Guardar Test" id="submit"/>&nbsp;&nbsp;
    <a href="#" class="btn btn-primary" id="addQuestion">Añadir Pregunta</a>
</form:form>