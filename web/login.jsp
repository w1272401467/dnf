<%@ page import="service.UserService" %>
<%@ page contentType="text/html;charset=UTF-8" language="java"  %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<form action="doLogin.jsp?method=1" method="post">
    <table>
        <caption>用户登录</caption>
        <tr><td>用户名:</td><td><input type="text" name="UserName" size="20"/></td></tr>
        <tr><td>密码:</td><td><input type="text" name="Password" size="20"/></td></tr>
        <tr><td><input type="submit" value="登录"/><td><input type="reset" value="重置"/>

    </table>
    <a href="newhome.jsp">返回首页 </a>
</form>
<%
    if(session.getAttribute("UserName")!=null){
        session.invalidate();
    }
%>
</body>
</html>
