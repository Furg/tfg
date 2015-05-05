<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <!-- Bootstrap -->
    <link href="/static/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
    <link href="/static/bootstrap/css/bootstrap-theme.min.css" rel="stylesheet" media="screen">
    <link href="/static/bootstrap/css/sweetalert2.css" rel="stylesheet" media="screen">
    <style>
        body {
            padding-top: 60px; /* 60px to make the container go all the way to the bottom of the topbar */
        }

        @font-face {
            font-family: 'Glyphicons Halflings';
            src: url('/static/bootstrap/fonts/glyphicons-halflings-regular.eot');
            src: url('/static/bootstrap/fonts/glyphicons-halflings-regular.eot?#iefix') format('embedded-opentype'), url('/static/bootstrap/fonts/glyphicons-halflings-regular.woff') format('woff'), url('/static/bootstrap/fonts/glyphicons-halflings-regular.ttf') format('truetype'), url('/static/bootstrap/fonts/glyphicons-halflings-regular.svg#glyphicons-halflingsregular') format('svg');
        }

        span.glyphicon-remove-circle {
            font-size: 1.2em;
        }

        #jumbo {
            padding-top: 5px;
        }

        .jumbotron p {
            margin: 0 0 10px !important;
            font-size: 14px !important;
        }

        .list-group-item {
            border-radius: 5px;
        }

        .testItemList:hover span {
            background-color: #337ab7;
        }

        .testComplete {
             background-color: #2ecc71;
         }

        .testComplete:hover {
            background-color: #2ecc71 !important;
        }

        .testComplete:active {
            background-color: #2ecc71 !important;
        }

        .testComplete:focus {
            background-color: #2ecc71 !important;
        }

        .levelCircle
        {
            width:110px;
            height:110px;
            border-radius:250px;
            font-size:60px;
            color:#fff;
            line-height:110px;
            text-align:center;
            background:#27ae60;
            box-shadow: 0px 0px 20px black;
            -webkit-text-stroke-width: 2px;
            -webkit-text-stroke-color: #000;
        }
    </style>
    <link href="/static/bootstrap/css/bootstrap-social.css" rel="stylesheet" media="screen">
    <link href="/static/bootstrap/css/bootstrap-datetimepicker.css" rel="stylesheet" media="screen">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
</head>
<body>

<div id="menu" class="navbar navbar-inverse navbar-fixed-top">
    <tiles:insertAttribute name="menu" />
</div>
<div id="content" class="container">
        <tiles:insertAttribute name="content" />
</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="/static/bootstrap/js/bootstrap.min.js"></script>
<script src="/static/dynamic_list_helper2.js" type="text/javascript"></script>
<script src="/static/bootstrap/js/sweetalert2.min.js" type="text/javascript"></script>

<div id="scripts">
    <tiles:insertAttribute name="scripts" />
</div>
</body>
</html>
