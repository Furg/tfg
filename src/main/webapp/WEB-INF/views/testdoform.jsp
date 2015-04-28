<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div class="jumbotron" id="jumbo">

    <h2>Test</h2>
    <br/>
    <c:set var="method" value="POST"/>
    <c:set var="action" value="/tests/do/${test.id}"/>


    <form:form method="${method}" action="${action}" modelAttribute="test" id="questionListForm" class="form-horizontal">

        <div class="form-group">
            <div class="row text-center">
                <div class="col-sm-3">
                    <div class="panel panel-primary">
                        <div class="panel-heading">Nombre</div>
                        <div class="panel-body">${test.name}</div>
                    </div>
                </div>
                <div class="col-sm-3">
                    <div class="panel panel-primary">
                        <div class="panel-heading">Tema</div>
                        <div class="panel-body">${test.type}</div>
                    </div>
                </div>
                <c:if test="${test.hasDescription()}">
                        <div class="col-sm-6">
                            <div class="panel panel-primary">
                                <div class="panel-heading">Descripción</div>
                                <div class="panel-body">${test.description}</div>
                            </div>
                        </div>
                </c:if>
            </div>
        </div>

        <div class="form-group" id="questionListContainer">

            <c:forEach items="${test.questions}" var="qtest" varStatus="i" begin="0" >
                <div class="String alert alert-info">
                    <label class="control-label col-sm-2">Pregunta:</label>
                    <div class="col-sm-10">
                        <p>${qtest.question}</p>
                    </div>
                    <label class="control-label col-sm-2">Respuesta:</label>
                    <div class="col-sm-10">
                        <form:select path="questions[${i.index}].answer"  class="form-control">
                            <form:option value="Verdadero">Verdadero</form:option>
                            <form:option value="Falso">Falso</form:option>
                        </form:select>
                    </div>
                    <p>.</p>
                </div>
            </c:forEach>
        </div>


        <c:choose>
            <c:when test="${test.questions.size() != 0}">
                <input type="submit" class="btn btn-success" value="Guardar" id="submit"/>&nbsp;&nbsp;
            </c:when>

            <c:otherwise>
                <div class="alert alert-danger">
                    <strong>¡Ups!</strong> Este test aún no tiene preguntas.
                </div>
                <br/>
                <a href="/tests" type="button" class="btn btn-primary">Volver</a>
            </c:otherwise>
        </c:choose>

    </form:form>
</div>
