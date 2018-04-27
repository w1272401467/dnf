<%@ page import="model.UserModel" %>
<%@ page import="service.UserService" %>
<%@ page contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
  <title>28952 template preview</title>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <meta http-equiv="Content-Style-Type" content="text/css" />
  <link href="style.css" rel="stylesheet" type="text/css" />
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


<body id="page1">
<div id="main">
  <!-- header -->
  <div id="header">
    <div class="row-1">
      <div class="logo">
        <h1><a href="#">阿拉德论坛</a></h1>
      </div>
      <div class="login">
        <h3>
          <%
                if(session.getAttribute("UserName")==null) {
           %>
            <a  style="text-decoration: none" href="login.jsp">登录</a>
            ||<a  style="text-decoration: none" href="registered.jsp">注册</a>
           <%
                }else {
           %>
                    <a>用户:</a>
                    <%=session.getAttribute("UserName")%>
                    <br>
                    <a href="login.jsp">切换用户</a>
          <%
                }
          %>


        </h3>
      </div>
    </div>
    <div class="row-2">
      <!-- .nav -->
      <ul class="nav">
        <li class="first"><a href="#" class="current">首页</a></li>
        <li><a href="#">官方专区</a></li>
        <li><a href="home.jsp">谈天说地</a></li>
        <li><a href="#">玩家风采</a></li>
        <li><a href="#">最新攻略</a></li>
        <li class="last"><a href="#">职业百科</a></li>
      </ul>
      <!-- /.nav -->
    </div>
  </div>
  <!-- content -->
  <div id="content">
    <!-- .main-box -->
    <div class="main-box">
      <!-- .slider -->
      <div id="slider">
        <img src="images/one.jpg" alt="" />
        <img src="images/two.jpg" alt="" />
        <img src="images/slide3.jpg" alt="" />
      </div>
      <!-- /.slider -->
      <!-- .tabs-box -->
      <div class="tabs-box">
        <ul class="tabs">
          <li><a href="#tab1">热门贴</a></li>
          <li><a href="#tab2">新回复</a></li>
          <li class="last-item"><a href="#tab3" class="last">精华帖</a></li>
        </ul>
        <div class="tab_container">
          <div id="tab1" class="tab_content">
            <h2>
              [西海岸快讯] 【西海岸快讯】阿拉德宿命卡之战、喔喔跑向旺旺年、累积在线得好礼、新年福袋 </h2>
            <a href="#">查看详情</a>
          </div>
          <div id="tab2" class="tab_content">
            <h2>Markets/Weather: April's second-half cooler than first</h2>
            <a href="#">查看详情</a>
          </div>
          <div id="tab3" class="tab_content">
            <h2>CME Group soybean prices explode to the upside</h2>
            <a href="#">查看详情</a>
          </div>
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
            <li>
              <span class="date"><b>25</b>Mar</span>
              <h2><a href="#">Markets/Weather: April's second- half cooler than first</a></h2>
              <h4>Lorem ipsum dolor sit amet consectetuer adipiscing elit malesuada orci</h4>
              <p>Praesent vestibulum molestie lacus. Aenean nonummy hendrerit mauris. Phasellus porta. Fusce suscipit varius mi. Cum sociis natoque penatibus et magnis dis <a href="#">parturient montes</a> nascetur ridiculus mus. Nulla duiusce feugiat malesuada odio.Morbi nunc odio, gravida at cursus nec, luctus a, lorem.ecenas tristique orci ac semuis ultricies pharetra magna. Donec accumsan malesuada orci.</p>
              <a href="#" class="txt1"><strong>查看详情</strong></a>
            </li>
            <li class="last">
              <span class="date"><b>09</b>Apr</span>
              <h2><a href="#">CME Group soybean prices<br /> explode to the upside</a></h2>
              <div class="img-box">
                <img src="images/1page-img1.jpg" alt="" />
                <h4>Vestibulum iaculis laciniaroin dictum elementum vsce euismod consequat anrem ipsum dolor sit amonsectetuer</h4>
                Pellentesque sed dolor. Aliquam congue fermentum nisl. Mauris accumsan nulla vel diam. Sed in lacus ut enim adipiscing aliquet. Nulla venenatis. In pede mi, aliquet sit amet, euismod in, auctor ut ligula. Aliquam dapibus tincidunt metuaesent justo dolor lobortis quis, lobortis dignissim, pulvinar ac, lorem. Vestibulum sed ante. Donec sagittis euismod d ut perspiciatis.
              </div>
              <a href="#" class="txt1"><strong>查看详情</strong></a>
            </li>
          </ul>
        </div>
        <div class="col-2">
          <div class="section indent">
            <h3 class="alt"><em>April 2010 <a href="#"><img src="images/rss.jpg" alt="" /></a></em>综合区</h3>
            <dl class="issues">
              <dt>All markets stories</dt>
              <dd>
                <p><a href="#">Fusce suscipit varius mi. Cum sociis natoque pena tibus et magnascetur ridiculus mus.</a></p>
                <em>by John Becks</em>
              </dd>
              <dt>Grains and oilseeds</dt>
              <dd class="last">
                <p><a href="#">Vestibulum iaculis laciniaroin dictum elementum velusce euismod consequat ante.</a></p>
                <em>by Linda Grey</em>
              </dd>
            </dl>
            <div class="wrapper"><a href="#" class="link1"><b>查看详情</b></a></div>
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
                              <h3><a href="#" style="text-decoration: none">客服&BUG反馈 </a></h3>
                              <table class="calendar">
                                <img src="images/jianzong.jpg" alt="" />
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
<!-- footer -->
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
<script type="text/javascript">
    var gaJsHost = (("https:" == document.location.protocol) ? "https://ssl." : "http://www.");
    document.write(unescape("%3Cscript src='" + gaJsHost + "google-analytics.com/ga.js' type='text/javascript'%3E%3C/script%3E"));
</script>
<script type="text/javascript">
    try {
        var pageTracker = _gat._getTracker("UA-7078796-1");
        pageTracker._trackPageview();
    } catch(err) {}</script>
</body>
</html>
