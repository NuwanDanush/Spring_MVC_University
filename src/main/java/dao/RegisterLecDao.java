package dao;

import bean.RegisterBean;
import org.springframework.jdbc.core.JdbcTemplate;

import java.io.PrintWriter;


public class RegisterLecDao {
    private JdbcTemplate template;

    public void setTemplate(JdbcTemplate template){
        this.template = template;
    }

    public  int checkUserId(String id) {
        int res = 0;
        try {
            System.out.println("ajaxxxxx"+ id);
            String sql = "select count(*) from user where user_id = ?";
            res = template.queryForObject(sql, new Object[] { id }, Integer.class );

        }catch (Exception e){
            System.out.println(e);
        }
        System.out.println("hhhhhhh "+res);
        return res;
    }

    public int register(RegisterBean reg) {  // user register function
        int result = 0;
        try {
            String sql="insert into user(fname, lname, reg_year, email, phone, photo, password, user_id, roll) values('"+reg.getFname()+"','"+reg.getLname()+"','"+reg.getYear()+"','"+reg.getEmail()+"','"+reg.getPhone()+"', '"+reg.getPhoto()+"' ,'"+reg.getPw()+"', '"+reg.getId()+"' ,'"+reg.getRoll()+"')";
            result = template.update(sql);
        }catch (Exception e){
            System.out.println(e);
        }
        return result;
    }
}
