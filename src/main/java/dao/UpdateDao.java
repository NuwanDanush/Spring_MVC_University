package dao;

import bean.GetUserBean;
import org.springframework.jdbc.core.JdbcTemplate;

public class UpdateDao {
    private JdbcTemplate template;

    public void setTemplate(JdbcTemplate template) {
        this.template = template;
    }


    public int update(GetUserBean updateData, String user_id) {
//        System.out.println("update form data in dao "+updateData + "user id in dao "+user_id );
//        System.out.println("fname in dao "+updateData.getFname() + updateData.getPhoto());
        int result = 0;
        try {
            String sql = "UPDATE user SET fname = '"+updateData.getFname()+"', lname = '"+updateData.getLname()+"', email = '"+updateData.getEmail()+"', phone = '"+updateData.getPhone()+"', photo = '"+updateData.getEncode_photo()+"' WHERE user_id = '"+user_id+"'";
            result = template.update(sql);
        }catch (Exception e){
            System.out.println(e);
        }
        return result;
    }

    public int deleteUser(String user_id) {
        int result = 0;
        try {
            String sql = "DELETE FROM user WHERE user_id = '"+user_id+"'";
            result = template.update(sql);
        }catch (Exception e){
            System.out.println(e);
        }
        return result;
    }
}
