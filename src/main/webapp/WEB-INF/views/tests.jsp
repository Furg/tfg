<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div class="jumbotron container" id="jumbo">

    <h2>Tests</h2>
    <br/>

    <c:if test="${not empty tests}">
        <div class="bs-example">
            <div class="row">
                <div class="list-group col-sm-6">
                    <h3>Diabetes</h3>
                    <c:forEach var="test" items="${tests}">
                        <c:if test="${test.getType() == 'Diabetes'}">
                            <c:if test="${!user.getCompleteTests().contains(test.getId())}"><a href="/tests/do/${test.getId()}" class="list-group-item testItemList"></c:if>
                            <c:if test="${user.getCompleteTests().contains(test.getId())}"><a href="#" class="list-group-item testComplete"></c:if>
                                    <span class="badge">${test.questions.size()} pregunta<c:if test="${test.questions.size() != 1}">s</c:if></span>
                                    <h4 class="list-group-item-heading">${test.getName()}</h4>
                                    <p class="list-group-item-text">${test.getDescription()}</p>
                                </a>
                        </c:if>
                    </c:forEach>
                </div>
                <div class="list-group col-sm-6">
                    <h3>Dieta</h3>
                    <c:forEach var="test" items="${tests}">
                        <c:if test="${test.getType() == 'Dieta'}">
                            <a href="/tests/do/${test.getId()}" class="list-group-item testItemList">
                                <span class="badge">${test.questions.size()} pregunta<c:if test="${test.questions.size() != 1}">s</c:if></span>
                                <h4 class="list-group-item-heading">${test.getName()}</h4>
                                <p class="list-group-item-text">${test.getDescription()}</p>
                            </a>
                        </c:if>
                    </c:forEach>
                </div>
            </div>
            <div class="row">
                <div class="list-group col-sm-6">
                    <h3>Nutrición</h3>
                    <c:forEach var="test" items="${tests}">
                        <c:if test="${test.getType() == 'Nutrición'}">
                            <a href="/tests/do/${test.getId()}" class="list-group-item testItemList">
                                <span class="badge">${test.questions.size()} pregunta<c:if test="${test.questions.size() != 1}">s</c:if></span>
                                <h4 class="list-group-item-heading">${test.getName()}</h4>
                                <p class="list-group-item-text">${test.getDescription()}</p>
                            </a>
                        </c:if>
                    </c:forEach>
                </div>
                <div class="list-group col-sm-6">
                    <h3>Obesidad</h3>
                    <c:forEach var="test" items="${tests}">
                        <c:if test="${test.getType() == 'Obesidad'}">
                            <a href="/tests/do/${test.getId()}" class="list-group-item testItemList">
                                <span class="badge">${test.questions.size()} pregunta<c:if test="${test.questions.size() != 1}">s</c:if></span>
                                <h4 class="list-group-item-heading">${test.getName()}</h4>
                                <p class="list-group-item-text">${test.getDescription()}</p>
                            </a>
                        </c:if>
                    </c:forEach>
                </div>
            </div>
        </div>
    </c:if>
</div>
