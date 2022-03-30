package com.mycompany.controller;

import com.mycompany.config.SecurityConfig;
import com.mycompany.entity.HoaDon;
import com.mycompany.entity.KhachHang;
//import com.mycompany.entity.NguoiDung;
import com.mycompany.service.DumpService;
import com.mycompany.service.KhachHangService;
//import com.mycompany.service.NguoiDungService;
import com.mycompany.user.CrmUser;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.security.provisioning.JdbcUserDetailsManager;
import org.springframework.security.provisioning.UserDetailsManager;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
public class LoginController {
    @Autowired
    private KhachHangService khachHangService;

    @Autowired
    private UserDetailsManager userDetailsManager;

//--------------------------------------------------------------------------------------------------------------------------
    @GetMapping("/showMyLoginPage")
    public String showMyLoginPage() {

        return "fancy-login";

    }
//--------------------------------------------------------------------------------------------------------------------------
    @GetMapping("/access-denied")
    public String showAccessDenied(Model model) {
        return "access-denied";
    }

    @GetMapping("/info")
    public String showInfoUser(Model model) {

        //check is user or anony
        String name = DumpService.getUserName();
        int id = -1;
        if(DumpService.isAnony()){
            return "fancy-login";
        }
        KhachHang khGet = khachHangService.getKhachHangByName(name);
        model.addAttribute("username", khGet.getTenKhachHang());
        model.addAttribute("email", khGet.getEmail());
        model.addAttribute("phone", khGet.getSoDienThoaikh());
        return "info";
    }

    @RequestMapping( value = "/saveInfo", method = RequestMethod.POST)
    public String showInfoUserSave(Model model, @RequestParam("name") String name,
                                   @RequestParam("email") String email,
                                   @RequestParam("phone") String phone,
                                   @RequestParam("newpassword") String newpassword,
                                   @RequestParam("newpassword1") String newpassword1) {

        //check is user or anony
        String nameGet = DumpService.getUserName();
        int id = -1;
        if(DumpService.isAnony()){
            return "fancy-login";
        }
        KhachHang khGet = khachHangService.getKhachHangByName(nameGet);
        if(name == null || name == "" || email == null || email == "" || phone == null || phone == ""){
            model.addAttribute("username", khGet.getTenKhachHang());
            model.addAttribute("email", khGet.getEmail());
            model.addAttribute("phone", khGet.getSoDienThoaikh());
            model.addAttribute("save", 1);
            return "info";
        }

        if(newpassword.equals(newpassword1) == false){
            model.addAttribute("username", khGet.getTenKhachHang());
            model.addAttribute("email", khGet.getEmail());
            model.addAttribute("phone", khGet.getSoDienThoaikh());
            model.addAttribute("save", 2);
            return "info";
        }
        khGet.setTenKhachHang(name);
        khGet.setEmail(email);
        khGet.setSoDienThoaikh(phone);

        khachHangService.saveKhachHang(khGet);

        if(newpassword.equals(newpassword1) && newpassword.length() > 1){
            khGet = khachHangService.getKhachHang(khGet.getMakh());

            JdbcUserDetailsManager jdbcUserDetailsManager = new JdbcUserDetailsManager();

            jdbcUserDetailsManager.setDataSource(SecurityConfig.securityDataSource1);
            userDetailsManager = jdbcUserDetailsManager;

            String hash = "{bcrypt}"+BCrypt.hashpw(newpassword, BCrypt.gensalt(10));
            userDetailsManager.changePassword(hash, hash);
        }

        model.addAttribute("username", khGet.getTenKhachHang());
        model.addAttribute("email", khGet.getEmail());
        model.addAttribute("phone", khGet.getSoDienThoaikh());
        model.addAttribute("save", 0);
        return "info";
    }

}
//--------------------------------------------------------------------------------------------------------------------------