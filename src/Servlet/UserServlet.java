package Servlet;

import model.UserModel;
import service.UserService;



import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLDecoder;
import java.util.List;

/**
 * Created by xyz in WebDemos on 2017/12/13 .
 */
public class UserServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
        resp.setHeader("content-type", "text/html;charset=UTF-8");
        resp.setCharacterEncoding("UTF-8");
        req.setCharacterEncoding("UTF-8");
    }

    private String formatStr(String str) {
        return str == null ? "" : str;
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setHeader("content-type", "text/html;charset=UTF-8");
        resp.setCharacterEncoding("UTF-8");
        req.setCharacterEncoding("UTF-8");
        int method = Integer.parseInt(req.getParameter("method"));
        switch (method) {

            case 1:
                this.queryUser(req, resp);
                break;
            case 2:
                this.addUser(req, resp);
                break;
            case 3:
                this.deleteUser(req, resp);
                break;
            case 4:
                this.updateUser(req, resp);
//            case 5:
//                this.loginUser(req, resp);
            default:
        }

    }

    private void queryUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        UserModel userModel = new UserModel();
//        postModel.setPostID(Integer.valueOf(request.getParameter("id")));
        int Id = Integer.valueOf(request.getParameter("id"));
        UserService userService =new UserService();

//        userService.queryUser(id);
//        if( userService.queryUser(id)!=null){
//
//            out.print("<script language=javascript>alert('查询成功！');window.location.href='postdetails.jsp';</script>");
//        }
    }

    public void addUser(HttpServletRequest request,
                        HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=utf-8");
        PrintWriter out = response.getWriter();

        UserModel userModel =new UserModel();
        userModel.setUserName(URLDecoder.decode(request.getParameter("UserName"),"utf-8"));
        userModel.setPassword(request.getParameter("Password"));
        userModel.setRealName(request.getParameter("RealName"));
        userModel.setSex(Integer.valueOf(request.getParameter("Sex")));
        userModel.setAddress(request.getParameter("Address"));
        userModel.setHeadImageAddress(request.getParameter("HeadImageAddress"));
        userModel.setInterets(request.getParameter("Interets"));
        userModel.setLevel(request.getParameter("Level"));
        userModel.setQQNumber(request.getParameter("QQNumber"));
        UserService userService = new UserService();
        if (userService.AddUser(userModel)) {
            out.print("<script language=javascript>alert('注册成功！');window.location.href='newhome.jsp';</script>");
        } else {
            out.print("<script language=javascript>alert('注册失败！');history.go(-1);</script>");
        }

    }

    public void deleteUser(HttpServletRequest request,
                           HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=utf-8");
        PrintWriter out = response.getWriter();
        UserModel userModel=new UserModel();
        userModel.setId(Integer.valueOf(request.getParameter("id")));
        UserService userService =new UserService();
        if (userService.DeleteUser(userModel)) {
            out.print("<script language=javascript>alert('删除成功！');window.location.href='listUser.jsp';</script>");
        } else {
            out.print("<script language=javascript>alert('删除失败！');history.go(-1);</script>");
        }

    }


    public void updateUser(HttpServletRequest request,
                           HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=utf-8");
        PrintWriter out = response.getWriter();
        UserModel userModel =new UserModel();
        userModel.setUserName(request.getParameter("UserName"));
        userModel.setPassword(request.getParameter("Password"));
        userModel.setRealName(request.getParameter("RealName"));
        userModel.setSex(Integer.valueOf(request.getParameter("Sex")));
        userModel.setAddress(request.getParameter("Address"));
        userModel.setHeadImageAddress(request.getParameter("HeadImageAddress"));
        userModel.setInterets(request.getParameter("Interests"));
        userModel.setQQNumber(request.getParameter("QQNumber"));
        userModel.setId(Integer.valueOf(request.getParameter("id")));
        UserService userService =new UserService();
        if (userService.UpdateUser(userModel)) {
            out.print("<script language=javascript>alert('修改成功！');window.location.href='newhome.jsp';</script>");
        } else {
            out.print("<script language=javascript>alert('修改失败！');history.go(-1);</script>");
        }

    }

}
