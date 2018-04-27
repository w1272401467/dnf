
<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<html>
<head>
    <title>注册</title>

    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/animate.css">
    <link rel="stylesheet" href="css/registered.css">
    <!-- jQuery -->
    <script src="js/jquery.min.js"></script>
    <!-- Bootstrap -->
    <script src="js/bootstrap.min.js"></script>
    <!-- Placeholder -->
    <script src="js/jquery.placeholder.min.js"></script>
    <!-- Waypoints -->
    <script src="js/jquery.waypoints.min.js"></script>
    <!-- Main JS -->
    <script src="js/main.js"></script>

</head>

<body>

<div class="container">
    <div >

    </div>

    <div class="row">
        <div class="col-md-4 col-md-offset-4">
            <!-- Start Sign In Form -->
            <form action="useradd?method=2" class="regis animate-box" data-animate-effect="fadeIn" method="post">
                <h2>注册</h2>

                <div class="form-group">
                    <label for="username" class="sr-only">用户名</label>
                    <input type="text" class="form-control" id="username" placeholder="用户名" autocomplete="off" name="UserName">
                </div>

                <div class="form-group">
                    <label  class="sr-only">密码</label>
                    <input type="password" class="form-control" placeholder="密码" autocomplete="off" name="Password">
                </div>

                <div class="form-group">
                    <label  class="sr-only">真实姓名</label>
                    <input type="text" class="form-control"  placeholder="真实姓名" autocomplete="off" name="RealName">
                </div>

                <div class="sex">

                        <tr><td>性别:</td><td>
                            <select name="Sex" class="inputinput" style="height:30px;width: 100px">
                                <option value="1">男</option>
                                <option value ="0">女</option>
                            </select>
                        </td></tr>

                </div>
                <br>

                <div class="form-group">
                    <label  class="sr-only">地址</label>
                    <input type="text" class="form-control"  placeholder="地址" autocomplete="off" name="Address">
                </div>

                <div class="form-group">
                    <label  class="sr-only">头像</label>
                    <input type="text" class="form-control"  placeholder="头像" autocomplete="off" name="HeadImageAddress">
                </div>

                <div class="form-group">
                    <label  class="sr-only">兴趣</label>
                    <input type="text" class="form-control" placeholder="兴趣" autocomplete="off" name="Interests">
                </div>

                <div class="form-group">
                    <label  class="sr-only">QQ号</label>
                    <input type="text" class="form-control"  placeholder="QQ号" autocomplete="off" name="QQNumber">
                </div>

                <div class="form-group">
                <tr><td><input type="submit" value="确定" class="btn btn-primary"/><td>    <input type="reset" value="重置" class="btn btn-primary"/>
                </div>
                <a href="newhome.jsp" style="font-size: 20px;color:#2e9ad0;text-decoration: none"  >返回首页 </a>
            </form>
            <!-- END Sign In Form -->

        </div>
    </div>
    <div class="row" style="padding-top: 60px; clear: both;">
        <div class="col-md-12 text-center">
            <p><small>&copy; All Rights Reserved. More Templates <a href="http://dnf.17173.com/" >阿拉德大陆</a> - 2018-01-06 </small></p>
        </div>
    </div>
</div>



</body>
</html>
