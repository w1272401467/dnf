<%@ page import="service.UserService" %>
<%@ page contentType="text/html;charset=UTF-8" language="java"  %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    int id=Integer.valueOf(request.getParameter("id"));
    UserService userService =new UserService();

%>
<form action="updateuser?method=4&id=<%=id%>" method="post">
    <table>
        <caption>用户信息修改</caption>
        <tr><td>用户名:</td><td><input type="text" name="UserName" size="20" value="<%=userService.queryUser(id).getUserName()%>"/></td></tr>
        <tr><td>密码:</td><td><input type="text" name="Password" size="20" value="<%=userService.queryUser(id).getPassword()%>"/></td></tr>
        <tr><td>真实姓名:</td><td><input type="text" name="RealName" size="20" value="<%=userService.queryUser(id).getRealName()%>"/></td></tr>
        <tr>
            <td>性别:</td><td>
                <select name="Sex" class="inputinput" >
                    <option value="<%=userService.queryUser(id).getSex()%>">男
                    </option>
                    <option value ="<%=userService.queryUser(id).getSex()%>">女</option>
                </select>
            </td>
        </tr>
        <tr><td>地址:</td><td><input type="text" name="Address" size="20" value="<%=userService.queryUser(id).getAddress()%>"/></td></tr>
        <tr><td>头像:</td><td><input type="text" name="HeadImageAddress" size="20" value="<%=userService.queryUser(id).getHeadImageAddress()%>"/></td></tr>
        <tr><td>兴趣:</td><td><input type="text" name="Interests" size="20" value="<%=userService.queryUser(id).getInterets()%>"/></td></tr>
        <tr><td>QQ:</td><td><input type="text" name="QQNumber" size="20" value="<%=userService.queryUser(id).getQQNumber()%>"/></td></tr>
        <tr><td><input type="submit" value="确认修改"/><td><input type="reset" value="重置"/>

    </table>
</form>

</body>
</html>
