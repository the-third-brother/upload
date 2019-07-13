<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/7/7/007
  Time: 12:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>软件分类管理</title>
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
    <button type="button" class="layui-btn" onclick="addCategory()">添加</button>
<table class="layui-table">
    <tr>
        <th>编号</th>
        <th>软件分类名</th>
        <th>用户操作</th>
    </tr>
    </thead>
    <tbody>
    <c:set var="index" value="0"></c:set>
    <c:forEach items="${categories}" var="entry">
        <tr>
            <td>
                <c:set var="index" value="${index+1}"></c:set>${index}
            </td>
            <td>${entry.name}</td>
            <td>
                <button type="button" class="layui-btn layui-btn-xs" onclick="modifyCategory(${entry.cId})">修改</button>
                <button type="button" class="layui-btn layui-btn-xs" onclick="deleteCategory(${entry.cId})">删除</button>
<%--                <a id="modifyCategory" href="javascript:void(0)" onclick="modifyCategory(${entry.cId})">修改</a>--%>
<%--                <a href="javascript:void(0);" onclick="delete1(${entry.cId})">删除</a>--%>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
</div>




<script>
    function deleteCategory(cId) {
        layui.use('layer', function(){
            var layer = layui.layer;

            layer.confirm('确认删除此分类信息吗？', {
                    btn: ['确定', '取消']
                },function () {
                    $.ajax({
                        url: '${ctx}/all/deleteCategoryById'
                        ,type: 'post'
                        ,data: {
                            cId: cId
                        }
                        ,dataType: 'json'
                        ,success: function (res) {
                            var url = res.url;
                            window.location.replace("${ctx}"+url);
                        }
                        ,error: function () {
                        }
                    })
                }
            );

        })}
</script>

<script>
    function modifyCategory(cId){
        layui.use('layer', function(){
            var layer = layui.layer;

            layer.open({
                type: 1
                ,title: "请输入分类名"
                ,btn: ['确定', '取消']
                ,area: '800px'
                ,content: '<div class="c_pop">'+'<div class="layui-input-block">\n' +
                    '      <input id="cName" type="text" name="cName" required  lay-verify="required" placeholder="请输入分类名" autocomplete="off" class="layui-input">\n' +
                    '    </div>'+'</div>'
                ,btn1: function (index, layero) {
                    var name = $("#cName").val();
                    $.ajax({
                        url: '${ctx}/all/modifyCategoryById'
                        ,type: 'post'
                        ,data: {
                            cId: cId,
                            name: name
                        }
                        ,dataType: 'json'
                        ,success: function (res) {
                            var url = res.url;
                            window.location.replace("${ctx}"+url);
                        }
                        ,error: function () {
                            alert("error");
                        }
                    })
                }
                ,btn2: function (index, layero) {
                    // alert("取消");
                }
            });
        });
    }
</script>

<script>
    function addCategory(){
        layui.use('layer', function(){
            var layer = layui.layer;

            layer.open({
                type: 1
                ,title: "请输入分类名"
                ,btn: ['确定', '取消']
                ,area: '800px'
                ,content: '<div class="c_pop">'+'<div class="layui-input-block">\n' +
                    '      <input id="cName" type="text" name="cName" required  lay-verify="required" placeholder="请输入分类名" autocomplete="off" class="layui-input">\n' +
                    '    </div>'+'</div>'
                ,btn1: function (index, layero) {
                    var name = $("#cName").val();
                    $.ajax({
                        url: '${ctx}/all/addCategoryByName'
                        ,type: 'post'
                        ,data: {
                            name: name
                        }
                        ,dataType: 'json'
                        ,success: function (res) {
                            var url = res.url;
                            window.location.replace("${ctx}"+url);
                        }
                        ,error: function () {
                            alert("error");
                        }
                    })
                }
                ,btn2: function (index, layero) {
                    // alert("取消");
                }
            });
        });
    }
</script>
</body>
</html>
