<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Bootstrap -->
    <link href="/static/bootstrap/css/mycss.css" rel="stylesheet" media="screen">
    <link href="/static/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
    <link href="/static/bootstrap/css/bootstrap-social.css" rel="stylesheet" media="screen">
    <link href="/static/bootstrap/css/bootstrap-datetimepicker.css" rel="stylesheet" media="screen">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
</head>
<body>
<div id="menu">
    <tiles:insertAttribute name="menu" />
</div>
<div id="content">
    <tiles:insertAttribute name="content" />
</div>

<script src="http://code.jquery.com/jquery.js"></script>
<script src="/static/bootstrap/js/bootstrap.min.js"></script>
<script src="/static/bootstrap/js/bootstrap-datetimepicker.js"></script>
<script src="/static/bootstrap/js/bootstrap-datetimepicker.es.js"></script>
</body>
</html>
