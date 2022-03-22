/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.controller;

import com.mycompany.config.AppConfig;
import com.mycompany.dao.KhachHangDao;
import com.mycompany.dao.KhachHangDaoImpl;
import com.mycompany.entity.*;
//import com.mycompany.service.ChiTietHoaDonService;
import com.mycompany.service.*;
//import com.mycompany.service.NguoiDungService;
import com.sun.org.apache.bcel.internal.generic.AALOAD;
import com.sun.org.apache.xerces.internal.impl.dv.util.Base64;
import java.sql.Blob;
import java.sql.SQLException;
import java.util.List;
import javax.servlet.http.Cookie;
import javax.sql.rowset.serial.SerialBlob;

import org.ehcache.Cache;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.WebAuthenticationDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author s3n
 */
@Controller
public class HomeController {

    @Autowired
    private SanPhamService sanPhamService;
    @Autowired
    private ThongTinSanPhamService thongTinSanPhamService;
    @Autowired
    private HoaDonService hoaDonService;
    @Autowired
    private GioHangService gioHangService;
    @Autowired
    private KhachHangService khachHangService;
    @Autowired
    private GioHangService gioHangService1;
    @Autowired
    private SanPhamTrongGioHangService sanPhamTrongGioHangService;
//--------------------------------------------------------------------------------------------------------------------------

    @GetMapping(value={ "/", "/index" , "/index.jsp", "/homeUser"})
    public String Home(Model model) throws SQLException {
        //get list sanpham
        List<SanPham> sanPham = sanPhamService.getSanPhams();
        model.addAttribute("sanphams", sanPham);

        //check is user or anony
        String name = DumpService.getUserName();
        int id = -1;
        if(DumpService.isAnony()){
            name = "0";
        }

        model.addAttribute("tennguoidung", name);
        GioHang gioHang = null;
        String sessionID = DumpService.getSessionID();
        if(sessionID == null){
            return "index";
        }else {
            gioHang = DumpService.getCacheBySessionID(sessionID).giohang;
        }

        model.addAttribute("giohang", gioHang);
        // trả về số lượng sản phẩm
        int soluongsanpham = gioHang != null?gioHang.getSanPhamTrongGioHangs().size():0;

        model.addAttribute("soluongsanpham", soluongsanpham);
        return "index";
    }
//--------------------------------------------------------------------------------------------------------------------------    

    @GetMapping("/homethanhtoan")
    public String HomeThanhToan(Model model) throws SQLException {
//        //tao gio hang khi khoi dong trang
//        List<SanPham> sanPham = sanPhamService.getSanPhams();
//        model.addAttribute("sanphams", sanPham);
//
//        GioHang gioHang = new GioHang();
//        GioHang gioHang1 = gioHangService.saveGioHang(gioHang);
//        int giohangId = gioHang1.getMaghh();
//        model.addAttribute("giohang", gioHang1);
//        model.addAttribute("giohangId", giohangId);
//        // trả về số lượng sản phẩm
//        int soluongsanpham = sanPhamTrongGioHangService.countGioHang(giohangId);
//        model.addAttribute("soluongsanpham", soluongsanpham);
//        model.addAttribute("tennguoidung", name);

        DumpService.CleanCacheUser(DumpService.getSessionID());
        return Home(model);
    }
    
//--------------------------------------------------------------------------------------------------------------------------

    @GetMapping("/homeback")
    public String HomeBack(Model model) throws SQLException {
        return Home(model);
    }
//--------------------------------------------------------------------------------------------------------------------------

//    @GetMapping("/homeUser")
//    public String HomeUser(Model model) throws SQLException {
//        //tao gio hang khi khoi dong trang
//        List<SanPham> sanPham = sanPhamService.getSanPhams();
//        model.addAttribute("sanphams", sanPham);
//        GioHang gioHang = new GioHang();
//        GioHang gioHang1 = gioHangService.saveGioHang(gioHang);
//        int giohangId = gioHang1.getMaghh();
//        model.addAttribute("giohang", gioHang1);
//        model.addAttribute("giohangId", giohangId);
//        // trả về số lượng sản phẩm
//        int soluongsanpham = sanPhamTrongGioHangService.countGioHang(giohangId);
//        //trả về tên người dùng đã đăng nhập vào hệ thống
//        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
//        String name = auth.getName();
//        if(auth instanceof AnonymousAuthenticationToken)
//            name = "0";
//
//        model.addAttribute("tennguoidung", name);
//        model.addAttribute("soluongsanpham", soluongsanpham);
//         return "index";
//    }
//--------------------------------------------------------------------------------------------------------------------------

    @GetMapping("/lienhe")
    public String kh() {
        return "lienhe";
    }

    @GetMapping("/gioithieu")
    public String gth() {
        return "gioithieu";
    }
//    
//--------------------------------------------------------------------------------------------------------------------------

    @GetMapping("/homeadmin")
    public String showHomePage() {
        return "homeadmin";
    }
//--------------------------------------------------------------------------------------------------------------------------

    @GetMapping("/search")
    public String searchPersons(@RequestParam("theSearchName") String theSearchName,
                                    Model theModel) {
        List<SanPham> sanPham = sanPhamService.searchSanPhams(theSearchName);
        theModel.addAttribute("sanphams", sanPham);
     //   int soluongsanpham = sanPhamTrongGioHangService.countGioHang(giohangId);
    //    theModel.addAttribute("soluongsanpham", soluongsanpham);
       // theModel.addAttribute("giohangId", giohangId);
       // theModel.addAttribute("tennguoidung", name);
        return "index";
    }
}
//--------------------------------------------------------------------------------------------------------------------------
