package service;

import dao.UserDao;
import dao.impl.UserDaoImpl;
import model.UserModel;

import java.util.List;

public class UserService {
    private UserDao userDao;

    public boolean AddUser(UserModel Model){
        userDao=new UserDaoImpl();
        return userDao.addUser(Model);
    }

    public boolean DeleteUser(UserModel model){
        userDao=new UserDaoImpl();
        return userDao.deleteUser(model);
    }

    public boolean UpdateUser(UserModel model){
        userDao = new UserDaoImpl();
        return userDao.updateUser(model);
    }


    public UserModel queryUser(int id){
        userDao = new UserDaoImpl();
        return userDao.queryUser(id);
    }

    public List<UserModel> queryAllUser(){
        userDao=new UserDaoImpl();
        return userDao.queryAllUser();
    }

    public UserModel LoginUser(String  model){
        userDao=new UserDaoImpl();
        return userDao.loginUser(model);
    }
}
