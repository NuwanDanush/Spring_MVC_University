package dao;

import bean.registerLecBean;
import org.springframework.jdbc.core.JdbcTemplate;

public class RegisterLecDao {
    private JdbcTemplate template;

    public void setTemplate(JdbcTemplate template){
        this.template = template;
    }

    public int registerLec(registerLecBean regLec) {
        String sql="insert into lecturer(fname, lname, email, phone, password, lecturer_id, roll, photo) values('"+regLec.getFname()+"','"+regLec.getLname()+"','"+regLec.getEmail()+"','"+regLec.getPhone()+"', '"+regLec.getPassword()+"', '"+regLec.getId()+"' ,'"+regLec.getRoll()+"', '"+regLec.getPhoto()+"')";
        System.out.println("sssssssssss" +template.update(sql));
        return template.update(sql);
    }


}
