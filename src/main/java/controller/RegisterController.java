package controller;

import bean.RegisterBean;
import dao.RegisterLecDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

@Controller
public class RegisterController {
    @Autowired
    RegisterLecDao registerLecDao;

    @PostMapping( "/submit" )
    public String register(@ModelAttribute( "registerForm" ) RegisterBean reg, Model model) {
        try {
            reg.setFname(reg.getFname().trim());
            reg.setLname(reg.getLname().trim());
            reg.setId(reg.getId().trim());

            String hashPw = getHash(reg.getPw()); //string password convert to hash
            reg.setPw(hashPw);                       // set hash password again to regStu object
            int result = registerLecDao.register(reg);    //pass the regStu type object to dao class

            if (result == 1) {
                if (reg.getRoll().equals("2")){
                    System.out.println("success register");
                    model.addAttribute("regToken", "Lec"); // set model attribute for display success message
                    model.addAttribute("response", "successs");
                    return ("register");
                }else if (reg.getRoll().equals("3")){
                    System.out.println("success register");
                    model.addAttribute("regToken", "Stu"); // set model attribute for display success message
                    model.addAttribute("response", "successs");
                    return ("register");
                }

            } else {
                System.out.println("error");
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    public static String getHash(String pw) throws NoSuchAlgorithmException { // password hashing function (MD5)
        String hashpw = null;
        try {
            //This is password hashing method
            String plainText = pw;
            MessageDigest mdAlgorithm = MessageDigest.getInstance("MD5");
            mdAlgorithm.update(plainText.getBytes());

            byte[] digest = mdAlgorithm.digest();
            StringBuffer hexString = new StringBuffer();

            for (int i = 0; i < digest.length; i++) {
                plainText = Integer.toHexString(0xFF & digest[i]);

                if (plainText.length() < 2) {
                    plainText = "0" + plainText;
                }

                hexString.append(plainText);
            }
            hashpw = hexString.toString();

        } catch (Exception ex) {
            System.out.println(ex);
        }
        return hashpw;
    }
}
