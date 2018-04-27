<%@ page import="java.util.List" %>
<%@ page import="model.PostModel" %>
<%@ page import="javafx.geometry.Pos" %><%--
  Created by IntelliJ IDEA.
  User: wu
  Date: 2018/1/6
  Time: 23:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>newhome</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="Content-Style-Type" content="text/css" />
    <link href="css/style.css" rel="stylesheet" type="text/css" />
    <link href="layout.css" rel="stylesheet" type="text/css" />


    <script src="js/jquery-1.4.2.min.js" type="text/javascript"></script>
    <script src="js/jqFancyTransitions.1.7.min.js" type="text/javascript"></script>
    <script src="js/tabs.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(function(){
            $('#slider').jqFancyTransitions({
                effect: 'curtain', // wave, zipper, curtain
                width: 642, // width of panel
                height: 414, // height of panel
                strips: 10, // number of strips
                delay: 5000, // delay between images in ms
                stripDelay: 50, // delay beetwen strips in ms
                position: 'alternate', // top, bottom, alternate, curtain
                direction: 'fountainAlternate', // left, right, alternate, random, fountain, fountainAlternate
                navigation: false, // prev and next navigation buttons
                links: false // show images as links
            });
        })
    </script>
    <!--[if lt IE 7]>
    <link href="ie_style.css" rel="stylesheet" type="text/css" />
    <![endif]-->
</head>
<jsp:useBean id="postDao" class="dao.impl.PostDaoImpl"
             scope="page"></jsp:useBean>

<%
    List<PostModel> list = postDao.queryPostsHeat();
    List<PostModel> mylist = postDao.queryAllPosts();
%>

<body  id="page1">

<div class="newhomebg">
    <%--<img src="images/homebg.jpg">--%>

</div>


