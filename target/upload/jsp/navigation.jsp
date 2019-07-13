<%@ page contentType="text/html;charset=utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="/static/layui.js"></script>
<script
        src="https://code.jquery.com/jquery-3.4.1.js"
        integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
        crossorigin="anonymous"></script>
<div style="background-color:#393D49">
<div style="display: inline-block;" >
    <ul class="layui-nav" lay-filter="">
        <li class="layui-nav-item"><a href="${ctx}/index.jsp">软件仓库</a></li>
        <li class="layui-nav-item"><a href="${ctx}/jsp/deposit.jsp">文件寄存</a></li>
        <li class="layui-nav-item"><a href="${ctx}/deposit/queryAllFileInfo">文件下载</a></li>
        <li class="layui-nav-item"><a href="">待开发</a></li>
    </ul>
</div>
<div style="display: inline-block;float: right;">
    <c:if test="${u == null}"><div style="margin-top: 10px; margin-right: 15px"><a href="${ctx}/jsp/login.jsp" class="layui-btn">登录</a></div></c:if>
    <c:if test="${u != null}">
        <ul class="layui-nav">
            <li class="layui-nav-item">
                <a href="${ctx}/jsp/login.jsp"><img src="//t.cn/RCzsdCq" class="layui-nav-img">${u.user}</a>
                <dl class="layui-nav-child">
                    <dd><a href="${ctx}/user/logout">退出登录</a></dd>
                </dl>
            </li>
        </ul>
    </c:if>
</div>
</div>

<script>
    //注意：导航 依赖 element 模块，否则无法进行功能性操作
    layui.use('element', function(){
        var element = layui.element;

        //…
    });
</script>