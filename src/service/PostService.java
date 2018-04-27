package service;

import dao.PostDao;
import dao.impl.PostDaoImpl;
import model.PostModel;

import java.util.List;

public class PostService {

    private PostDao postDao;

    public PostModel queryPost(int id){
        postDao= new PostDaoImpl();
        return  postDao.queryPost(id);
    }

    public boolean AddPost(PostModel model) {
        postDao=new PostDaoImpl();
        return postDao.addPost(model);
    }

    public boolean DeletePost(PostModel model) {
        postDao=new PostDaoImpl();
        return postDao.deletePost(model);
    }

    public List<PostModel> queryPostsForType(){
        postDao =new PostDaoImpl();
        return postDao.queryPostsHeat();
    }

    public boolean UpdatePost(PostModel model) {
        postDao =new PostDaoImpl();
        return postDao.updatePost(model);
    }

    public boolean UpdatePostminus(PostModel model){
        postDao =new PostDaoImpl();
        return postDao.updatePostminus(model);
    }
}
