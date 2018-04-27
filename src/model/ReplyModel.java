package model;

import javax.annotation.PostConstruct;

public class ReplyModel {
    private int ID;
    private int PostID;
    private String ReplyAccount;
    private String ReplyContent;
    private String ReplyTime;

    public int getID() {
        return ID;
    }

    public void setID(int ID) {
        this.ID = ID;
    }

    public int getPostID() {
        return PostID;
    }

    public void setPostID(int postID) {
        PostID = postID;
    }

    public String getReplyAccount() {
        return ReplyAccount;
    }

    public void setReplyAccount(String replyAccount) {
        ReplyAccount = replyAccount;
    }

    public String getReplyContent() {
        return ReplyContent;
    }

    public void setReplyContent(String replyContent) {
        ReplyContent = replyContent;
    }

    public String getReplyTime() {
        return ReplyTime;
    }

    public void setReplyTime(String replyTime) {
        ReplyTime = replyTime;
    }
}
