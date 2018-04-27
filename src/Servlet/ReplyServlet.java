package Servlet;

import model.ReplyModel;
import service.ReplyService;


import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * Created by xyz in WebDemos on 2017/12/13 .
 */
public class ReplyServlet extends HttpServlet {

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
                this.addReply(req, resp);
                break;
            case 2:
                this.deleteReply(req, resp);
                break;
            default:
        }

    }

    public void addReply(HttpServletRequest request,
                        HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=utf-8");
        PrintWriter out = response.getWriter();
        ReplyModel replyModel=new ReplyModel();
        replyModel.setID(Integer.valueOf(request.getParameter("id")));
        replyModel.setReplyAccount(request.getParameter("ReplyAccount"));
        replyModel.setReplyContent(request.getParameter("ReplyContent"));
        replyModel.setReplyTime(request.getParameter("ReplyTime"));
        getServletContext().setAttribute("ID",request.getParameter("id"));
         ReplyService replyService = new ReplyService();
        if (replyService.AddReply(replyModel)) {
            out.print("<script language=javascript>alert('回复成功！');window.location.href='addSumReply.jsp';</script>");
        } else {
            out.print("<script language=javascript>alert('回复失败！');history.go(-1);</script>");
        }

    }

    public void deleteReply(HttpServletRequest request,
                           HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=utf-8");
        PrintWriter out = response.getWriter();
        ReplyModel replyModel =new ReplyModel();

        replyModel.setID(Integer.valueOf(request.getParameter("ID")));


        ReplyService replyService =new ReplyService();
        int Id= replyService.queryReply(Integer.valueOf(request.getParameter("ID"))).getPostID();
        getServletContext().setAttribute("Id",Id);
        if (replyService.DeleteReply(replyModel)) {
            out.print("<script language=javascript>alert('删除成功！');window.location.href='minusSumReply.jsp';</script>");
        } else {
            out.print("<script language=javascript>alert('删除失败！');history.go(-1);</script>");
        }
    }
}
