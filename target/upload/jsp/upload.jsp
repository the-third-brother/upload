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
        .c_pop{
            width: 700px;
            margin-top: 10px;
        }
    </style>
</head>

<body>
<%@include file="navigation.jsp"%>
<div class="c">
<form class="layui-form" action="${ctx}/upload/doUploadInfo" enctype="multipart/form-data">
<input id="size" type="hidden" name="size" value="${size}">
<input id="size" type="hidden" name="url" value="${url}">
    <div class="layui-form-item">
        <label class="layui-form-label">软件名称</label>
        <div class="layui-input-block">
            <input id="name" type="text" name="name" required  lay-verify="required" placeholder="请输入软件名称" autocomplete="off" value="${name}" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">软件类别</label>
        <div class="layui-input-block">
            <select name="cId" lay-verify="required">
                <c:forEach items="${categories}" var="category">
                    <option datasetId="${category.cId}" value="${category.cId}">${category.name}</option>
                </c:forEach>
            </select>
            <button type="button" class="layui-btn" lay-submit lay-filter="save" id="addCategory">添加分类</button>
        </div>
    </div>
    <div class="layui-form-item layui-form-text">
        <label class="layui-form-label">软件说明</label>
        <div class="layui-input-block">
            <textarea id="statement" name="statement" placeholder="请输入软件说明" class="layui-textarea">${statement}</textarea>
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
    //Demo
    layui.use('form', function(){
        var form = layui.form;

        //监听提交
        form.on('submit(formDemo)', function(data){
            layer.msg(JSON.stringify(data.field));
            return false;
        });
    });
</script>
<script>
    $('#addCategory').on('click', function () {
        // alert("add Category");
        layui.use('layer', function(){
            var layer = layui.layer;

            layer.open({
                type: 1
                ,title: "请输入分类名"
                // ,skin: 'layui-layer-rim'
                ,btn: ['保存', '取消']
                ,area: '800px'
                ,content: '<div class="c_pop">'+'<div class="layui-input-block">\n' +
                    '      <input id="cName" type="text" name="cName" required  lay-verify="required" placeholder="请输入分类名" autocomplete="off" class="layui-input">\n' +
                    '    </div>'+'</div>'
                ,btn1: function (index, layero) {
                    var cName = $("#cName").val();
                    var name = $("#name").val();
                    var statement = $("#statement").val();
                    var size = $("#size").val();
                    $.ajax({
                        url: '${ctx}/all/addCategory'
                        ,type: 'post'
                        ,data: {
                            cName: cName,
                            name: name,
                            statement: statement,
                            size: size
                        }
                        ,dataType: 'json'
                        ,success: function (res) {
                            var name = res.name;
                            var statement = res.statement;
                            var url = res.url;
                            var size = res.size;
                            window.location.replace("${ctx}"+url+"?name="+name+"&statement="+statement+"&size="+size);
                        }
                        ,error: function () {
                            
                        }
                    })
                }
                ,btn2: function (index, layero) {
                    // alert("取消");
                }
            });
        });
    });
</script>
<%--<script>--%>
<%--    var cId = ${newCId};--%>
<%--    $("#categorySelect option").each(function () {--%>
<%--        var value = $(this).attr("datasetId");--%>
<%--        if(cId == value)--%>
<%--            $(this).attr("selected", "selected");--%>
<%--    });--%>
<%--</script>--%>
</body>
</html>
