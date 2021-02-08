package controller;

import bean.AddAssignmentBean;
import bean.AddSubjectBean;
import dao.SubjectDao;
import org.apache.commons.codec.binary.Base64;
import org.apache.commons.codec.binary.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.io.PrintWriter;
import java.util.List;

@Controller

public class SubjectController {
    @Autowired
    SubjectDao subjectDao;

    @GetMapping("/lecViewAssList")   // lecturer view assignment list
    public String lecViewAssList(HttpSession session, Model model){
        String url = null;
        try {
            String lecID = (String) session.getAttribute("user_id");
            List<AddAssignmentBean> list = subjectDao.lecGetAssignment(lecID);
            if (list != null){
                model.addAttribute("flag", "Lecturer");
                model.addAttribute("assignmentList", list);
                url= ("viewAssList");
            }

        }catch (Exception e){
            System.out.println(e);
        }
        return url;
    }

    @PostMapping("/submitAssignment")  // Lecturer Add new assignment
    public String submitAssignment(@ModelAttribute ("addAssignment") AddAssignmentBean addAssignmentBean, Model model){
        String url = null;
        try {
            String encode_pdf = this.encodeToString(addAssignmentBean.getQuestion().getBytes()); // pass multipart type pdf to convert base64
//            System.out.println("encode pdf = "+ encode_pdf);
            addAssignmentBean.setEncode_question(encode_pdf); // set again base64 type pdf to bean object
            int result = subjectDao.addAssignment(addAssignmentBean);

            if(result == 1){
                model.addAttribute("responce", "success");
                url = ("addAssignment");
            }
            else {
                System.out.println("Add assignment error !");
            }
        }catch (Exception e){
            System.out.println(e);
        }
        return url;
    }

    public String encodeToString(byte[] pdfByteArray) { //this is base64 pdf encode function
        String encodedString = null;
        try {
            StringBuilder sb = new StringBuilder();
            sb.append("data:application/pdf;base64,");
            sb.append(StringUtils.newStringUtf8(Base64.encodeBase64(pdfByteArray, false)));
            encodedString = sb.toString();
        } catch (Exception e) {
            System.out.println(e);
        }
        return encodedString;
    }

    @GetMapping("/stuViewSubjects") // Student view his all subject details
    public String stuViewSubjects(HttpSession session, Model model){
        String url = null;
        try {
//            String user_id = (String) session.getAttribute("user_id"); // logged student user id
            String reg_year = (String) session.getAttribute("reg_year");
            List<AddSubjectBean> subjects = subjectDao.stuGetSubjects(reg_year);
            if (subjects != null){
                model.addAttribute("subjects", subjects);
                model.addAttribute("flag", "stuViewSubjects");
                url = ("viewSubjectList");
            }
        }catch (Exception e){
            System.out.println(e);
        }
        return url;
    }

    @RequestMapping( value = "/editSubjectDetails/{sub_code}", method = RequestMethod.GET )
    public String editSubjectDetails(@PathVariable String sub_code, Model model) { // get a subject details to edit form
        String url = null;
        try {
            List<AddSubjectBean> result = subjectDao.getOneSubject(sub_code);
            if (result != null) {
                model.addAttribute("userData", result);
                url = "editSubject";
            } else {
                System.out.println("result is null");
                url = "dashboard";
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return url;
    }

    @PostMapping("/updateSubject")
    public String updateSubject(@ModelAttribute("updateSubjectForm") AddSubjectBean subjectData, Model model){  // Admin update subject details
        String url = null;
        try {
            int result = subjectDao.updateSubject(subjectData);
            if (result == 1){
                model.addAttribute("updatedSubject", "true");
                url = ("editSubject");
            }else {
                System.out.println("Update error!");
            }
        }catch (Exception e){
            System.out.println(e);
        }
        return url;
    }

    @GetMapping("/viewSubject")
    public String viewSubject(Model model){ //Admin view all subjects function
        String url = null;
        try {
            List<AddSubjectBean> result = subjectDao.getSubjectDetails();
            if (result != null){
                model.addAttribute("flag", "adminViewAll");
                model.addAttribute("subList", result);
                url = ("viewSubjectList");
            }
        }catch (Exception e){
            System.out.println(e);
        }
        return url;
    }

    @PostMapping( "/CheckSubjectCode" ) // check the subject code is alredy exsist? using ajax
    public void CheckSubjectCode(String sub_code, PrintWriter out) {
        try {
            int result = subjectDao.checkSubjectCode(sub_code);
            System.out.println("result " + result);
            if (result == 1) {
                out.println(1); // return response using out.println
            } else {
                out.println(0);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    @GetMapping("/addSubjectForm")// Load the Add Subject form
    public String addSubjectForm(){
        System.out.println("addSubjectForm works ");
        return "addSubject";
    }

    @GetMapping("/addAssignmentForm")// Load the Add Assignment form
    public String addAssignmentForm(){
        return "addAssignment";
    }

    @PostMapping("/addSubject") // this is subject add function
    public String addSubject(@ModelAttribute ("addSubject") AddSubjectBean addSubject, Model model){
        String url = null;
        try {
            System.out.println(addSubject.getLecturer_id());
            int result = subjectDao.addSubject(addSubject);
            if (result == 1){
                model.addAttribute("added", "success");
                url = ("addSubject");
            }else{
                System.out.println("Subject add error!");
            }
        }catch (Exception e){
            System.out.println(e);
        }
        return url;
    }
}
