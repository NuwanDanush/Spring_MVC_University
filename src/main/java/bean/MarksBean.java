package bean;

public class MarksBean {
    private String user_id;
    private String sub_code;
    private String mark;

    public MarksBean() {
    }

    public MarksBean(String user_id, String sub_code, String mark) {

        this.user_id = user_id;
        this.sub_code = sub_code;
        this.mark = mark;
    }

    public String getUser_id() {
        return user_id;
    }

    public void setUser_id(String user_id) {
        this.user_id = user_id;
    }

    public String getSub_code() {
        return sub_code;
    }

    public void setSub_code(String sub_code) {
        this.sub_code = sub_code;
    }

    public String getMark() {
        return mark;
    }

    public void setMark(String mark) {
        this.mark = mark;
    }
}
