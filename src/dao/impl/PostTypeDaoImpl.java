package dao.impl;

import connection.Database;
import dao.PostTypeDao;
import model.PostTypeModel;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class PostTypeDaoImpl implements PostTypeDao{
    private Connection connection;

    public PostTypeDaoImpl(){

    }

    @Override
    public boolean addPostType(PostTypeModel model) {
        connection=Database.getConnection();
        String sql = "insert into type(TypeName) values (?)";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1,model.getTypeName());

            if (ps.executeUpdate() > 0) {
                return true;
            } else {
                return false;
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        } finally {
            Database.releaseConnection(connection);
        }
    }

    public boolean deletePostType(PostTypeModel model) {
        connection = Database.getConnection();
        String sql = "delete from type where id=?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, model.getID());
            if (ps.executeUpdate() > 0) {
                return true;
            } else {
                return false;
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        } finally {
            Database.releaseConnection(connection);
        }

    }

    public List<PostTypeModel> queryPostType() {
        connection = Database.getConnection();
        List<PostTypeModel> list = new ArrayList<PostTypeModel>();
        PostTypeModel model = null;
        String sql = "select * from type";

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                model = new PostTypeModel();
                model.setID(rs.getInt(1));
                model.setTypeName(rs.getString(2));
                list.add(model);
            }
            return list;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
}
