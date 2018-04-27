package model;



public class UserModel {
    private int id;
    private String UserName;
    private String Password;
    private String RealName;
    private int Sex;
    private String Address;
    private String HeadImageAddress;
    private String Interets;
    private String Level;
    private String QQNumber;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUserName() {
        return UserName;
    }

    public void setUserName(String userName) {
        UserName = userName;
    }

    public String getPassword() {
        return Password;
    }

    public void setPassword(String password) {
        Password = password;
    }

    public String getRealName() {
        return RealName;
    }

    public void setRealName(String realName) {
        RealName = realName;
    }

    public int getSex() {
        return Sex;
    }

    public void setSex(int sex) {
        Sex = sex;
    }

    public String getAddress() {
        return Address;
    }

    public void setAddress(String address) {
        Address = address;
    }

    public String getHeadImageAddress() {
        return HeadImageAddress;
    }

    public void setHeadImageAddress(String headImageAddress) {
        HeadImageAddress = headImageAddress;
    }

    public String getInterets() {
        return Interets;
    }

    public void setInterets(String interets) {
        Interets = interets;
    }

    public String getLevel() {
        return Level;
    }

    public void setLevel(String level) {
        Level = level;
    }

    public String getQQNumber() {
        return QQNumber;
    }

    public void setQQNumber(String QQNumber) {
        this.QQNumber = QQNumber;
    }
}
