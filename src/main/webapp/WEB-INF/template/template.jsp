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
            margin: 10px;
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

        .levelCircleMini
        {
            width:50px;
            height:50px;
            border-radius:250px;
            font-size:30px;
            color:#fff;
            line-height:50px;
            text-align:center;
            background:#27ae60;
            box-shadow: 0px 0px 20px black;
            -webkit-text-stroke-width: 1.5px;
            -webkit-text-stroke-color: #000;
            position:absolute;
            z-index:2;
        }

        #totalExp{
            margin-top: 15px;
        }

        #measuresExp{
            margin-top: 25px;
            margin-bottom: 30px;
        }

        .avatar {
            display:block;
            margin:auto;
            box-shadow: 0px 0px 20px black;
        }

        .avatarTop {
            box-shadow: 0px 0px 20px black;
        }

        #containerAvatar {
            width: 100%;
            text-align: center;
        }

        .list-content .list-group .title{
            background:#5bc0de;
            border:2px solid #DDDDDD;
            font-weight:bold;
            color:#FFFFFF;
        }
        .list-group-item img {
            height:80px;
            width:80px;
        }

        .numberTop{
            border-radius: 10px;
            background: #bde6f2;
            border: 3px solid #5bc0de;
            padding-left: 5px;
            padding-right: 5px;
            margin-bottom:12px;
        }

        .levelCircleMiniTop
        {
            width:50px;
            height:50px;
            border-radius:250px;
            font-size:30px;
            color:#fff;
            line-height:50px;
            text-align:center;
            background:#27ae60;
            box-shadow: 0px 0px 20px black;
            -webkit-text-stroke-width: 1.5px;
            -webkit-text-stroke-color: #000;
            margin-left:15px;

        }

        .containerAvatarLevelTop{
            display:block;
            margin:auto;
        }


        .progress {
            position: relative;
            background: rgba(245, 245, 245, 1);
            border: 3px solid grey;
            border-radius: 25px;
            height: 25px;
        }

        .progress span {
            position: absolute;
            display: block;
            width: 100%;
            color: black;
        }




    </style>
    <link href="/static/bootstrap/css/bootstrap-social.css" rel="stylesheet" media="screen">
    <link href="/static/bootstrap/css/bootstrap-datetimepicker.css" rel="stylesheet" media="screen">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
    <title><tiles:getAsString name="title"/></title>
</head>
<body class="container-fluid">

<div id="menu" class="navbar navbar-inverse navbar-fixed-top">
    <tiles:insertAttribute name="menu" />
</div>

<div id="content" class="jumbotron container col-lg-8 col-lg-offset-2">
        <tiles:insertAttribute name="content" />
</div>

<div id="tops">
        <tiles:insertAttribute name="tops" />
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
