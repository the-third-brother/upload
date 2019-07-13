<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/7/10/010
  Time: 21:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>文件下载</title>
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
    <c:if test="${u == null}"><label class="layui-form-item">登录后即可查看并下载文件</label></c:if>
            <table class="layui-table">
                <thead>
                <tr><th>编号</th>
                    <th>文件名</th>
                    <th>大小</th>
                    <th>操作</th>
                </tr></thead>
                <c:if test="${u != null}">
                <tbody>
                <c:set var="index" value="0"></c:set>
                <c:forEach items="${depositFiles}" var="entry">
                    <tr><td>
                        <c:set var="index" value="${index+1}"></c:set>${index}
                    </td>
                    <td>${entry.name}</td>
                    <td>${entry.size}</td>
                    <td>
                    <button type="button" class="layui-btn layui-btn-xs" onclick="download1(${entry.fId})">下载</button>
                        <c:if test="${u != null}">
                            <button type="button" class="layui-btn layui-btn-xs demo-delete" onclick="delete1(${entry.fId})">删除</button>
                        </c:if>
                    </td></tr>
                </c:forEach>
                </tbody>

            </table>
    <div id="demo7"></div>
    </c:if>
    </div>

<script>
    function download1(fId){
        $.ajax({
            url: '${ctx}/deposit/downloadById'
            ,type: 'post'
            ,data: {
                fId: fId
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

    function delete1(fId) {
        layui.use('layer', function(){
            var layer = layui.layer;

            layer.confirm('确认删除此分类信息吗？', {
                    btn: ['确定', '取消']
                },function () {
                    $.ajax({
                        url: '${ctx}/deposit/deleteById'
                        ,type: 'post'
                        ,data: {
                            fId: fId
                        }
                        ,dataType: 'json'
                        ,success: function (res) {
                           var url = res.url;
                           window.location.replace(url);
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
                        url: '${ctx}/deposit/deleteById'
                        ,type: 'post'
                        ,data: {
                            fId: fId
                        }
                        ,dataType: 'json'
                        ,success: function (res) {
                            <%--var url = res.url;--%>
                            <%--window.location.replace("${ctx}"+url);--%>
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
    layui.use(['laypage', 'layer'], function(){
        var laypage = layui.laypage;
        laypage.render({
            elem: 'demo7'
            ,count: ${count}
            ,layout: ['count', 'prev', 'page', 'next', 'limit', 'refresh', 'skip']
            ,jump: function(obj){
                console.log(obj)
            }
        });})
</script>
</body>
</html>
