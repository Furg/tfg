<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div class="col-xs-12 col-sm-12 list-group">
    <div class="row">

        <h2 class="col-sm-5"><strong>Controles</strong></h2>

        <div class="form-group pull-right  col-sm-4">
            <label class="control-label">Filtrar por d&#237;a:</label>
            <div class="input-append date form_datetime">
                <input size="16" type="text" id="datefilter" readonly class="form-control">
                <span class="add-on"><i class="icon-th"></i></span>
            </div>
            <button id="clearButton" onClick="cleanFilter();" type="button" class="btn btn-xs btn-danger pull-right" style="display: none;">
                <span class="glyphicon glyphicon-remove"></span>&nbsp;
            </button>
        </div>

    </div>

    <c:choose>
        <c:when test="${mymeasures.size() != 0}">
            <div class="list-group">
                <c:forEach var="measure" items="${mymeasures}">
                    <div class="list-group-item testItemList">
                        <c:if test="${measure.hasComment()}"><span class="badge" onClick="showComment('${measure.getComment()}');" style="cursor:pointer;cursor:hand;"><span class="glyphicon glyphicon-comment" aria-hidden="true"></span></span></c:if>
                        <h4 class="list-group-item-heading"><strong><fmt:formatDate value="${measure.getDate()}" pattern="dd-MM-yyyy HH:mm" /></strong></h4>
                        <p class="list-group-item-text">${measure.getFirstCategory()} ${measure.getSecondCategory()}<c:if test="${measure.hasComment()}">${measure.getRations()}  raciones</c:if></p>
                        <p class="list-group-item-text">Glucosa ${measure.getGlucose()}</p>
                        <p class="list-group-item-text">Peso ${measure.getWeight()}</p>
                        <p class="list-group-item-text">Insulina r&#225;pida ${measure.getrInsulin()}</p>
                        <span onClick="document.location.href = '/measures/edit/${measure.getId()}'" class="badge" style="cursor:pointer;cursor:hand;"><span class="glyphicon glyphicon-pencil" aria-hidden="true"></span></span>
                        <p class="list-group-item-text">Insulina lenta ${measure.getsInsulin()}</p>
                    </div>
                </c:forEach>
            </div>
        </c:when>

        <c:otherwise>
            <div class="alert alert-info">
                <strong>&#191;C&#243;mo?</strong> A&#250;n no has registrado ning&#250;n control.
            </div>
        </c:otherwise>
    </c:choose>

    <div id="alertDayEmpty" class="alert alert-info" style="display: none;">
        <strong>&#191;C&#243;mo?</strong> A&#250;n no has registrado ning&#250;n control en este d&#237;a.
    </div>
</div><!--/col-->

