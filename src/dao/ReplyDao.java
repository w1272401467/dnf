package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


import model.ReplyModel;


public interface ReplyDao{


    /**
     * @return 布尔类型，如果操作成功，则返回true，否则false
     * @see ReplyModel
     */
    public boolean addReply(ReplyModel replyModel);

    //
    public boolean deleteReply(ReplyModel replyModel);

    /**
     * @return 所选类型的所有文章对象的列表，如果typeId为null，则返回所有文章。
     * @see
     */
//    public List<ReplyModel> queryReply();
    /**
     * 根据某个id值，找到特定某篇文章。
     *
     * @param
     * @return 某篇文章，对应一个PostModel对象
     * @see ReplyModel
     */
//    public List<ReplyModel> queryReply(int PostID);
    public ReplyModel queryReply(int ID);
}
