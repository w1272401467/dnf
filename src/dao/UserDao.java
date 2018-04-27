package dao;

import model.UserModel;

import java.util.List;

public interface UserDao {

    /**
     * @return 布尔类型，如果操作成功，则返回true，否则false
     * @see UserModel
     */
    public boolean addUser(UserModel userModel);
    public boolean updateUser(UserModel userModel);
    //
    public boolean deleteUser(UserModel userModel);


    /**
     * @return 所选类型的所有文章对象的列表，如果typeId为null，则返回所有文章。
     * @see UserModel
     */
    public List<UserModel> queryAllUser();
//    public List<ReplyModel> queryPostsForType(String PostType);

    /**
     * 根据某个id值，找到特定某篇文章。
     *
     * @param
     * @return 某篇文章，对应一个PostModel对象
     * @see UserModel
     */
    public UserModel queryUser(int id);
    public UserModel loginUser(String UserName);
}
