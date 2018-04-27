<%@ page import="service.UserService" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    String method = request.getParameter("method");

    if(method.equals("1")){
        String password=request.getParameter("Password");
        String username = new String(request.getParameter("UserName").getBytes("iso-8859-1"), "utf-8");
        UserService userService =new UserService();
        if(userService.LoginUser(username)!=null){
            String p=userService.LoginUser(username).getPassword();
            if(p.equals(password)) {
                int userid=userService.LoginUser(username).getId();
                session.setAttribute("id",userid);
                session.setAttribute("UserName",username);
                response.sendRedirect("newhome.jsp");
            } else {
                out.print("<script language=javascript>alert('密码不正确！');window.location.href='newlogin.jsp';</script>");
            }
        }else {
            out.print("<script language=javascript>alert('用户不存在！');window.location.href='newlogin.jsp';</script>");
        }
    }else if(method.equals("2")){
        session.invalidate();
        response.sendRedirect("newhome.jsp");
    }
%>
</body>
</html>
