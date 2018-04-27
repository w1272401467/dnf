package model;

public class PostModel {
    private int PostID = -1;

    private String Title = "";

    private String PostContent = "";

    private String PostTime = "";

    private String PostType = "";

    private String PostUserName = "";

    private int PostNameID=-1;

    public int getPostNameID() {
        return PostNameID;
    }

    public void setPostNameID(int postNameID) {
        PostNameID = postNameID;
    }

    private int SumReply = -1;




    public int getPostID() {
        return PostID;
    }

    public void setPostID(int postID) {
        PostID = postID;
    }

    public String getTitle() {
        return Title;
    }

    public void setTitle(String title) {
        Title = title;
    }

    public String getPostContent() {
        return PostContent;
    }

    public void setPostContent(String postContent) {
        PostContent = postContent;
    }

    public String getPostTime() {
        return PostTime;
    }

    public void setPostTime(String postTime) {
        PostTime = postTime;
    }

    public String getPostType() {
        return PostType;
    }

    public void setPostType(String postType) {
        PostType = postType;
    }

    public String getPostUserName() {
        return PostUserName;
    }

    public void setPostUserName(String postUserName) {
        PostUserName = postUserName;
    }

    public int getSumReply() {
        return SumReply;
    }

    public void setSumReply(int sumReply) {
        SumReply = sumReply;
    }
}

