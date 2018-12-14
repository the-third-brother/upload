<%--
  Created by IntelliJ IDEA.
  User: 10250601120
  Date: 2018/12/14
  Time: 14:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form action="${ctx}/entry/update">
    <table border="1">
        <thead>
        <tr><th colspan="2">修改电子文档</th></tr>
        </thead>
        <tbody>
        <tr>
            <td>文档编号</td>
            <td><input type="text" value="${entry.id}" disabled></td>
            <input type="hidden" name="id" value="${entry.id}">
        </tr>
        <tr>
            <td>文档标题</td>
            <td><input type="text" name="title" value="${entry.title}"></td>
        </tr>
        <tr>
            <td>文档摘要</td>
            <td><input type="textarea" name="summary" value="${entry.summary}"></td>
        </tr>
        <tr>
            <td>上传人</td>
            <td><input type="text" value="${entry.uploadUser}" disabled></td>
            <input type="hidden" name="uploadUser" value="${entry.uploadUser}">
        </tr>
        <tr>
            <td>上传时间</td>
            <td><fmt:formatDate value="${entry.createDate}"></fmt:formatDate></td>
            <input type="hidden" name="createDate" value="<fmt:formatDate value="${entry.createDate}"></fmt:formatDate>">
        </tr>
        <tr>
            <td colspan="2">
                <input type="submit" value="提交">
                <a href="javascript:history.go(-1)">返回</a>
            </td>
        </tr>
        </tbody>
    </table>
</form>
</body>
</html>
