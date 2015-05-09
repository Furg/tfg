<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:if test="${not empty user}">
    <div class="row">
        <div class="col-md-6">
            <div class="row">
                <div class="col-xs-12 col-sm-12">
                    <h2 class="text-center"><strong>${user.getUsername()}</strong></h2>
                    <br/>
                </div><!--/col-->
                <div id="containerAvatar" class="col-xs-12 col-sm-4">
                    <img id="avatar" src="${user.getImageUrl()}" alt="Avatar de ${user.getUsername()}" height="170" width="170" class="img-circle">
                    <ul class="list-inline ratings text-center" title="Ratings">

                    </ul>
                </div><!--/col-->
                <div class="col-xs-12 col-sm-12">
                    <br/>
                    <div class="col-xs-2 col-sm-2">
                        <div class="text-center levelCircleMini">${user.getLevel()}</div>
                    </div>
                    <div class="col-xs-8 col-sm-8">
                        <div id="totalExp" class="progress progress-striped active">
                            <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100" style="width: ${user.getPercent()}%">
                                <span class="sr-only"></span>
                            </div>
                        </div>
                        <br/>
                    </div>

                </div><!--/col-->
                <c:if test="${user.getUsername() eq username}">
                    <div class="col-xs-12 col-sm-12 list-group">
                        <h2><strong>Controles de hoy</strong></h2>
                        <c:choose>
                            <c:when test="${todaymeasures.size() != 0}">
                                <div class="list-group">
                                    <c:forEach var="measure" items="${todaymeasures}">
                                        <div class="list-group-item testItemList">
                                            <c:if test="${measure.hasComment()}"><span class="badge"><span class="glyphicon glyphicon-comment" aria-hidden="true"></span></span></c:if>
                                            <h4 class="list-group-item-heading"><strong><fmt:formatDate value="${measure.getDate()}" pattern="HH:mm" /></strong></h4>
                                            <p class="list-group-item-text">${measure.getCategory()} <c:if test="${measure.hasComment()}">${measure.getRations()}  raciones</c:if></p>
                                            <p class="list-group-item-text">Glucosa ${measure.getGlucose()}</p>
                                            <p class="list-group-item-text">Peso ${measure.getWeight()}</p>
                                            <p class="list-group-item-text">Insulina r&#225;pida ${measure.getrInsulin()}</p>
                                            <p class="list-group-item-text">Insulina lenta ${measure.getsInsulin()}</p>
                                        </div>
                                    </c:forEach>
                                </div>
                            </c:when>

                            <c:otherwise>
                                <div class="alert alert-info">
                                    <strong>&#191;C&#243;mo?</strong> Hoy a&#250;n no has registrado ning&#250;n control.
                                </div>
                            </c:otherwise>
                        </c:choose>
                    </div><!--/col-->
                </c:if>
            </div><!--/row-->
        </div>
    </div>
</c:if>


