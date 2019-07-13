<%@ page contentType="text/html;charset=utf-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>软件仓库</title>
    <link rel="stylesheet" href="/static/css/layui.css" media="all">
    <script src="/static/layui.js"></script>
    <style>
        .software_details{
            width: 800px;
            margin: 50px auto;
        }
    </style>
</head>
<body>

<%@include file="navigation.jsp"%>
<div class="software_details">
    <%@include file="software_details.jsp"%>
</div>
</body>
</html>