package dao.impl;


import connection.Database;
import dao.ReplyDao;
import model.ReplyModel;
import service.ReplyService;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


public class ReplyDaoImpl implements ReplyDao{
    private Connection connection;

    public ReplyDaoImpl(){

    }
    @Override
    public boolean addReply(ReplyModel replyModel) {
        connection = Database.getConnection();
        String sql = "insert into reply(PostID,ReplyAccount,ReplyContent,ReplyTime) values(?,?,?,?)";
        PreparedStatement ps;
        int rows = 0;
        try {
            ps = connection.prepareStatement(sql);
            int i = 1;
            ps.setInt(i++,replyModel.getID());
           ps.setString(i++,replyModel.getReplyAccount());
           ps.setString(i++,replyModel.getReplyContent());
           ps.setString(i++,replyModel.getReplyTime());
            rows = ps.executeUpdate();
            ps.close();
            return rows > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        } finally {
            Database.releaseConnection(connection);
        }

    }

    public boolean deleteReply(ReplyModel replyModel) {
        connection = Database.getConnection();
        String sqlString = "delete from reply where ID=?";
        PreparedStatement ps = null;
        int rows = 0;

        try {
            ps = connection.prepareStatement(sqlString);
            ps.setInt(1, replyModel.getID());
            rows = ps.executeUpdate();
            return rows > 0;
        } catch (SQLException e) {
            e.printStackTrace();

            return false;
        } finally {
            Database.releaseConnection(connection);
        }

    }







//    public ReplyModel queryReply(int PostID) {
//        ReplyModel replyModel=new ReplyModel();
//        String sql = "select * from reply where PostID=?";
//        connection = Database.getConnection();
//        try {
//            PreparedStatement ps = connection.prepareStatement(sql);
//            ps.setInt(1, PostID);
//            ResultSet rs = ps.executeQuery();
//            rs.next();
//            replyModel=new ReplyModel();
//            replyModel.setID(rs.getInt(1));
//            replyModel.setPostID(rs.getInt(2));
//            replyModel.setReplyAccount(rs.getString(3));
//            replyModel.setReplyContent(rs.getString(4));
//            replyModel.setReplyTime(rs.getString(5));
//
//            return replyModel;
//        } catch (SQLException e) {
//            e.printStackTrace();
//            return null;
//        } finally {
//            Database.releaseConnection(connection);
//        }
//    }



    public List<ReplyModel> queryReply(){
        connection = Database.getConnection();
        PreparedStatement ps = null;
        String sql = "select * from reply";
        try {
            ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            List<ReplyModel> list = getRecords(rs);
            rs.close();

            return list;
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        } finally {

            Database.releaseConnection(connection);
        }
    }

    private List<ReplyModel> getRecords(ResultSet rs) throws SQLException {
        List<ReplyModel> list = new ArrayList<>();

        while (rs.next()) {
            ReplyModel replyModel= new ReplyModel();
            int i = 1;
            replyModel.setID(rs.getInt(i++));
            replyModel.setPostID(rs.getInt(i++));
            replyModel.setReplyAccount(rs.getString(i++));
            replyModel.setReplyContent(rs.getString(i++));
            replyModel.setReplyTime(rs.getString(i++));
            list.add(replyModel);
        }
        return list;
    }

    public ReplyModel queryReply(int ID) {
        ReplyModel replyModel =new ReplyModel();
        String sql = "select * from reply where ID=?";
        connection = Database.getConnection();
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, ID);
            ResultSet rs = ps.executeQuery();
            rs.next();
            replyModel.setID(rs.getInt(1));
            replyModel.setPostID(rs.getInt(2));
            replyModel.setReplyAccount(rs.getString(3));
            replyModel.setReplyContent(rs.getString(4));
            replyModel.setReplyTime(rs.getString(5));
            return replyModel;
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        } finally {
            Database.releaseConnection(connection);
        }
    }

}

