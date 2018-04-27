package service;

import dao.ReplyDao;
import dao.impl.ReplyDaoImpl;
import model.ReplyModel;

import java.util.List;

public class ReplyService {
    private ReplyDao replyDao;

    public boolean AddReply(ReplyModel model){
        replyDao = new ReplyDaoImpl();
        return replyDao.addReply(model);
    }

    public boolean DeleteReply(ReplyModel model){
        replyDao=new ReplyDaoImpl();
        return  replyDao.deleteReply(model);
    }

    public  ReplyModel queryReply(int ID){
        replyDao =new ReplyDaoImpl();
        return replyDao.queryReply(ID);
    }
}
