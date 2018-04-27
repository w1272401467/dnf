package dao;


import java.util.List;

import model.PostTypeModel;

public interface PostTypeDao {


    public boolean deletePostType(PostTypeModel model);

    public boolean addPostType(PostTypeModel model);

    /**
     * 根据某个id值，找到特定某种文章类型。
     *
     * @param id 文章类型所对应的id值
     * @return 文章类型所对应的字符串
     */
//    public String queryPostTypeName(Integer id);

    /**
     * 返回所有文章类型的列表
     *
     * @return 包含ArticleTypeModel的List
     * @see PostTypeModel
     */
    public List<PostTypeModel> queryPostType();
}