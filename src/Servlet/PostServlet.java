package Servlet;

import model.PostModel;
import service.PostService;



import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

/**
 * Created by xyz in WebDemos on 2017/12/13 .
 */
public class PostServlet extends HttpServlet {

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
                this.queryPost(req, resp);
                break;
            case 2:
                this.addPost(req, resp);

                break;
            case 3:
                this.deletePost(req, resp);
                break;
//            case 4:
//                this.updatePost(req, resp);
            default:
        }

    }

    private void queryPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        int Id = Integer.valueOf(request.getParameter("id"));
        PostService postService = new PostService();
        postService.queryPost(Id);
          if( postService.queryPost(Id)!=null){
              out.print("<script language=javascript>alert('查询成功！');window.location.href='postdetails.jsp';</script>");
          }
    }

    public void addPost(HttpServletRequest request,
                           HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=utf-8");
        PrintWriter out = response.getWriter();
        PostModel postModel =new PostModel();
        postModel.setTitle(request.getParameter("Title"));
        postModel.setPostContent(request.getParameter("PostContent"));
        postModel.setPostTime(request.getParameter("PostTime"));
        postModel.setPostType(request.getParameter("PostType"));
        postModel.setPostUserName(request.getParameter("PostUserName"));
        PostService postService =new PostService();
        if (postService.AddPost(postModel)) {

            out.print("<script language=javascript>alert('添加帖子成功！');window.location.href='official.jsp';</script>");
        } else {
            out.print("<script language=javascript>alert('添加帖子失败！');history.go(-1);</script>");
        }

    }

    public void deletePost(HttpServletRequest request,
                        HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=utf-8");
        PrintWriter out = response.getWriter();
        PostModel postModel =new PostModel();
        postModel.setPostID(Integer.valueOf(request.getParameter("id")));
        PostService postService =new PostService();
        if (postService.DeletePost(postModel)) {
            out.print("<script language=javascript>alert('删除成功！');window.location.href='official.jsp';</script>");
        } else {
            out.print("<script language=javascript>alert('删除失败！');history.go(-1);</script>");
        }

    }


//    public void updatePost(HttpServletRequest request,
//                           HttpServletResponse response) throws ServletException, IOException {
//        response.setContentType("text/html;charset=utf-8");
//        PrintWriter out = response.getWriter();
//        PostModel postModel =new PostModel();
////        postModel.setSumReply(Integer.valueOf("SumReply"));
//        postModel.setPostID(Integer.valueOf(request.getParameter("PostID")));
//        System.out.println(666);
//        PostService postService =new PostService();
//        if (postService.UpdatePost(postModel)) {
//            out.print("<script language=javascript>alert('修改成功！');window.location.href='official.jsp';</script>");
//        } else {
//            out.print("<script language=javascript>alert('修改失败！');history.go(-1);</script>");
//        }
//    }
}
