package dao;

import bean.GetUserBean;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class GetAllDataDao {
    private JdbcTemplate template;

    public void setTemplate(JdbcTemplate template) {
        this.template = template;
    }

    public List<GetUserBean> lecGetStuList(String user_id) { //lecturer get all students learn his subject
        List<GetUserBean> students = new ArrayList<>();
        try {
            String sql = "SELECT user.fname, user.lname, user.reg_year, user.email, user.phone, user.user_id FROM user INNER JOIN subject ON user.reg_year = subject.year WHERE subject.lecturer_id = '"+user_id+"'";
            students = template.query(sql, new RowMapper<GetUserBean>() {
                @Override
                public GetUserBean mapRow(ResultSet rs, int rowNum) throws SQLException {
                    GetUserBean user = new GetUserBean();
                    user.setFname(rs.getString("fname"));
                    user.setLname(rs.getString("lname"));
                    user.setReg_year(rs.getString("reg_year"));
                    user.setEmail(rs.getString("email"));
                    user.setPhone(rs.getString("phone"));
                    user.setUser_id(rs.getString("user_id"));
                    return user;
                }
            });
        }catch (Exception e){
            System.out.println(e);
        }
        return students;
    }

    public List<GetUserBean> getAllData(String user_id) {
        List<GetUserBean> result2 = new ArrayList<>();
        try {
//            System.out.println("user_id = "+user_id);
            String sql = "SELECT fname, lname, email, phone, photo, user_id FROM user WHERE user_id = '"+user_id+"'";

            result2 = template.query(sql, new RowMapper<GetUserBean>() {
                @Override
                public GetUserBean mapRow(ResultSet resultSet, int rowNum) throws SQLException {
                    GetUserBean user = new GetUserBean();
                    user.setFname(resultSet.getString("fname"));
                    user.setLname(resultSet.getString("lname"));
                    user.setEmail(resultSet.getString("email"));
                    user.setPhone(resultSet.getString("phone"));
                    user.setEncode_photo(resultSet.getString("photo"));
                    user.setUser_id(resultSet.getString("user_id"));
                    return user;
                }
            });

        }catch (Exception e){
            System.out.println("catch works!! "+e);
        }
       return result2;
    }


    public List<GetUserBean> getAllStudent() { // get all student from db
        List<GetUserBean> stuList = new ArrayList<>();
        try {
            String sql = "SELECT * FROM user WHERE roll = '"+3+"'";
            stuList = template.query(sql, new RowMapper<GetUserBean>() {
                @Override
                public GetUserBean mapRow(ResultSet rs, int rowNum) throws SQLException {
                    GetUserBean studentList = new GetUserBean();
                    studentList.setFname(rs.getString("fname"));
                    studentList.setLname(rs.getString("lname"));
                    studentList.setReg_year(rs.getString("reg_year"));
                    studentList.setEmail(rs.getString("email"));
                    studentList.setPhone(rs.getString("phone"));
                    studentList.setEncode_photo(rs.getString("photo"));
                    studentList.setRoll(rs.getString("roll"));
                    studentList.setUser_id(rs.getString("user_id"));
                    return studentList;
                }
            });
        }catch (Exception e){
                System.out.println(e);}
        return stuList;
    }

    public List<GetUserBean> getAllLecturer() { // get all lecturers from db
        List<GetUserBean> lecList = new ArrayList<>();
        try {
            String sql = "SELECT * FROM user WHERE roll = '"+2+"'";
            lecList = template.query(sql, new RowMapper<GetUserBean>() {
                @Override
                public GetUserBean mapRow(ResultSet rs, int rowNum) throws SQLException {
                    GetUserBean lecList = new GetUserBean();
                    lecList.setFname(rs.getString("fname"));
                    lecList.setLname(rs.getString("lname"));
                    lecList.setEmail(rs.getString("email"));
                    lecList.setPhone(rs.getString("phone"));
                    lecList.setEncode_photo(rs.getString("photo"));
                    lecList.setRoll(rs.getString("roll"));
                    lecList.setUser_id(rs.getString("user_id"));
                    return lecList;
                }
            });
        }catch (Exception e){
            System.out.println(e);}
        return lecList;
    }

    public List<GetUserBean> searchStu(String name) { // Get student search list
        List<GetUserBean> stuList = new ArrayList<>();
        try {
            String sql = "SELECT * FROM user WHERE fname LIKE '%"+name+"%' AND roll = '"+3+"'";
            stuList = template.query(sql, new RowMapper<GetUserBean>() {
                @Override
                public GetUserBean mapRow(ResultSet rs, int rowNum) throws SQLException {
                    GetUserBean data = new GetUserBean();
                    data.setFname(rs.getString("fname"));
                    data.setLname(rs.getString("lname"));
                    data.setReg_year(rs.getString("reg_year"));
                    data.setEmail(rs.getString("email"));
                    data.setPhone(rs.getString("phone"));
                    data.setEncode_photo(rs.getString("photo"));
                    data.setRoll(rs.getString("roll"));
                    data.setUser_id(rs.getString("user_id"));
                    return data;
                }
            });
        }catch (Exception e){
            System.out.println(e);
        }
        return stuList;
    }

    public List<GetUserBean> searchLec(String fname) { // get search lecturer list
        List<GetUserBean> lecList = new ArrayList<>();
        try {
            String sql = "SELECT * FROM user WHERE fname LIKE '%"+fname+"%' AND roll = '"+2+"'";
            lecList = template.query(sql, new RowMapper<GetUserBean>() {
                @Override
                public GetUserBean mapRow(ResultSet rs, int rowNum) throws SQLException {
                    GetUserBean data = new GetUserBean();
                    data.setFname(rs.getString("fname"));
                    data.setLname(rs.getString("lname"));
                    data.setEmail(rs.getString("email"));
                    data.setPhone(rs.getString("phone"));
                    data.setEncode_photo(rs.getString("photo"));
                    data.setRoll(rs.getString("roll"));
                    data.setUser_id(rs.getString("user_id"));
                    return data;
                }
            });
        }catch (Exception e){
            System.out.println(e);
        }
        return lecList;
    }
}
