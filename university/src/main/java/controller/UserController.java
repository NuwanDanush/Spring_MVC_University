package controller;

import bean.registerLecBean;
//import dao.RegisterLecDao;
//import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

@Controller
public class UserController {

    @Autowired
    RegisterLecDao registerLecDao;

    @PostMapping("/registerLec")
    public String registerLec(@ModelAttribute("registerLecForm") registerLecBean regLec){
        int result = registerLecDao.registerLec(regLec);
        if (result==1){
            System.out.println("success register");
            return ("registerLec");
        }else{
            System.out.println("error");
        }

        return null;
    }

    @GetMapping("/login")
    public String viewLogin() {
        return "login";
    }

    @GetMapping("/dashboard")
    public String viewDashboard() {
        System.out.println("Dashboard api");
        return "dashboard";
    }

    @GetMapping("/registerLec")
    public String viewRegisterLec() {
        return "registerLec";
    }

    @GetMapping("/registerStu")
    public String viewRegisterStu() {
        return "registerStu";
    }
}
