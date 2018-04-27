<%@ page import="model.PostModel" %>
<%@ page import="service.PostService" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/1/7/007
  Time: 23:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    response.setContentType("text/html;charset=utf-8");
    String postid= application.getAttribute("Id").toString();
    int id =Integer.valueOf(postid);
    PostModel postModel =new PostModel();
    postModel.setPostID(id);
    PostService postService =new PostService();
    postService.UpdatePostminus(postModel);
    response.sendRedirect("official.jsp");
%>

</body>
</html>
