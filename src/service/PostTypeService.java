package service;

import dao.PostTypeDao;
import dao.impl.PostTypeDaoImpl;

import model.PostTypeModel;


import java.util.List;

public class PostTypeService {
    private PostTypeDao postTypeDao;

    public boolean DeletePostType(PostTypeModel model) {

        postTypeDao = new PostTypeDaoImpl();
        return postTypeDao.deletePostType(model);
    }

    public boolean AddPostType(PostTypeModel model) {
        postTypeDao = new PostTypeDaoImpl();
        return postTypeDao.addPostType(model);
    }
}
