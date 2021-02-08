package bean;

import org.springframework.web.multipart.MultipartFile;

public class AddAssignmentBean {
    private String sub_code;
    private String sub_name;
    private String assignment_id;
    private String year;
    private String encode_question;
    private MultipartFile question;

    public String getSub_code() {
        return sub_code;
    }

    public void setSub_code(String sub_code) {
        this.sub_code = sub_code;
    }

    public String getAssignment_id() {
        return assignment_id;
    }

    public void setAssignment_id(String assignment_id) {
        this.assignment_id = assignment_id;
    }

    public String getYear() {
        return year;
    }

    public void setYear(String year) {
        this.year = year;
    }

    public String getEncode_question() {
        return encode_question;
    }

    public void setEncode_question(String encode_question) {
        this.encode_question = encode_question;
    }

    public MultipartFile getQuestion() {
        return question;
    }

    public void setQuestion(MultipartFile question) {
        this.question = question;
    }

    public String getSub_name() {
        return sub_name;
    }

    public void setSub_name(String sub_name) {
        this.sub_name = sub_name;
    }
}
