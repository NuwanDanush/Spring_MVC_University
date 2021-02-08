package controller;

import bean.GetUserBean;
import bean.LoginBean;
import dao.LoginDao;
import dao.UpdateDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import javax.servlet.http.HttpSession;

@Controller
public class LoginController {
    @Autowired
    LoginDao loginDao;

    @RequestMapping("/login")
    public String login(@ModelAttribute("loginForm")LoginBean loginBean1, HttpSession session, Model model){
        try {
            String hashPw = RegisterController.getHash(loginBean1.getPw()); // pass string password to hashin function in register controller
            loginBean1.setPw(hashPw); // set hash password to LoginBean type object

            GetUserBean user = new GetUserBean();
            if(loginDao.validate(loginBean1, user)){ // check username and password in db
                session.setAttribute("uRoll", user.getRoll());// create session for identify user roll
                session.setAttribute("user_id",user.getUser_id()); //create session for get logged user details
                session.setAttribute("reg_year", user.getReg_year() ); // create session for get reg_year
                return ("dashboard");
            }else{
                System.out.println("username or password invalid");
                model.addAttribute("loginError", "Invalid User_ID or Password");
                return ("login");
            }
        }catch (Exception e){
            System.out.println(e);
        }
       return null;
    }

}

