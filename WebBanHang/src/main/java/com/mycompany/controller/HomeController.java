/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.controller;

import com.mycompany.entity.GioHang;
import com.mycompany.entity.HoaDon;
import com.mycompany.entity.SanPhamTrongGioHang;
import com.mycompany.entity.KhachHang;
import com.mycompany.entity.SanPham;
//import com.mycompany.service.ChiTietHoaDonService;
import com.mycompany.service.GioHangService;
import com.mycompany.service.HoaDonService;
import com.mycompany.service.KhachHangService;
//import com.mycompany.service.NguoiDungService;
import com.mycompany.service.SanPhamService;
import com.mycompany.service.SanPhamTrongGioHangService;
import com.mycompany.service.ThongTinSanPhamService;
import com.sun.org.apache.bcel.internal.generic.AALOAD;
import com.sun.org.apache.xerces.internal.impl.dv.util.Base64;
import java.sql.Blob;
import java.sql.SQLException;
import java.util.List;
import javax.sql.rowset.serial.SerialBlob;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
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

    @GetMapping(value={ "/", "/index" , "/index"})
    public String Home(Model model) throws SQLException {
        //tao gio hang khi khoi dong trang
        List<SanPham> sanPham = sanPhamService.getSanPhams();
        model.addAttribute("sanphams", sanPham);
        GioHang gioHang = new GioHang();
        GioHang gioHang1 = gioHangService.saveGioHang(gioHang);
        int giohangId = gioHang1.getMaghh();
        model.addAttribute("giohang", gioHang1);
        model.addAttribute("giohangId", giohangId);
        // trả về số lượng sản phẩm
        int soluongsanpham = sanPhamTrongGioHangService.countGioHang(giohangId);
        model.addAttribute("soluongsanpham", soluongsanpham);
        String name = "0";
        model.addAttribute("tennguoidung", name);
        return "index";
    }
//--------------------------------------------------------------------------------------------------------------------------    

    @GetMapping("/homethanhtoan")
    public String HomeThanhToan(Model model, @RequestParam("tennguoidung") String name) throws SQLException {
        //tao gio hang khi khoi dong trang
        List<SanPham> sanPham = sanPhamService.getSanPhams();
        model.addAttribute("sanphams", sanPham);
        GioHang gioHang = new GioHang();
        GioHang gioHang1 = gioHangService.saveGioHang(gioHang);
        int giohangId = gioHang1.getMaghh();
        model.addAttribute("giohang", gioHang1);
        model.addAttribute("giohangId", giohangId);
        // trả về số lượng sản phẩm
        int soluongsanpham = sanPhamTrongGioHangService.countGioHang(giohangId);
        model.addAttribute("soluongsanpham", soluongsanpham);
        model.addAttribute("tennguoidung", name);
        return "index";
    }
    
//--------------------------------------------------------------------------------------------------------------------------

    @GetMapping("/homeback")
    public String HomeBack(Model model, @RequestParam("tennguoidung") String name,
            @RequestParam("giohangId") int giohangId) throws SQLException {
        List<SanPham> sanPham = sanPhamService.getSanPhams();
        model.addAttribute("sanphams", sanPham);
        int soluongsanpham = sanPhamTrongGioHangService.countGioHang(giohangId);
        model.addAttribute("soluongsanpham", soluongsanpham);
        model.addAttribute("giohangId", giohangId);
        model.addAttribute("tennguoidung", name);
        return "index";
    }
//--------------------------------------------------------------------------------------------------------------------------

    @GetMapping("/homeUser")
    public String HomeUser(Model model) throws SQLException {
        //tao gio hang khi khoi dong trang
        List<SanPham> sanPham = sanPhamService.getSanPhams();
        model.addAttribute("sanphams", sanPham);
        GioHang gioHang = new GioHang();
        GioHang gioHang1 = gioHangService.saveGioHang(gioHang);
        int giohangId = gioHang1.getMaghh();
        model.addAttribute("giohang", gioHang1);
        model.addAttribute("giohangId", giohangId);
        // trả về số lượng sản phẩm
        int soluongsanpham = sanPhamTrongGioHangService.countGioHang(giohangId);
        //trả về tên người dùng đã đăng nhập vào hệ thống
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String name = auth.getName();
        model.addAttribute("tennguoidung", name);
        model.addAttribute("soluongsanpham", soluongsanpham);
        return "index";
    }
//--------------------------------------------------------------------------------------------------------------------------

    @GetMapping("/lienhe")
    public String kh() {
        return "lienhe";
    }

    @GetMapping("/gioithieu")
    public String gth() {
        return "lienhe";
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
