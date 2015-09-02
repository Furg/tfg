<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="col-lg-2 col-sm-12 col-md-12 col-xs-12">

    <div class="list-content">
        <ul class="list-group">
            <li href="#" class="list-group-item title text-center">
                Usuarios TOP
            </li>
            <c:forEach var="topuser" items="${topExpUsers}" varStatus="i" begin="0">
                <li href="#" class="list-group-item text-left text-center">
                    <label class="numberTop">
                            ${i.index+1}<br>
                    </label>
                    <div class="containerAvatarLevelTop">
                        <a href="/users/${topuser.getUsername()}">
                            <img class="img-circle avatarTop" src="${topuser.getImageUrl()}">
                        </a>
                        <label class="levelCircleMiniTop">
                                ${topuser.getLevel()}<br>
                        </label>
                    </div>
                    <label class="name">
                            ${topuser.getUsername()}<br>
                    </label>
                </li>
            </c:forEach>
        </ul>
    </div>
</div>
