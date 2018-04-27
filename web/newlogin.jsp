
<!DOCTYPE html>

<head>
    <title>登陆</title>
    <%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>


    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/animate.css">
    <link rel="stylesheet" href="css/newlogin.css">
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

<%--<div >--%>

<%--</div>--%>

    <div class="row">

        <div class="col-md-4 col-md-offset-4">
            <!-- Start Sign In Form -->
            <form action="doLogin.jsp?method=1" class="fh5co-form animate-box" data-animate-effect="fadeIn" method="post">
                <h2>登陆</h2>
                <div class="form-group">
                    <label for="username" class="sr-only">用户名</label>
                    <input type="text" class="form-control" id="username" placeholder="Username" autocomplete="off" name="UserName">
                </div>
                <div class="form-group">
                    <label for="password" class="sr-only">Password</label>
                    <input type="password" class="form-control" id="password" placeholder="Password" autocomplete="off" name="Password">
                </div>
                <div class="form-group">
                    <label for="remember"><input type="checkbox" id="remember"> 记住我</label>
                </div>

                <div class="form-group">
                    <input type="submit" value="登陆" class="btn btn-primary">
                    <input type="reset" value="重置" class="btn btn-primary"/>
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


<%
    if(session.getAttribute("UserName")!=null){
        session.invalidate();
    }
%>
</body>
</html>

