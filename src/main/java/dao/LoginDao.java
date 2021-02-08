package dao;

import bean.LoginBean;
import bean.GetUserBean;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;


import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class LoginDao {
    private JdbcTemplate template;

    public void setTemplate(JdbcTemplate template) {
        this.template = template;
    }

    boolean status = false;
    LoginBean loginBean2 = new LoginBean();
    public boolean validate(final LoginBean loginBean1, final GetUserBean user) { // loginBean1 = pass from controller with login form value
        List <LoginBean> result = null;
        try {
            String sql = "SELECT user_id, password, roll, reg_year FROM user WHERE user_id = '"+loginBean1.getUser_id()+"' AND password = '"+loginBean1.getPw()+"'";
            result = template.query(sql, new RowMapper<LoginBean>(){
                @Override
                public LoginBean mapRow(ResultSet res, int rowNum) throws SQLException {
                    loginBean2.setPw(res.getString("password")); // get data from db and set it loginBean2 object
                    loginBean2.setUser_id(res.getString("user_id"));
                    loginBean2.setRoll(res.getString("roll"));
                    loginBean2.setReg_year(res.getString("reg_year"));
                    return loginBean2;
                }
            });
            if (result != null){ // if user name and password already exist in db?
                if (!(loginBean1.getUser_id().equals(loginBean2.getUser_id())) || !(loginBean1.getPw().equals(loginBean2.getPw()))) {
                    System.out.println("if works");
                    status = false; //check the username and password are matching?
                }else{
                    System.out.println("else works"); // if username and password match then user roll set to the user object pass from controller
                    user.setRoll(loginBean2.getRoll());
                    user.setUser_id(loginBean2.getUser_id());
                    user.setReg_year(loginBean2.getReg_year());
                    status = true;
                }
            }
        }catch (Exception e){
            System.out.println(e);
        }
        System.out.println(user.getRoll()+"sssssss"+ result);
        return status;
    }
}
