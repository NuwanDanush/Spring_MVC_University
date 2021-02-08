package bean;

public class LoginBean {
    private String user_id;
    private String pw;
    private String roll;
    private String reg_year;

    public String getUser_id() {
        return user_id;
    }

    public void setUser_id(String user_id)
    {
        this.user_id = user_id;
    }

    public String getPw() {
        return pw;
    }

    public void setPw(String pw) {
        this.pw = pw;
    }

    public String getRoll() {
        return roll;
    }

    public void setRoll(String roll) {
        this.roll = roll;
    }

    public String getReg_year() {
        return reg_year;
    }

    public void setReg_year(String reg_year) {
        this.reg_year = reg_year;
    }
}
