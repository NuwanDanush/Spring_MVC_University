package dao;

import bean.AddAssignmentBean;
import bean.AddSubjectBean;
import bean.GetUserBean;
import bean.MarksBean;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class SubjectDao {
    private JdbcTemplate template;
    public void setTemplate(JdbcTemplate template) {
        this.template = template;
    }

    public List<GetUserBean> getLecList() { // get lecturer list not assign for a subject
        List<GetUserBean> result = null;
        try {
            String sql = "SELECT user_id FROM user WHERE user_id NOT IN(SELECT user_id FROM user INNER JOIN subject ON user.user_id = subject.lecturer_id) AND user.roll = '2'";
            result = template.query(sql, new RowMapper<GetUserBean>() {
                @Override
                public GetUserBean mapRow(ResultSet rs, int rowNum) throws SQLException {
                    GetUserBean res = new GetUserBean();
                    res.setUser_id(rs.getString("user_id"));
                    return res;
                }
            });
        }catch (Exception e){
            System.out.println(e);
        }
        return result;
    }


    public int addSubject(AddSubjectBean addSubject) { //subject add in to the database
        int result = 0;
        try {
            String sql = "INSERT INTO subject (sub_name, sub_code, year, lecturer_id) VALUES ('"+addSubject.getSub_name()+"', '"+addSubject.getSub_code()+"', '"+addSubject.getYear()+"', '"+addSubject.getLecturer_id()+"')";
            result = template.update(sql);
        }catch (Exception e){
            System.out.println(e);
        }
        return result;
    }

    public int checkSubjectCode(String sub_code) { // check subject id is already exist?
        int res = 0;
        try {
            String sql = "select count(*) from subject where sub_code = ?";
            res = template.queryForObject(sql, new Object[] { sub_code }, Integer.class );

        }catch (Exception e){
            System.out.println(e);
        }
        return res;
    }

    public List<AddSubjectBean> getSubjectDetails() { // get all subject list with details
        List<AddSubjectBean> subList = null;
        try {
            String sql = "SELECT * FROM subject";
            subList = template.query(sql, new RowMapper<AddSubjectBean>() {
                @Override
                public AddSubjectBean mapRow(ResultSet rs, int rowNum) throws SQLException {
                    AddSubjectBean result = new AddSubjectBean();
                    result.setSub_name(rs.getString("sub_name"));
                    result.setSub_code(rs.getString("sub_code"));
                    result.setYear(rs.getString("year"));
                    result.setLecturer_id(rs.getString("lecturer_id"));
                    return result;
                }
            });
        }catch (Exception e){
            System.out.println(e);
        }
        return subList;
    }

    public int updateSubject(AddSubjectBean subjectData) { // Admin update subject details
        int result = 0;
        try {
//            System.out.println("wwwwwww "+ subjectData.getSub_code());
            String sql = "UPDATE subject SET sub_name = '"+subjectData.getSub_name()+"', year = '"+subjectData.getYear()+"', lecturer_id = '"+subjectData.getLecturer_id()+"' WHERE sub_code = '"+subjectData.getSub_code()+"'";
            result = template.update(sql);
        }catch (Exception e){
            System.out.println(e);
        }
        System.out.println("+++++ "+result);
        return result;
    }

    public List<AddSubjectBean> getOneSubject(String sub_code) { // get one subject details for update
        List<AddSubjectBean> result = null;
        try {
            String sql = "SELECT * FROM subject WHERE sub_code = '"+sub_code+"'";
            result = template.query(sql, new RowMapper<AddSubjectBean>() {
                @Override
                public AddSubjectBean mapRow(ResultSet rs, int rowNum) throws SQLException {
                    AddSubjectBean res = new AddSubjectBean();
                    res.setSub_name(rs.getString("sub_name"));
                    res.setSub_code(rs.getString("sub_code"));
                    res.setYear(rs.getString("year"));
                    res.setLecturer_id(rs.getString("lecturer_id"));
                    return res;
                }
            });
        }catch (Exception e){
            System.out.println(e);
        }
        return result;
    }

    public List<AddSubjectBean> stuGetSubjects(String reg_year) { //Student get his all subject list
        List<AddSubjectBean> subjects = null;
        try {
            String sql = "SELECT subject.sub_name, subject.sub_code, subject.lecturer_id FROM subject WHERE subject.year = '"+reg_year+"'";
            subjects = template.query(sql, new RowMapper<AddSubjectBean>() {
                @Override
                public AddSubjectBean mapRow(ResultSet rs, int rowNum) throws SQLException {
                    AddSubjectBean res = new AddSubjectBean();
                    res.setSub_name(rs.getString("sub_name"));
                    res.setSub_code(rs.getString("sub_code"));
                    res.setLecturer_id(rs.getString("lecturer_id"));
                    return res;
                }
            });
        }catch (Exception e){
            System.out.println(e);
        }
        return subjects;
    }

    public int addAssignment(AddAssignmentBean addAssignmentBean) { // Lecturer upload new assignment
        int result = 0;
        try {
            String sql = "INSERT INTO assignment (sub_code, sub_name, assignment_id, question, year) VALUES ('"+addAssignmentBean.getSub_code()+"', '"+addAssignmentBean.getSub_name()+"', '"+addAssignmentBean.getAssignment_id()+"', '"+addAssignmentBean.getEncode_question()+"', '"+addAssignmentBean.getYear()+"')";
            result = template.update(sql);
        }catch (Exception e){
            System.out.println(e);
        }
        return result;
    }

    public List<AddAssignmentBean> lecGetAssignment(String lecID) { // Lecturer get his assignment list
        List<AddAssignmentBean> assignment = null;
        try {
            String sql = "SELECT * FROM assignment INNER JOIN subject ON assignment.sub_code = subject.sub_code WHERE subject.lecturer_id = '"+lecID+"' ";
            assignment = template.query(sql, new RowMapper<AddAssignmentBean>() {
                @Override
                public AddAssignmentBean mapRow(ResultSet rs, int rowNum) throws SQLException {
                    AddAssignmentBean res = new AddAssignmentBean();
                    res.setSub_name(rs.getString("sub_name"));
                    res.setSub_code(rs.getString("sub_code"));
                    res.setAssignment_id(rs.getString("assignment_id"));
                    res.setEncode_question(rs.getString("question"));
                    res.setYear(rs.getString("year"));
                    return res;
                }
            });
        }catch (Exception e){
            System.out.println(e);
        }
        return assignment;
    }

    public List<AddAssignmentBean> stuGetAssignment(String regYear) { // Student get his assignment list
        List<AddAssignmentBean> assignment = null;
        try {
            String sql = "SELECT * FROM assignment WHERE year = '"+regYear+"'";
            assignment = template.query(sql, new RowMapper<AddAssignmentBean>() {
                @Override
                public AddAssignmentBean mapRow(ResultSet rs, int rowNum) throws SQLException {
                    AddAssignmentBean res = new AddAssignmentBean();
                    res.setSub_name(rs.getString("sub_name"));
                    res.setSub_code(rs.getString("sub_code"));
                    res.setAssignment_id(rs.getString("assignment_id"));
                    res.setEncode_question(rs.getString("question"));
                    res.setYear(rs.getString("year"));
                    return res;
                }
            });

        }catch (Exception e){
            System.out.println(e);
        }
        return assignment;
    }

    public List<MarksBean> getStudentList(String lec_id) { // lecturer get his students for add marks
        List<MarksBean> result = null;
        try {
            String sql = "SELECT user.user_id, subject.sub_code FROM user INNER JOIN subject ON user.reg_year = subject.year WHERE subject.lecturer_id = '"+lec_id+"'";
            result = template.query(sql, new RowMapper<MarksBean>() {
                @Override
                public MarksBean mapRow(ResultSet rs, int rowNum) throws SQLException {
                    MarksBean res = new MarksBean();
                    res.setUser_id(rs.getString("user_id"));
                    res.setSub_code(rs.getString("sub_code"));
                    return res;
                }
            });
        }catch (Exception e){
            System.out.println(e);
        }
        return result;
    }

    public int[] submitMarks(List<MarksBean> marks) { // lecturer submit final marks
        System.out.println("+++++ "+ marks.get(0).getMark());
        int[] result = null;
        try {
            String sql = "INSERT INTO marks (user_id, sub_code, mark) VALUES (?, ?, ?)";
            List<Object[]> userRows = new ArrayList<Object[]>();

            for (MarksBean mark : marks) {
                userRows.add(new Object[] {mark.getUser_id(), mark.getSub_code(), mark.getMark()});
            }
            result = template.batchUpdate(sql, userRows);
        }catch (Exception e){
            System.out.println(e);
        }
        return result;
    }

    public String downloadAssignment(String id) { // Student download assignment
        String sql = "SELECT question FROM assignment WHERE assignment_id = '"+id+"'";
        String encodedFile = template.queryForObject(sql,String.class);
        return encodedFile;
    }

    public int CheckLecturerId(String lec_id) { //check the lecturer is already assign for a subject
        int res = 0;
        try {
            String sql = "select count(*) from subject where lecturer_id = ?";
            res = template.queryForObject(sql, new Object[] { lec_id }, Integer.class );
        }catch (Exception e){
            System.out.println(e);
        }
        return res;
    }
}
