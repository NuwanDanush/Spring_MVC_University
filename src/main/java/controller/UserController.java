package controller;

import bean.GetUserBean;
import dao.GetAllDataDao;
import dao.RegisterLecDao;
import dao.UpdateDao;
import org.apache.commons.codec.binary.Base64;
import org.apache.commons.codec.binary.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import javax.servlet.http.HttpSession;
import java.io.PrintWriter;
import java.util.List;

@Controller
public class UserController {

    @Autowired
    GetAllDataDao getAllDataDao;
    @Autowired
    UpdateDao updateDao;
    @Autowired
    RegisterLecDao registerLecDao;

    @GetMapping("/lecViewStuList")
    public String lecViewStuList(HttpSession session, Model model){ // Lecturer view his student
        String url = null;
        try {
            String user_id = (String) session.getAttribute("user_id"); // Logged lecturer Id get from session
            List<GetUserBean> students = getAllDataDao.lecGetStuList(user_id);
            if (students != null){
                model.addAttribute("flag", "lecViewStuList");
                model.addAttribute("students", students);
                url = ("viewUserList");
            }
        }catch (Exception e){
            System.out.println(e);
        }
        return  url;
    }

    @PostMapping("/searchStu")
    public String searchStu(@ModelAttribute("searchName") GetUserBean name, Model model){ // student search function
        String url = null;
        try {
            System.out.println("search name = "+name.getFname());
            List<GetUserBean> users = getAllDataDao.searchStu(name.getFname());
            System.out.println("user list ==== "+users);
            if (!(users.isEmpty())){
                model.addAttribute("userList",users);
                model.addAttribute("flag", "stuList");
                url= "searchUserList";
            }else {
//                System.out.println("not found ");
                model.addAttribute("searchResult", "not found!");
                model.addAttribute("flag", "stuList");
                url= "searchUserList";
            }

        }catch (Exception e){
            System.out.println(e);
        }
        return url;
    }

    @PostMapping("/searchLec")
    public String searchLec(@ModelAttribute("searchName") GetUserBean name, Model model){ // Lecturer search function
        String url = null;
        try {
            System.out.println("search name = "+name.getFname());
            List<GetUserBean> users = getAllDataDao.searchLec(name.getFname());
            System.out.println("user list ==== "+users);
            if (!(users.isEmpty())){
                model.addAttribute("userList",users);
                model.addAttribute("flag", "lecList");
                url= "searchUserList";
            }else {
//                System.out.println("not found ");
                model.addAttribute("searchResult", "not found!");
                model.addAttribute("flag", "lecList");
                url= "searchUserList";
            }

        }catch (Exception e){
            System.out.println(e);
        }
        return url;
    }

    @GetMapping( "/downloadStuPdf" )
    public ModelAndView downloadStuPdf() { //student list pdf download function
        ModelAndView result = new ModelAndView();
        try {
            List<GetUserBean> sList = getAllDataDao.getAllStudent();
            result = new ModelAndView("pdfView", "userList", sList);
        } catch (Exception e) {
            System.out.println(e);
        }
        return result;
    }

    @GetMapping( "/downloadLecPdf" )
    public ModelAndView downloadLecPdf() { //Lecturer list pdf download function
        ModelAndView result = new ModelAndView();
        try {
            List<GetUserBean> lecList = getAllDataDao.getAllLecturer();
            result = new ModelAndView("pdfView", "userList", lecList);
        } catch (Exception e) {
            System.out.println(e);
        }
        return result;
    }

