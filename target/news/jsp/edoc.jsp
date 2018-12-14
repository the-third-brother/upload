<%--
  Created by IntelliJ IDEA.
  User: 10250601120
  Date: 2018/12/14
  Time: 12:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <div>
        <form action="${ctx}/entry/byCid">
            <span>分类</span>
            <select name="category" id="sel">
                <option value="0">全部</option>
                <c:forEach items="${categoryList}" var="category">
                    <option value="${category.id}" <c:if test="${cid eq category.id}">selected</c:if>>${category.name}</option>
                </c:forEach>
            </select>
            <input type="submit" value="查询">
            <%--<a href="">添加电子文档</a>--%>
            <input type="button" value="添加电子文档" id="add">
        </form>
    </div>

    <div>
        <table border="1">
            <thead>
                <tr><th>电子文档列表</th></tr>
                <tr>
                    <td>文档编号</td>
                    <td>文档标题</td>
                    <td>文档摘要</td>
                    <td>上传人</td>
                    <td>上传时间</td>
                    <td>操作</td>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${entryList}" var="entry">
                    <tr>
                        <td>${entry.id}</td>
                        <td>${entry.title}</td>
                        <td>${entry.summary}</td>
                        <td>${entry.uploadUser}</td>
                        <td><fmt:formatDate value="${entry.createDate}"></fmt:formatDate></td>
                        <td>
                            <a href="${ctx}/entry/updateTo/${entry.id}">修改</a>
                            <%--<a href="${ctx}/entry/del/${entry.id}">删除</a>--%>
                            <input type="button" value="删除" id="del">
                        </td>
                    </tr>
                </c:forEach>
                <tr>
                    <c:if test="${addFlag eq true}">添加成功</c:if>
                    <c:if test="${addFlag eq false}">添加失败</c:if>
                    <c:if test="${updateFlag eq true}">修改成功</c:if>
                    <c:if test="${updateFlag eq false}">修改失败</c:if>
                    <c:if test="${delFlag eq true}">删除成功</c:if>
                    <c:if test="${delFlag eq false}">删除失败</c:if>
                </tr>
            </tbody>
        </table>
    </div>

    <script src="${ctx}/static/jquery/jquery.js"></script>
    <script>
    $(function () {
        var cid = $("#sel").val()
        $("#add").click(function () {
            if (cid==0){
                alert("请选择分类信息");
                return false;
            }
            window.location = "${ctx}/category/addTo?category="+cid;
        })

        $("input#del").click(function () {
            if (!alert("确认删除吗？")){
                return false;
            }
            window.location = "${ctx}/entry/del/${entry.id}"
        })
    })
</script>
</body>
</html>
