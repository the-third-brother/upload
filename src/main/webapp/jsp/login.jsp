<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/7/4/004
  Time: 19:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=utf-8" %>
<html>
<head>
    <title>登录</title>
    <link rel="stylesheet" href="/static/css/layui.css" media="all">
    <style>
        .c{
            width: 800px;
            margin: 100px auto;
        }
    </style>
</head>
<body>
<%@include file="navigation.jsp"%>
<div class="c">
<form class="layui-form" action="${ctx}/user/login">
    <div class="layui-form-item">
        <label class="layui-form-label">用户名</label>
        <div class="layui-input-block">
            <input type="text" name="user" required  lay-verify="required" placeholder="请输入用户名" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">密码框</label>
        <div class="layui-input-block">
            <input type="password" name="password" required lay-verify="required" placeholder="请输入密码" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-input-block">
            <button class="layui-btn" lay-submit lay-filter="formDemo">登录</button>
            <button type="reset" class="layui-btn layui-btn-primary">重置</button>
        </div>
    </div>
</form>
</div>
</body>
</html>
