package com.mycompany.controller;

import com.mycompany.entity.HoaDon;
import com.mycompany.entity.KhachHang;
//import com.mycompany.entity.NguoiDung;
import com.mycompany.service.KhachHangService;
//import com.mycompany.service.NguoiDungService;
import com.mycompany.user.CrmUser;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class LoginController {



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

}
//--------------------------------------------------------------------------------------------------------------------------