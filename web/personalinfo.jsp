<%@ page contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ page import="model.PostModel,model.PostModel"%>
<%@ page import="java.util.*" %>
<%@ page import="model.UserModel" %>
<%@ page import="model.PostTypeModel" %>
<%@ page import="dao.PostTypeDao" %>
<%@ page import="service.UserService" %>

<html>
<head>
    <meta charset="UTF-8">
    <title>Bootstrap 附加导航（Affix）插件</title>
    <link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
    <script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <style>
        /* Custom Styles */
        ul.nav-tabs{
            width: 140px;
            margin-top: 20px;
            border-radius: 4px;
            border: 1px solid #ddd;
            box-shadow: 0 1px 4px rgba(0, 0, 0, 0.067);
        }
        ul.nav-tabs li{
            margin: 0;
            border-top: 1px solid #ddd;
        }
        ul.nav-tabs li:first-child{
            border-top: none;
        }
        ul.nav-tabs li a{
            margin: 0;
            padding: 8px 16px;
            border-radius: 0;
        }
        ul.nav-tabs li.active a, ul.nav-tabs li.active a:hover{
            color: #fff;
            background: #0088cc;
            border: 1px solid #0088cc;
        }
        ul.nav-tabs li:first-child a{
            border-radius: 4px 4px 0 0;
        }
        ul.nav-tabs li:last-child a{
            border-radius: 0 0 4px 4px;
        }
        ul.nav-tabs.affix{
            top: 30px; /* Set the top position of pinned element */
        }
    </style>
</head>

<%--<jsp:useBean id="postDao" class="dao.impl.PostDaoImpl"--%>
             <%--scope="page"></jsp:useBean>--%>
<jsp:useBean id="userDao" class="dao.impl.UserDaoImpl"
             scope="page"></jsp:useBean>
<%
    String Id= session.getAttribute("id").toString();
    int id =Integer.valueOf(Id);
    UserService userService =new UserService();
    System.out.println(id);
%>

<body data-spy="scroll" data-target="#myScrollspy">
<div class="container">
    <div class="jumbotron">
        <h1>Bootstrap Affix</h1>
    </div>
    <div class="row">

        <div class="col-xs-12">


            <table class="table">
                <thead>
                <tr>
                    <th>用户名:<%=userService.queryUser(id).getUserName()%></th>
                </tr>
                <tr>
                    <th>密码:<%=userService.queryUser(id).getPassword()%></th>
                </tr>
                <tr>
                    <th>真实姓名:<%=userService.queryUser(id).getRealName()%></th>
                </tr>
                <tr>
                    <th>性别:<%=userService.queryUser(id).getSex()%></th>
                </tr>
                <tr>
                    <th>地址:<%=userService.queryUser(id).getAddress()%></th>
                </tr>
                <tr>
                    <th>头像<%=userService.queryUser(id).getHeadImageAddress()%></th>
                </tr>
                <tr>
                    <th>兴趣:<%=userService.queryUser(id).getInterets()%></th>
                </tr>
                <tr>
                    <th>级别:<%=userService.queryUser(id).getLevel()%></th>
                </tr>
                <tr>
                    <th>QQ:<%=userService.queryUser(id).getQQNumber()%></th>
                </tr>
                </thead>
            </table>
        </div>


        <a href="updateUserinfo.jsp?id=<%=id%>">修改个人信息</a>

    </div>
</div>
</body>
</html>
