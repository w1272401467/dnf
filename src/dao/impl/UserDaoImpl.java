package dao.impl;


import connection.Database;

import dao.UserDao;
import model.UserModel;



import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


public class UserDaoImpl implements UserDao{
    private Connection connection;

    public UserDaoImpl(){

    }
    @Override
    public boolean addUser(UserModel userModel) {
        connection = Database.getConnection();
        String sql = "insert into user(UserName,Password,RealName,Sex,Address,HeadImageAddress,Interests,Level,QQNumber) values(?,?,?,?,?,?,?,?,?)";
        PreparedStatement ps;
        int rows = 0;
        try {
            ps = connection.prepareStatement(sql);
            int i = 1;
           ps.setString(i++,userModel.getUserName());
           ps.setString(i++,userModel.getPassword());
           ps.setString(i++,userModel.getRealName());
           ps.setInt(i++,userModel.getSex());
           ps.setString(i++,userModel.getAddress());
           ps.setString(i++,userModel.getHeadImageAddress());
           ps.setString(i++,userModel.getInterets());
           ps.setString(i++,userModel.getLevel());
           ps.setString(i++,userModel.getQQNumber());
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

    public boolean deleteUser(UserModel userModel) {
        connection = Database.getConnection();
        String sqlString = "delete from user where id=?";
        PreparedStatement ps = null;
        int rows = 0;

        try {

            ps = connection.prepareStatement(sqlString);
            ps.setInt(1, userModel.getId());
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
    public boolean updateUser(UserModel userModel) {
        connection = Database.getConnection();
        String sqlString = "update user set UserName=?,Password=?,RealName=?,Sex=?,Address=?,HeadImageAddress=?,Interests=?,QQNumber=? where id=?";
        PreparedStatement ps;
        int rows = 0;
        try {
            ps = connection.prepareStatement(sqlString.toString());
            int i = 1;
            ps.setString(i++,userModel.getUserName());
            ps.setString(i++,userModel.getPassword());
            ps.setString(i++,userModel.getRealName());
            ps.setInt(i++,userModel.getSex());
            ps.setString(i++,userModel.getAddress());
            ps.setString(i++,userModel.getHeadImageAddress());
            ps.setString(i++,userModel.getInterets());
            ps.setString(i++,userModel.getQQNumber());
            ps.setInt(i++,userModel.getId());
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

    public List<UserModel> queryAllUser(){
        connection = Database.getConnection();
        PreparedStatement ps = null;
        try {
            ps = connection.prepareStatement("select * from user ");
            ResultSet rs = ps.executeQuery();
            List<UserModel> list = getRecords(rs);
            rs.close();

            return list;
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        } finally {

            Database.releaseConnection(connection);
        }
    }



    private List<UserModel> getRecords(ResultSet rs) throws SQLException {
        List<UserModel> list = new ArrayList<>();

        while (rs.next()) {
            UserModel userModel = new UserModel();
            int i = 1;
            userModel.setId(rs.getInt(i++));
            userModel.setUserName(rs.getString(i++));
            userModel.setPassword(rs.getString(i++));
            userModel.setRealName(rs.getString(i++));
            userModel.setSex(rs.getInt(i++));
            userModel.setAddress(rs.getString(i++));
            userModel.setHeadImageAddress(rs.getString(i++));
            userModel.setInterets(rs.getString(i++));
            userModel.setLevel(rs.getString(i++));
            userModel.setQQNumber(rs.getString(i++));
            list.add(userModel);
        }
        return list;
    }

    public UserModel queryUser(int id) {
        UserModel userModel =new UserModel();
        String sql = "select * from user where id=?";
        connection = Database.getConnection();
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            rs.next();
            int i = 2;
            userModel.setUserName(rs.getString(i++));
            userModel.setPassword(rs.getString(i++));
            userModel.setRealName(rs.getString(i++));
            userModel.setSex(rs.getInt(i++));
            userModel.setAddress(rs.getString(i++));
            userModel.setHeadImageAddress(rs.getString(i++));
            userModel.setInterets(rs.getString(i++));
            userModel.setLevel(rs.getString(i++));
            userModel.setQQNumber(rs.getString(i++));
            return userModel;
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        } finally {
            Database.releaseConnection(connection);
        }
    }

    public UserModel loginUser(String UserName) {
        UserModel userModel =new UserModel();
        String sql = "select * from user where UserName=?";
        connection = Database.getConnection();
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1,UserName);
            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                int i = 1;
                userModel.setId(rs.getInt(i++));
                userModel.setUserName(rs.getString(i++));
                userModel.setPassword(rs.getString(i++));

                return userModel;
            }else {
                return null;
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        } finally {
            Database.releaseConnection(connection);
        }
    }


}

