<%@ page contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ page import="model.PostModel,model.PostModel"%>
<%@ page import="java.util.*" %>
<%@ page import="service.PostService" %>
<%@ page import="model.ReplyModel" %>
<%@ page import="service.ReplyService" %>
<%@ page import="tool.TimeUtil" %>

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
<jsp:useBean id="replyDao" class="dao.impl.ReplyDaoImpl"
             scope="page"></jsp:useBean>
<%
    int id =Integer.valueOf(request.getParameter("id"));
    List<ReplyModel> list =replyDao.queryReply();
%>
<script type="text/javascript">
    function deleteForm(id) {
        if (confirm("确定要删除该类型吗？")) {
            window.location.href = "deletereply?method=2&ID=" + id;
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
            <ul class="nav nav-tabs nav-stacked" data-spy="affix" data-offset-top="125">
                <p>头像:</p>
                <p>用户名:</p>
                <p>发帖数：</p>
            </ul>
        </div>
        <div class="col-xs-9">

            <%
                   PostModel postModel =new PostModel();
                   PostService postService=new PostService();
                   postService.queryPost(id).getTitle();
//                    int index = 0;
            %>

            <p><%=postModel.getPostType()%>&nbsp<%=postService.queryPost(id).getTitle()%></p>
            <p>发布时间：<%=postService.queryPost(id).getPostTime()%></p>
            <p>作者：<%=postService.queryPost(id).getPostUserName()%></p>

            <%--<%--%>
                <%--for(int i=0;i<list.size();i++) {--%>
                    <%--ReplyModel replyModel =list.get(i);--%>
                    <%--if(replyModel.getPostID()==id) {--%>
                        <%--index++;--%>
                    <%--}--%>
                <%--}--%>
            <%--%>--%>

            <p>回复数量：<%=postService.queryPost(id).getSumReply()%></p>
            <hr>
            <textarea style="width: 95%;height: 50%"><%=postService.queryPost(id).getPostContent()%></textarea>
            <p>回复：</p>
            <form action="addreply?method=1&id=<%=id%>" method="post">
                <p></p>
                <p>姓名:</p><input name="ReplyAccount" type="text">
                <textarea style="width: 95%;height: 20%" name="ReplyContent"></textarea>
                <input name="ReplyTime" type="text" class="inputinput"
                       value="<%=TimeUtil.currentlyTime()%>" size="30">
                <input type="submit" value="确定"/>
            </form>

            <%
                for(int i=0;i<list.size();i++){
                    ReplyModel replyModel =list.get(i);
                    if(replyModel.getPostID()==id){
            %>

            <div class="panel panel-default">
                <div class="panel-heading">
                    <%--<h3 class="panel-title">--%>


                        <div class="text-left">回复玩家:<%=replyModel.getReplyAccount()%></div>
                        <div class="text-right"><a href="javascript:deleteForm('<%=replyModel.getID()%>')">删除</a></div>

                    <%--</h3>--%>
                </div>
                <div class="panel-body">
                    <%=replyModel.getReplyContent()%>
                    <div class="text-right">回复时间:<%=replyModel.getReplyTime()%></div>
                </div>
            </div>

                <%--<td><a href="javascript:deleteForm('<%=postModel.getPostID()%>')">删除</a></td>--%>

            <%
                    }
                }
            %>


        </div>


    </div>
</div>
</body>
</html>
