<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<html>
<head>
</head>
<body>
<div id="banner">
    <tiles:insertAttribute name="header" />
</div>
<div id="page">
    <tiles:insertAttribute name="content" />
</div>
</body>
</html>
