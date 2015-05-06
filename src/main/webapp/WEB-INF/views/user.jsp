<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<div class="jumbotron">
    <c:if test="${not empty user}">
        <div class="row">
            <div class="col-md-6">
                <div class="row">
                    <div class="col-xs-12 col-sm-8 textContainer">
                        <br/>
                        <br/>
                        <h2><strong>${user.getUsername()}</strong></h2>
                        <br/>
                    </div><!--/col-->
                    <div class="col-xs-12 col-sm-4">
                        <img src="${user.getImageUrl()}" alt="Avatar de ${user.getUsername()}" height="200" width="200" class="img-circle under">
                        <div class="text-center levelCircleMini over">1</div>
                        <ul class="list-inline ratings text-center" title="Ratings">

                        </ul>
                    </div><!--/col-->
                    <div class="col-xs-12 col-sm-12">
                        <br/>
                        <div id="totalExp" class="progress progress-striped active">
                            <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100" style="width: 50%">
                                <span class="sr-only"></span>
                            </div>
                        </div>
                    </div><!--/col-->
                    <c:if test="${user.getUsername() eq username}">
                        <div class="col-xs-12 col-sm-12">
                            <h2><strong>Controles de hoy</strong></h2>
                            <c:forEach var="measure" items="${usermeasures.getMeasures()}">
                                <li>${measure.getId()}: ${measure.getDate()} ${measure.getWeight()}</li>
                            </c:forEach>
                        </div><!--/col-->
                    </c:if>
                </div><!--/row-->
            </div>
        </div>
    </c:if>
</div>


