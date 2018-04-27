package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.PostModel;
import service.PostService;


public interface PostDao{


    /**
     * @return 布尔类型，如果操作成功，则返回true，否则false
     * @see PostModel
     */
    public boolean addPost(PostModel postModel);

    public boolean updatePost(PostModel postModel);

    public boolean updatePostminus(PostModel postModel);
//
    public boolean deletePost(PostModel postModel);

    /**
     * @return 所选类型的所有文章对象的列表，如果typeId为null，则返回所有文章。
     * @see PostModel
     */
    public List<PostModel> queryAllPosts();
    public List<PostModel> queryPostsHeat();
    public List<PostModel> queryPostsType(String PostType);

    /**
     * 根据某个id值，找到特定某篇文章。
     *
     * @param id 文章id值
     * @return 某篇文章，对应一个PostModel对象
     * @see PostModel
     */
    public PostModel queryPost(int id);

}
