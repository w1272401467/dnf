package dao.impl;


import connection.Database;
import dao.PostDao;
import model.PostModel;
import service.PostService;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


public class PostDaoImpl implements PostDao{
    private Connection connection;

    public PostDaoImpl(){

    }
    @Override
    public boolean addPost(PostModel postModel) {
        connection = Database.getConnection();
        String sql = "insert into post(Title,PostContent,PostTime,PostType,PostUserName) values(?,?,?,?,?)";
        PreparedStatement ps;
        int rows = 0;
        try {
            ps = connection.prepareStatement(sql);
            int i = 1;

            ps.setString(i++, postModel.getTitle());
            ps.setString(i++, postModel.getPostContent());
            ps.setString(i++, postModel.getPostTime());
            ps.setString(i++,postModel.getPostType());
            ps.setString(i++,postModel.getPostUserName());
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

    public boolean deletePost(PostModel postModel) {
        connection = Database.getConnection();
        String sqlString = "delete from post where PostID=?";
        PreparedStatement ps = null;
        int rows = 0;
        try {
            ps = connection.prepareStatement(sqlString);
            ps.setInt(1, postModel.getPostID());
            rows = ps.executeUpdate();
            return rows > 0;
        } catch (SQLException e) {
            e.printStackTrace();

            return false;
        } finally {
            Database.releaseConnection(connection);
        }

    }

    @Override
    public boolean updatePost(PostModel postModel) {
        connection = Database.getConnection();
        String sqlString = "update post set SumReply=SumReply+1 where PostID=?";
        PreparedStatement ps;
        int rows = 0;
        try {
            ps = connection.prepareStatement(sqlString.toString());
            ps.setInt(1,postModel.getPostID());
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

    @Override
    public boolean updatePostminus(PostModel postModel) {
        connection = Database.getConnection();
        String sqlString = "update post set SumReply=SumReply-1 where PostID=?";
        PreparedStatement ps;
        int rows = 0;
        try {
            ps = connection.prepareStatement(sqlString.toString());
            ps.setInt(1,postModel.getPostID());
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



    public List<PostModel> queryAllPosts(){
        connection = Database.getConnection();
        PreparedStatement ps = null;
        try {
            ps = connection.prepareStatement("select * from post order by PostTime DESC ");
            ResultSet rs = ps.executeQuery();
            List<PostModel> list = getRecords(rs);
            rs.close();

            return list;
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        } finally {

            Database.releaseConnection(connection);
        }
    }

    public List<PostModel> queryPostsHeat() {
        connection = Database.getConnection();
        PreparedStatement ps = null;
        try {
            ps = connection.prepareStatement("select * from post order by SumReply desc");
            ResultSet rs = ps.executeQuery();
            List<PostModel> list = getRecords(rs);
            rs.close();
            return list;
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        } finally {
            Database.releaseConnection(connection);
        }
    }

    public List<PostModel> queryPostsType(String  PostType) {
        connection = Database.getConnection();
        PreparedStatement ps = null;
        try {
            PostModel postModel = new PostModel();
            ps = connection.prepareStatement("select * from post where PostType=? order by PostType desc");
            ResultSet rs = ps.executeQuery();
            ps.setString(1,PostType);
            postModel.setPostID(rs.getInt(1));
            postModel.setTitle(rs.getString(2));
            postModel.setPostContent(rs.getString(3));
            postModel.setPostTime(rs.getString(4));
            postModel.setPostType(rs.getString(5));
            postModel.setPostUserName(rs.getString(6));
            postModel.setPostNameID(rs.getInt(7));
            postModel.setSumReply(rs.getInt(8));
            List<PostModel> list = getRecords(rs);
            rs.close();
            return list;
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        } finally {
            Database.releaseConnection(connection);
        }
    }

    private List<PostModel> getRecords(ResultSet rs) throws SQLException {
        List<PostModel> list = new ArrayList<>();

        while (rs.next()) {
            PostModel postModel = new PostModel();
            int i = 1;
            postModel.setPostID(rs.getInt(i++));
            postModel.setTitle(rs.getString(i++));
            postModel.setPostContent(rs.getString(i++));
            postModel.setPostTime(rs.getString(i++));
            postModel.setPostType(rs.getString(i++));
            postModel.setPostUserName(rs.getString(i++));
            postModel.setPostNameID(rs.getInt(i++));
            postModel.setSumReply(rs.getInt(i++));
            list.add(postModel);
        }
        return list;
    }

    public PostModel queryPost(int PostID) {
        PostModel postModel = new PostModel();
        String sql = "select * from post where PostID=?";
        connection = Database.getConnection();
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, PostID);
            ResultSet rs = ps.executeQuery();
            rs.next();
            postModel.setPostID(rs.getInt(1));
            postModel.setTitle(rs.getString(2));
            postModel.setPostContent(rs.getString(3));
            postModel.setPostTime(rs.getString(4));
            postModel.setPostType(rs.getString(5));
            postModel.setPostUserName(rs.getString(6));
            postModel.setPostNameID(rs.getInt(7));
            postModel.setSumReply(rs.getInt(8));
            return postModel;
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        } finally {
            Database.releaseConnection(connection);
        }
    }

}