<div class="comeon">
    <div class="hezi">
        <div id="main">
            <!-- header -->
            <div id="header">


                <div class="logo">
                </div>
                <div class="wenzi">
                    <h1>DNF论坛 </h1>
                </div>


                <div class="login">
                    <h3>
                        <%
                            if(session.getAttribute("UserName")==null) {
                        %>
                        <a  style="text-decoration: none" href="newlogin.jsp">登录</a>
                        <a  style="text-decoration: none" href="newregistered.jsp">注册</a>
                        <%
                            }else {
                        %>
                            <a>用户:</a>
                            <%=session.getAttribute("UserName")%>
                            <a href="doLogin.jsp?method=2"  style="text-decoration: none">退出</a>
                            <a  style="text-decoration: none" href="personalinfo.jsp">个人中心</a>
                            <a  style="text-decoration: none" href="official.jsp">进入论坛</a>
                        <%
                            }
                        %>

                    </h3>
                </div>

            </div>

            <div class="fenjiexian">

            </div>

            <%

            %>

            <!-- content -->
            <div id="content">
                <!-- .main-box -->
                <div class="main-box">
                    <!-- .slider -->



                    <%--轮播--%>
                    <div id="slider">
                        <img src="images/f3.png" alt="" />
                        <img src="images/baihua.png" alt="" />
                        <img src="images/f4.png" alt="" />
                    </div>

                    <%--轮播结束--%>

                    <!-- .tabs-box -->
                    <div class="tabs-box">
                        <ul class="tabs">
                            <li><a href="#tab1">热门贴</a></li>
                            <li><a href="#tab2">新回复</a></li>
                            <li class="last-item"><a href="#tab3" class="last">精华帖</a></li>
                        </ul>
                        <div class="tab_container">
                            <%
                                for(int i=0;i<1 ;i++){
                                    PostModel postModel =(PostModel)list.get(i);
                            %>
                            <div id="tab1" class="tab_content">
                                <h2>[<%=postModel.getPostType()%>] </h2><br>
                                <h1><%=postModel.getTitle()%></h1><br>
                                <a  href="postdetails.jsp?id=<%=postModel.getPostID()%>">查看详情</a>
                            </div>
                            <%
                                }
                            %>
                            <%
                                for(int i=1;i<2 ;i++){
                                    PostModel postModel =(PostModel)list.get(i);
                            %>
                            <div id="tab2" class="tab_content">
                                <h2>[<%=postModel.getPostType()%>]</h2><br>
                                <h1><%=postModel.getTitle()%></h1><br>
                                <a  href="postdetails.jsp?id=<%=postModel.getPostID()%>">查看详情</a>
                            </div>
                            <%
                                }
                            %>
                            <%
                                for(int i=0;i<1 ;i++){
                                    PostModel postModel =(PostModel)mylist.get(i);
                            %>
                            <div id="tab3" class="tab_content">
                                <h2>[<%=postModel.getPostType()%>]</h2> <br>
                                <h1><%=postModel.getTitle()%></h1><br>
                                <a  href="postdetails.jsp?id=<%=postModel.getPostID()%>">查看详情</a>
                            </div>
                            <%
                                }
                            %>
                        </div>
                    </div>
                    <!-- /.tabs-box -->
                </div>
                <!-- /.main-box -->
                <div class="indent">
                    <div class="wrapper">
                        <div class="col-1">
                            <h3>最新热帖 </h3>
                            <ul class="news">
                                <%
                                        for(int i=0;i<1 ;i++){
                                            PostModel postModel =(PostModel)list.get(i);


                                %>

                                <li>
                                    <span class="date"><b>04</b>jan</span>
                                    <h2><a style="color: red">[<%=postModel.getPostType()%>]</a><%=postModel.getTitle()%> </a></h2>
                                    <h4><%=postModel.getPostContent()%></h4>
                                    <%--<p> 千万别信！为了你的钱包着想。为了你的年套着想！千万别开。这都是狗拖！不是P图就是P图！要相信自己不是欧洲人! </p>--%>
                                    <a href="postdetails.jsp?id=<%=postModel.getPostID()%>" class="txt1"><strong>查看详情</strong></a>
                                </li>
                                <%
                                    }
                                %>
                                <%
                                    for(int i=1;i<2 ;i++){
                                        PostModel postModel =(PostModel)list.get(i);
                                %>
                                <li class="last">
                                    <span class="date"><b>12</b>dec</span>
                                    <h2><a style="color: red">[<%=postModel.getPostType()%>]</a><%=postModel.getTitle()%> </a></h2>
                                    <div class="img-box">
                                        <img src="images/naima.png" alt="" />
                                        <h4><%=postModel.getPostContent()%></h4>
                                    </div>
                                    <a href="postdetails.jsp?id=<%=postModel.getPostID()%>" class="txt1"><strong>查看详情</strong></a>
                                </li>

                                <%
                                    }
                                %>

                            </ul>
                        </div>
                        <div class="col-2">
                            <div class="section indent">
                                <h3 class="alt"><em>January 2018 <a href="#"><img src="images/rss.jpg" alt="" /></a></em>综合区</h3>
                                <dl class="issues">
                                    <%
                                        for(int i=0 ;i<2 ;i++){
                                            PostModel postModel =(PostModel)mylist.get(i);
                                    %>

                                    <dt>[<%=postModel.getPostType()%>]</dt>
                                    <dd>
                                        <p><a href="postdetails.jsp?id=<%=postModel.getPostID()%>"><%=postModel.getTitle()%></a></p>
                                        <em><%=postModel.getPostTime()%></em>
                                    </dd>
                                    <%--<dt>补丁模型</dt>--%>
                                    <%--<dd class="last">--%>
                                        <%--<p><a href="http://bbs.17173.com/thread-10780469-1-1.html">[鬼剑士] 萌你一脸！全职业雪人头套改职业像素头补丁</a></p>--%>
                                        <%--<em>发表于前天14：18</em>--%>
                                    <%--</dd>--%>

                                    <%
                                        }
                                    %>
                                </dl>
                                <div class="wrapper"><a href="official.jsp" class="link1"><b>查看详情</b></a></div>
                            </div>
                            <!-- .box -->

                            <div class="box">
                                <div class="border-top">
                                    <div class="border-right">
                                        <div class="border-bot">
                                            <div class="border-left">
                                                <div class="left-top-corner">
                                                    <div class="right-top-corner">
                                                        <div class="right-bot-corner">
                                                            <div class="left-bot-corner">
                                                                <div class="inner">
                                                                    <h3><a href="http://dnf.gamebbs.qq.com/forum-49-1.html" style="text-decoration: none">客服&BUG反馈 </a></h3>
                                                                    <table class="calendar">
                                                                        <img src="images/jianzong.png" alt="" />
                                                                    </table>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- /.box -->
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div id="footer">
            <div class="container">
                <!-- .nav -->
                <ul class="nav">
                    <li><a href="#">home</a>|</li>
                    <li><a href="#">services</a>|</li>
                    <li><a href="#">products</a>|</li>
                    <li><a href="#">features</a>|</li>
                    <li><a href="#">orders form</a>|</li>
                    <li><a href="#">our equipment</a>|</li>
                    <li><a href="#">contact info</a></li>
                </ul>
                <!-- /.nav -->
                <span>agriculture.co</span> &nbsp;&copy; &nbsp;2010. &nbsp; &nbsp;<a href="#">Privacy Policy</a>
            </div>
        </div>

    </div>

    <!-- footer -->

    <script type="text/javascript">
        var gaJsHost = (("https:" == document.location.protocol) ? "https://ssl." : "http://www.");
        document.write(unescape("%3Cscript src='" + gaJsHost + "google-analytics.com/ga.js' type='text/javascript'%3E%3C/script%3E"));
    </script>
    <script type="text/javascript">
        try {
            var pageTracker = _gat._getTracker("UA-7078796-1");
            pageTracker._trackPageview();
        } catch(err) {}</script>
</div>

</body>
</html>
