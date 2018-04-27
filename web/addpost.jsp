<%@ page contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ page import="model.PostModel,model.PostModel"%>
<%@ page import="java.util.*" %>
<%@ page import="service.PostService" %>
<%@ page import="tool.TimeUtil" %>

<html>
<head>
    <meta charset="UTF-8">
    <title>Bootstrap 附加导航（Affix）插件</title>
    <link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
    <script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="ckeditor/ckeditor.js"></script>
    <script type="text/javascript">
        CKEDITOR.replace('TextArea1');
    </script>
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


<body data-spy="scroll" data-target="#myScrollspy">
<div class="container">
    <div class="jumbotron">
        <h1>Bootstrap Affix</h1>
    </div>
    <div class="row">

        <form action="addpost?method=2" method="post">
            <div class="input-group" style="padding: 20px">
                <input type="text" class="form-control" name="Title">
                <span class="input-group-addon">请输入标题</span>
            </div>
            <div align="left" class="col-xs-12" >
                <select name="PostType" class="inputinput" style="height:30px;width: 100px">
                    <option value="select">主题
                    </option>
                    <option value ="saab">前瞻爆料</option>
                    <option value="opel">攻略</option>
                    <option value="audi">职业百科</option>
                </select>
            </div>
            <br>
            <br>
            <div class="col-xs-12">
                <textarea id="TextArea1" cols="20" rows="2" class="ckeditor" name="PostContent"></textarea>
            </div>

            <div class="col-xs-3" style="padding: 20px;">
                <input type="submit" value="发表帖子" />
            </div>
            <div align="center">
                <input name="phTime" type="text" class="inputinput"
                       value="<%=TimeUtil.currentlyTime()%>" size="30"
                       readonly="readonly" onclick="alert('此文本框已设为只读，用户不能修改')">
            </div>
        </form>
    </div>
</div>
</body>
</html>
