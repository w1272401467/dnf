<%@ page contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ page import="model.PostModel,model.PostModel"%>
<%@ page import="java.util.*" %>
<%@ page import="model.UserModel" %>

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

<jsp:useBean id="postDao" class="dao.impl.PostDaoImpl"
             scope="page"></jsp:useBean>
<jsp:useBean id="userDao" class="dao.impl.UserDaoImpl"
             scope="page"></jsp:useBean>
<%
//    List<PostModel> myList = postDao.queryAllPosts()
    List<UserModel> List = userDao.queryAllUser();
//    String name =request.getParameter("UserName");
//    out.print(name);

%>
<script type="text/javascript">
    function deleteForm(id) {
        if (confirm("确定要删除该用户信息吗？")) {
            window.location.href = "deleteuser?method=3&id=" + id;
        }
    }

</script>
<body data-spy="scroll" data-target="#myScrollspy">
<div class="container">
    <div class="jumbotron">
        <h1>Bootstrap Affix</h1>
    </div>
    <div class="row">
        <div class="col-xs-3" id="myScrollspy">
            <form action="" method="post">
                <ul class="nav nav-tabs nav-stacked" data-spy="affix" data-offset-top="125">
                    <p>头像:</p>
                    <p>用户名:</p>
                    <p>发帖数：</p>
                </ul>
            </form>
        </div>

        <div class="col-xs-9">
            <%
                for(int i=0;i<List.size();i++){

                    UserModel userModel = (UserModel)List.get(i);
            %>
            <%--<form action="" method="post">--%>
                <p>用户名:<%=userModel.getUserName()%></p>
                <p>真实姓名：<%=userModel.getRealName()%></p>
                <p>性别：<%=userModel.getSex()%></p>
                <p>地址：<%=userModel.getAddress()%></p>
                <p>ID:<%=userModel.getId()%></p>
                <p><a href="javascript:deleteForm('<%=userModel.getId()%>')">删除</a></p>
            <%--</form>--%>

            <hr>

            <%
                }
            %>

        </div>


    </div>
</div>
</body>
</html>
