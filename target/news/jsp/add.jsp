<%--
  Created by IntelliJ IDEA.
  User: 10250601120
  Date: 2018/12/14
  Time: 14:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <form action="${ctx}/entry/addTo">
        <input type="hidden" name="category.id" value="${categoryId}">
        <table border="1">
            <thead>
                <tr><th colspan="2">添加电子文档</th></tr>
            </thead>
            <tbody>
                <tr>
                    <td>文档标题</td>
                    <td><input type="text" name="title"></td>
                </tr>
                <tr>
                    <td>文档摘要</td>
                    <td><input type="textarea" name="summary"></td>
                </tr>
                <tr>
                    <td>上传人</td>
                    <td><input type="text" name="uploadUser"></td>
                </tr>
                <tr>
                    <td>上传时间</td>
                    <td><input type="date" name="createDate"></td>
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
