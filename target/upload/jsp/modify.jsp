<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/7/4/004
  Time: 20:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>软件上传</title>
    <link rel="stylesheet" href="/static/css/layui.css" media="all">
    <script src="/static/layui.js"></script>
    <script
            src="https://code.jquery.com/jquery-3.4.1.js"
            integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
            crossorigin="anonymous"></script>
    <style>
        .c{
            width: 800px;
            margin: 50px auto;
        }
    </style>
</head>

<body>
<%@include file="navigation.jsp"%>
<div class="c">
<form class="layui-form" action="${ctx}/all/updateSoftwareInfoById">
    <div class="layui-form-item">
        <label class="layui-form-label">软件名称</label>
        <div class="layui-input-block">
            <input id="name" type="text" name="name" required  lay-verify="required" placeholder="请输入软件名称" autocomplete="off" value="${software.name}" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">软件类别</label>
        <div class="layui-input-block">
            <select id="categorySelect" name="cId" lay-verify="required">
                <c:forEach items="${categories}" var="category">
                    <option datasetId="${category.cId}" value="${category.cId}">${category.name}</option>
                </c:forEach>
            </select>
        </div>
    </div>
    <div class="layui-form-item layui-form-text">
        <label class="layui-form-label">软件说明</label>
        <div class="layui-input-block">
            <textarea id="statement" name="statement" placeholder="请输入软件说明" class="layui-textarea">${software.statement}</textarea>
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-input-block">
            <button class="layui-btn" >立即提交</button>
            <button type="reset" class="layui-btn layui-btn-primary">重置</button>
        </div>
    </div>
</form>
</div>

<script>
    layui.use('upload', function(){
        var upload = layui.upload;

        //执行实例
        var uploadInst = upload.render({
            elem: '#test1' //绑定元素
            ,url: '/upload/doUploadFile' //上传接口
            ,done: function(res){
                //上传完毕回调
            }
            ,error: function(){
                //请求异常回调
                alert("error");
            }
        });

        uploadInst.reload({
            accept: 'file' //只允许上传图片
        });
    });
</script>
<script>
    var cId = ${software.cId};
    $("#categorySelect option").each(function () {
        var value = $(this).attr("datasetId");
        if(cId == value)
            $(this).attr("selected", "selected");
    });
</script>

</body>
</html>
