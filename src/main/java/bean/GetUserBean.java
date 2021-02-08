package bean;

import org.springframework.web.multipart.MultipartFile;

public class GetUserBean {
    private String fname;
    private String lname;
    private String email;
    private String reg_year;
    private String encode_photo;
    private String phone;
    private String user_id;
    private String password;
    private String roll;
    private MultipartFile photo;

    public GetUserBean() {
    }

    public GetUserBean(String fname, String lname, String email, String reg_year, String encode_photo, String phone, String user_id, String password, String roll, MultipartFile photo) {
        this.fname = fname;
        this.lname = lname;
        this.email = email;
        this.reg_year = reg_year;
        this.encode_photo = encode_photo;
        this.phone = phone;
        this.user_id = user_id;
        this.password = password;
        this.roll = roll;
        this.photo = photo;
    }

    public String getFname() {
        return fname;
    }

    public void setFname(String fname) {
        this.fname = fname;
    }

    public String getLname() {
        return lname;
    }

    public void setLname(String lname) {
        this.lname = lname;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getReg_year() {
        return reg_year;
    }

    public void setReg_year(String reg_year) {
        this.reg_year = reg_year;
    }

    public String getEncode_photo() {
        return encode_photo;
    }

    public void setEncode_photo(String encode_photo) {
        this.encode_photo = encode_photo;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getUser_id() {
        return user_id;
    }

    public void setUser_id(String user_id) {
        this.user_id = user_id;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getRoll() {
        return roll;
    }

    public void setRoll(String roll) {
        this.roll = roll;
    }

    public MultipartFile getPhoto() {
        return photo;
    }

    public void setPhoto(MultipartFile photo) {
        this.photo = photo;
    }
}
