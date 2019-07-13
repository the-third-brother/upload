<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/7/4/004
  Time: 19:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script src="/static/layui.js"></script>
<script
        src="https://code.jquery.com/jquery-3.4.1.js"
        integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
        crossorigin="anonymous"></script>

<c:if test="${u != null}">
<button type="button" class="layui-btn" id="test1">
    <i class="layui-icon">&#xe67c;</i>上传软件
</button>
</c:if>
<button type="button" class="layui-btn">
    <a href="${ctx}/all/queryAllSoftwareInfo">查询全部</a>
</button>
<c:if test="${u != null}">
<button type="button" class="layui-btn">
    <a href="${ctx}/all/queryCategories">分类管理</a>
</button>
</c:if>
<table class="layui-table">
    <tr>
        <th>软件名称</th>
        <th>软件大小</th>
        <th>上传用户</th>
        <th>上传时间</th>
        <th>下载次数</th>
        <th>用户操作</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${softwareDetailsList}" var="entry">
        <tr>
            <td>${entry.name}</td>
            <td>${entry.size}</td>
            <td>${entry.uploader}</td>
            <td><fmt:formatDate value="${entry.uploadTime}"></fmt:formatDate></td>
            <td>${entry.download}</td>
                <%--                <td><fmt:formatDate value="${entry.createDate}"></fmt:formatDate></td>--%>
            <td>
                <c:if test="${u != null}">
                <button type="button" class="layui-btn layui-btn-xs" onclick="modify1(${entry.sId})">修改</button>
                <button type="button" class="layui-btn layui-btn-xs" onclick="delete1(${entry.sId})">删除</button>
                </c:if>
                <button type="button" class="layui-btn layui-btn-xs" onclick="download1(${entry.sId})">下载</button>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>

<div id="demo7"></div>

<script>
    layui.use('upload', function(){
        var upload = layui.upload;

        //执行实例
        var uploadInst = upload.render({
            elem: '#test1' //绑定元素
            ,url: '/upload/doUploadFile' //上传接口
            ,done: function(res){
                //上传完毕回调
                var size = res.fileSize;
                var name = res.fileName;
                var url = res.url;
                var realUrl = res.realUrl;
                window.location.replace(url+"?name="+name+"&size="+size+"&url="+realUrl);
            }
            ,error: function(){
                //请求异常回调
                alert("error");
            }
        });

        uploadInst.reload({
            accept: 'file'
        });
    });
</script>

<script>
    function download1(sId) {
        $.ajax({
            url: '${ctx}/all/download/'
            ,type: 'post'
            ,data: {sId: sId}
            ,dataType: 'json'
            ,success: function (res) {
                var url = res.url;
                window.location.replace('${ctx}'+url);
            }
            ,error: function () {
                alert("error");
            }
        })
    }
</script>

<script>
    function delete1(sId) {
        layui.use('layer', function(){
            var layer = layui.layer;

            layer.confirm('确认删除此软件信息吗？', {
                    btn: ['确定', '取消']
                },function () {
                $.ajax({
                    url: '${ctx}/all/delete'
                    ,type: 'post'
                    ,data: {sId: sId}
                    ,dataType: 'json'
                    ,success: function (res) {
                        var url = res.url;
                        console.log(url);

                        window.location.replace("${ctx}"+url);
                    }
                    ,error: function () {
                        alert("error");
                    }
                })
                }
            );
        })
    }
</script>

<script>
    function modify1(sId) {
        window.location.replace("${ctx}/all/toModifySoftwareById?sId="+sId);
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