    @RequestMapping( value = "/editOtherUser/{user_id}", method = RequestMethod.GET )  // edit other user profile data(Admin)
    public String editOtherUser(@PathVariable String user_id, Model model) {
        String url = null;
        try {
            List<GetUserBean> result = getAllDataDao.getAllData(user_id); //get all data and assign it result
            if (result != null) {
                model.addAttribute("userData", result);
                url = "editOtherUser";
            } else {
                System.out.println("result is null");
                url = "dashboard";
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return url;
    }

    @PostMapping( "/updateOtherUser" ) // this function call when update form submit
    public String updateOtherUser(@ModelAttribute( "updateForm" ) GetUserBean updateData, Model model) {
        String url = null;
        try {
            String user_id = updateData.getUser_id();
            System.out.println("user id in controlle " + user_id);
            int result = updateDao.update(updateData, user_id);
            if (result == 1) {
                System.out.println("update succsess!");
                model.addAttribute("response", "Updated!!");
                url = "editOtherUser";
            } else {
                System.out.println("update error!!");
                url = "dashboard";
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return url;
    }


    @RequestMapping( value = "/deleteUser/{user_id}/{roll}", method = RequestMethod.GET ) //user delete function
    public String delete(@PathVariable String user_id, @PathVariable String roll, Model model) {
        String url = null;
        try {
            System.out.println("delete users roll " + roll);
            System.out.println("delete users id " + user_id);
            int result = updateDao.deleteUser(user_id);
            if (result == 1) {
                if (roll.equals("2")) {
                    model.addAttribute("deleteResult", "true");
                    model.addAttribute("flag", "lecList");// if deleted lecturer redirect again lecturer list
                    url = "viewUserList";
                } else if (roll.equals("3")) {
                    model.addAttribute("deleteResult", "true");
                    model.addAttribute("flag", "stuList");// if deleted student redirect again student list
                    url = "viewUserList";
                }

            } else {
                System.out.println("delete error!!");
                return "dashboard";
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return url;
    }

    @GetMapping( "/viewStudent" ) // Admin can view student list
    public String viewStudent(Model model) {
        String url = null;
        try {
            List<GetUserBean> result = getAllDataDao.getAllStudent();
            if (result != null) {
                model.addAttribute("stuList", result);
                model.addAttribute("flag", "stuList");
                url = "viewUserList";
            } else {
                System.out.println("No result!");
                url = "dashboard";
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return url;
    }

    @GetMapping( "/viewLecturer" ) // Admin can view Lecturer list
    public String viewLecturer(Model model) {
        String url = null;
        try {
            List<GetUserBean> result = getAllDataDao.getAllLecturer();
            if (result != null) {
                model.addAttribute("lecList", result);
                model.addAttribute("flag", "lecList");
                url = "viewUserList";
            } else {
                System.out.println("No result!");
                url = "dashboard";
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return url;
    }

    @PostMapping( value = "/updateData" )// this function call when update form submit
    public String updateData(@ModelAttribute( "updateForm" ) GetUserBean updateData, HttpSession session, Model model) {
        String url = null;
        try {
            String user_id = (String) session.getAttribute("user_id");
//            System.out.println("------------------------: " + updateData.getPhoto());

            String encodeImage = this.encodeToString(updateData.getPhoto().getBytes());
            updateData.setEncode_photo(encodeImage); // set base64 String to GetUserBean object
            int result = updateDao.update(updateData, user_id);

            if (result == 1) {
                System.out.println("update succsess!");
                model.addAttribute("response", "Update Successfully!!!");
                url = "editProfile";
            } else {
                System.out.println("update error!!");
                url = "dashboard";
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return url;
    }


    public String encodeToString(byte[] imageByteArray) { //this is base64 image encode function
        String encodedString = null;
        try {
            StringBuilder sb = new StringBuilder();
            sb.append("data:image/png;base64,");
            sb.append(StringUtils.newStringUtf8(Base64.encodeBase64(imageByteArray, false)));
            encodedString = sb.toString();
        } catch (Exception e) {
            System.out.println(e);
        }
        return encodedString;
    }

    @GetMapping( "/editProfile" )
    // if user click edit profile this method is run, return user datails to the editProfile.jsp
    public String editProfile(HttpSession session, Model model) {
        String url = null;
        try {
            String user_id = (String) session.getAttribute("user_id");
            List<GetUserBean> result = getAllDataDao.getAllData(user_id); //get all data and assign it result
            if (result != null) {
//                result.get(0).setPhoto(decodeToImage(result.get(0).getPhoto())); // decode photo get from db and pass frontend
//                System.out.println("Decode photo "+result.get(0).getPhoto());
                model.addAttribute("userData", result);
                url = "editProfile";
            } else {
                System.out.println("no result");
                url = "viewProfile";
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return url;
    }

    @GetMapping( "/viewProfile" ) // this is own profile view function
    public String viewProfile(HttpSession session, Model model) {
        String url = null;
        try {
            String user_id = (String) session.getAttribute("user_id");
            List<GetUserBean> result = getAllDataDao.getAllData(user_id); //get all data and assign it result
            if (result != null) {
//                result.get(0).setPhoto(decodeToImage(result.get(0).getPhoto())); // decode photo get from db and pass frontend
//                System.out.println(" photo in view profile " + result.get(0).getEncode_photo());
                model.addAttribute("userData", result);
                url = "viewProfile";
            } else {
                System.out.println("no result");
                url = "dashboard";
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return url;
    }

    @PostMapping( "/CheckUserId" ) // check the user id is alredy exsist? using ajax
    public void CheckUserId(String id, PrintWriter out) {
        try {
            int result = registerLecDao.checkUserId(id);
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

    @GetMapping( "/dashboard" ) // load dashboard.jsp
    public String viewDashboard() {
        return "dashboard";
    }

    @GetMapping( "/logout" )
    public String logout(HttpSession session) {
        session.invalidate();
        return "login";
    }

    @GetMapping( "/login" ) // load the login.jsp
    public String login() {
        return "login";
    }

    @GetMapping( "/registerLec" )
    public String registerLec(Model model) {
        model.addAttribute("regToken", "Lec"); //If request lecturer register form set token Lec
        return "register";
    }

    @GetMapping( "/registerStu" )
    public String registerStu(Model model) {
        model.addAttribute("regToken", "Stu");  // If request student register form set token Stu
        return "register";
    }

}
