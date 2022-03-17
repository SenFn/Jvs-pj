package com.mycompany.controller;

import com.mycompany.config.AppConfig;
import com.mycompany.entity.HoaDon;
import com.mycompany.entity.KhachHang;
//import com.mycompany.entity.NguoiDung;
import com.mycompany.service.KhachHangService;
//import com.mycompany.service.NguoiDungService;
import java.util.List;
import java.util.Properties;
import java.util.logging.Logger;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.StringTrimmerEditor;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.provisioning.UserDetailsManager;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mycompany.user.CrmUser;
import java.util.HashMap;
import java.util.Map;
import javax.mail.internet.MimeMessage;
import org.apache.velocity.app.VelocityEngine;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.ui.velocity.VelocityEngineUtils;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/register")
public class RegistrationController {

    @Autowired
    private JavaMailSender mailSender;
    @Autowired
    private VelocityEngine velocityEngine;

    @Autowired
    private KhachHangService khachHangService;
    @Autowired
    private UserDetailsManager userDetailsManager;

    private PasswordEncoder passwordEncoder = new BCryptPasswordEncoder();

    private Logger logger = Logger.getLogger(getClass().getName());
//--------------------------------------------------------------------------------------------------------------------------

    @InitBinder
    public void initBinder(WebDataBinder dataBinder) {

        StringTrimmerEditor stringTrimmerEditor = new StringTrimmerEditor(true);

        dataBinder.registerCustomEditor(String.class, stringTrimmerEditor);
    }
//--------------------------------------------------------------------------------------------------------------------------

    @GetMapping("/showRegistrationForm")
    public String showMyLoginPage(Model theModel) {
        KhachHang khachhang = new KhachHang();
        theModel.addAttribute("khachhang", khachhang);
        theModel.addAttribute("crmUser", new CrmUser());

        return "registration-form";

    }
//--------------------------------------------------------------------------------------------------------------------------

    @PostMapping("/processRegistrationForm")
    public String processRegistrationForm(
            @Valid @ModelAttribute("crmUser") CrmUser theCrmUser, BindingResult theBindingResult,
            @Valid @ModelAttribute("khachhang") KhachHang khachHang, Errors errors,
            
            Model theModel) {

        String userName = theCrmUser.getUserName();

        logger.info("Processing registration form for: " + userName);

        // form validation
        if (theBindingResult.hasErrors()) {

            theModel.addAttribute("crmUser", new CrmUser());
            theModel.addAttribute("registrationError", "Tài khoản và mật khẩu không được để trống");
            theModel.addAttribute(userName, this);
            logger.warning("Tài khoản và mật khẩu không được để trống");

            return "registration-form";
        }
     
        if (errors.hasErrors()){
            return "registration-form";
        }
        // check the database if user already exists
        boolean userExists = doesUserExist(userName);

        if (userExists) {
            theModel.addAttribute("crmUser", new CrmUser());
            theModel.addAttribute("registrationError", "User name đã tồn tại vui lòng chọn tên khác.");

            logger.warning("User name đã tồn tại.");

            return "registration-form";
        }
        
     

        //
        // whew ... we passed all of the validation checks!
        // let's get down to business!!!
        //
        // encrypt the password
        String encodedPassword = passwordEncoder.encode(theCrmUser.getPassword());

        // prepend the encoding algorithm id
        encodedPassword = "{bcrypt}" + encodedPassword;

        // give user default role of "employee"
        List<GrantedAuthority> authorities = AuthorityUtils.createAuthorityList("ROLE_EMPLOYEE");

        // create user object (from Spring Security framework)
        User tempUser = new User(userName, encodedPassword, authorities);

        // save user in the database
        userDetailsManager.createUser(tempUser);

        logger.info("Successfully created user: " + userName);
        //  theModel.addAttribute("nguoidung", nguoiDung);
        String name = theCrmUser.getUserName();
        String pass = theCrmUser.getPassword();
        List<HoaDon> hoaDon = null;
        if (khachHang.getMakh() != 0) {
            hoaDon = khachHangService.getHoaDons(khachHang.getMakh());
        }
        khachHang.setTenKhachHang(name);
        khachHang.setHoaDons(hoaDon);
        String emailAddress = khachHang.getEmail();
        khachHangService.saveKhachHang(khachHang);
        String status = null;


            final String username = "no.reply.storeservice8479@gmail.com";
            final String password = "sen.hoangnhan";

            Properties props = new Properties();
            props.put("mail.smtp.host", "smtp.gmail.com");
            props.put("mail.smtp.port", "465");
            props.put("mail.smtp.auth", "true");
            props.put("mail.smtp.starttls.enable", "true");
            props.put("mail.smtp.starttls.required", "true");
            props.put("mail.smtp.ssl.protocols", "TLSv1.2");
            props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
            Authenticator auth = new Authenticator() {
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication(username, password);
                }
            };

                Session session = Session.getInstance(props, auth);
            try {
                MimeMessage msg = new MimeMessage(session);
                //set message headers
                MimeMessageHelper helper = new MimeMessageHelper(msg, true, "UTF-8");
                helper.setFrom("Administrator");
                helper.setTo(emailAddress);
                helper.setSubject("[Test Mail Service] Register success.");

                Map<String, Object> params = new HashMap<String, Object>();
                params.put("username", name);
                params.put("password", pass);


                String text = VelocityEngineUtils.mergeTemplateIntoString(velocityEngine, "spring/emailRegistration.vm", "UTF-8", params);

                helper.setText(text, true);

                mailSender.send(msg);

                status = "Confirmation email is sent to your address (" + emailAddress + ")";
            } catch (MessagingException e) {
                status = "There was an error in email sending. Please check your email address: " + emailAddress;
            }

//            MimeMessage message = mailSender.createMimeMessage();
//            MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");
//            helper.setFrom("Administrator");
//            helper.setTo(emailAddress);
//            helper.setSubject("[Test Mail Service] Regiser success.");
//
//            Map<String, Object> params = new HashMap<String, Object>();
//            params.put("username", name);
//            params.put("password", pass);
//
//
//            String text = VelocityEngineUtils.mergeTemplateIntoString(velocityEngine, "spring/emailRegistration.vm", "UTF-8", params);
//
//            helper.setText(text, true);
//
//            mailSender.send(message);


        return "registration-confirmation";
    }
//--------------------------------------------------------------------------------------------------------------------------

    private boolean doesUserExist(String userName) {

        logger.info("Checking if user exists: " + userName);

        // check the database if the user already exists
        boolean exists = userDetailsManager.userExists(userName);

        logger.info("User: " + userName + ", exists: " + exists);

        return exists;
    }
   //--------------------------Check Email Esixt In DataBase-------------------------------------------------------------- 
    
  
//------------------------------------------------------------------------------------------------------------------------
    @Autowired
    public void setMailSender(JavaMailSender mailSender) {
        this.mailSender = mailSender;
    }

    @Autowired
    public void setVelocityEngine(VelocityEngine velocityEngine) {
        this.velocityEngine = velocityEngine;
    }
}
//--------------------------------------------------------------------------------------------------------------------------
