<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/1/4
  Time: 8:56
  To change this template use File | Settings | File Templates.
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<html>
<head>
    <title>Title</title>
</head>
<body>

<form action="useradd?method=2" method="post">
    <table>
        <caption>用户注册</caption>
        <tr><td>用户名:</td><td><input type="text" name="UserName" size="20"/></td></tr>
        <tr><td>密码:</td><td><input type="text" name="Password" size="20"/></td></tr>
        <tr><td>真实姓名:</td><td><input type="text" name="RealName" size="20"/></td></tr>
        <tr><td>性别:</td><td>
            <select name="Sex" class="inputinput" style="height:30px;width: 100px">
                <option value="1">男</option>
                <option value ="0">女</option>
            </select>
        </td></tr>


        <tr><td>地址:</td><td><input type="text" name="Address" size="20"/></td></tr>
        <tr><td>头像:</td><td><input type="text" name="HeadImageAddress" size="20"/></td></tr>
        <tr><td>兴趣:</td><td><input type="text" name="Interests" size="20"/></td></tr>
        <tr><td>QQ号:</td><td><input type="text" name="QQNumber" size="20"/></td></tr>
        <tr><td><input type="submit" value="确定"/><td><input type="reset" value="重置"/>
    </table>
    <a href="newhome.jsp">返回首页 </a>
</form>

</body>
</html>
