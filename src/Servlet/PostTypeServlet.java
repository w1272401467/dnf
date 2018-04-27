package Servlet;


import model.PostTypeModel;
import service.PostTypeService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

public class PostTypeServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req,resp);
        resp.setHeader("content-type", "text/html;charset=UTF-8");
        resp.setCharacterEncoding("UTF-8");
        req.setCharacterEncoding("UTF-8");
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setHeader("content-type", "text/html;charset=UTF-8");
        resp.setCharacterEncoding("UTF-8");

        String m = req.getParameter("method");
        if (m == null) {
            return;
        }
        int method = Integer.parseInt(m);
        if (method == 1) {
            this.addPostType(req, resp);
        }
        if (method == 2) {
            this.deletePostType(req, resp);
        }
    }

    // 后台删除文章类别
    public void deletePostType(HttpServletRequest request,
                                  HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        PostTypeModel postTypeModel = new PostTypeModel();
        postTypeModel.setID(Integer.valueOf(request.getParameter("id")));
       PostTypeService postTypeService=new PostTypeService();
        if (postTypeService.DeletePostType(postTypeModel)) {
            out.print("<script language=javascript>alert('删除类别成功！');window.location.href='listType.jsp';</script>");
        } else {
            out.print("<script language=javascript>alert('您需要将类别所在的帖子删除,才可删除此类别！');history.go(-1);</script>");
        }

    }

    // 后台添加文章类别
    public void addPostType(HttpServletRequest request,
                               HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=utf-8");
        PrintWriter out = response.getWriter();
        PostTypeModel postTypeModel =new PostTypeModel();
        postTypeModel.setTypeName(request.getParameter("TypeName"));
        PostTypeService postTypeService=new PostTypeService();
        if (postTypeService.AddPostType(postTypeModel)) {
            out.print("<script language=javascript>alert('添加类别成功！');window.location.href='listType.jsp';</script>");
        } else {
            out.print("<script language=javascript>alert('添加类别失败！');history.go(-1);</script>");
        }

    }
}
