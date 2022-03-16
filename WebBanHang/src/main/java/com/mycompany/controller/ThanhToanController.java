/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.controller;

import com.mycompany.entity.GiaoHang;
import com.mycompany.entity.GioHang;
import com.mycompany.entity.HoaDon;
import com.mycompany.entity.KhachHang;
import com.mycompany.entity.SanPhamTrongGioHang;
import com.mycompany.service.GiaoHangService;
//import com.mycompany.service.ChiTietHoaDonService;
import com.mycompany.service.GioHangService;
import com.mycompany.service.HoaDonService;
import com.mycompany.service.KhachHangService;
import com.mycompany.service.SanPhamService;
import com.mycompany.service.SanPhamTrongGioHangService;
import com.mycompany.service.ThongTinSanPhamService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author MPH
 */
@Controller
@RequestMapping("/thanhtoan")
public class ThanhToanController {

    @Autowired
    private SanPhamService sanPhamService;
    @Autowired
    private ThongTinSanPhamService thongTinSanPhamService;
    @Autowired
    private HoaDonService hoaDonService;
    //@Autowired
    // private ChiTietHoaDonService chiTietHoaDonService;
    @Autowired
    private GioHangService gioHangService;
    @Autowired
    private GiaoHangService giaoHangService;
    @Autowired
    private KhachHangService khachHangService;
    @Autowired
    private GioHangService gioHangService1;
    @Autowired
    private SanPhamTrongGioHangService sanPhamTrongGioHangService;
//--------------------------------------------------------------------------------------------------------------------------

    @GetMapping("/congsoluong")
    public String showFormForUpdatecong(@RequestParam("sanphamgiohangId") int theId, @RequestParam("tennguoidung") String tendangnhap
          ,  @RequestParam("soluong") int soluong, @RequestParam("giohangId") int giohangId, Model theModel) {
        SanPhamTrongGioHang sanPhamTrongGioHang = gioHangService.getSanPhamTrongGioHang(theId);
        soluong += 1;
        theModel.addAttribute("soluongsp", soluong);
        gioHangService.updateSoLuongSanPham(sanPhamTrongGioHang, soluong);
        theModel.addAttribute("giohangId", giohangId);
          theModel.addAttribute("tennguoidung", tendangnhap);
        return "redirect:/thanhtoan/showFormForAddThanhToan";
    }
//--------------------------------------------------------------------------------------------------------------------------

    @GetMapping("/deleteSanPhamTrongGio")
    public String deleteSanPhamTrongGio(@RequestParam("sanphamgiohangId") int theId,@RequestParam("tennguoidung") String tendangnhap,
            @RequestParam("giohangId") int giohangId, @RequestParam("soluongsp") int soluong, Model theModel) {
        sanPhamTrongGioHangService.deleteSanPhamTrongGioHang(theId);
        theModel.addAttribute("giohangId", giohangId);
         int soluongsanpham = sanPhamTrongGioHangService.countGioHang(giohangId);
        theModel.addAttribute("soluongsp", soluongsanpham);
         theModel.addAttribute("tennguoidung", tendangnhap);
        return "redirect:/giohang/list";
    }
//--------------------------------------------------------------------------------------------------------------------------

    @GetMapping("/trusoluong")
    public String showFormForUpdatetru(@RequestParam("sanphamgiohangId") int theId, @RequestParam("tennguoidung") String tendangnhap,
            @RequestParam("soluong") int soluong, @RequestParam("giohangId") int giohangId, Model theModel) {
        SanPhamTrongGioHang sanPhamTrongGioHang = gioHangService.getSanPhamTrongGioHang(theId);
        soluong -= 1;
        theModel.addAttribute("soluongsp", soluong);
        gioHangService.updateSoLuongSanPham(sanPhamTrongGioHang, soluong);
        theModel.addAttribute("giohangId", giohangId);
          theModel.addAttribute("tennguoidung", tendangnhap);
        return "redirect:/thanhtoan/showFormForAddThanhToan";
    }
//--------------------------------------------------------------------------------------------------------------------------
    @PostMapping("/saveKhachHangCoDangNhap")
    public String saveKhachHangCoDangNhap( @RequestParam("khachhangId") int khachhangId,
            @ModelAttribute("hoadon") HoaDon hoaDon, @ModelAttribute("giaohang") GiaoHang giaoHang,
            @RequestParam("hoadonId") int hoadonId, @RequestParam("giohangId") int giohangId,
            @RequestParam("soluongsp") int soluong, Model theModel,
            @RequestParam("tennguoidung") String tennguoidung) {
                 
            hoaDonService.saveHoaDon(hoaDon, khachhangId);
            hoaDonService.updateGioHangCuaHoaDon(hoadonId, giohangId);
//        // luu giao hang
            giaoHangService.saveGiaoHang(giaoHang, hoadonId);
            
            theModel.addAttribute("tennguoidung", tennguoidung);
            theModel.addAttribute("soluongsp", soluong);
            theModel.addAttribute("giohangId", giohangId);
        
      
        return "redirect:/homethanhtoan";
    }
//--------------------------------------------------------------------------------------------------------------------------

    @PostMapping("/saveKhachHangChuaDangNhap")
    public String saveKhachHang(@ModelAttribute("khachhang") KhachHang khachHang, @RequestParam("khachhangId") int khachhangId,
            @ModelAttribute("hoadon") HoaDon hoaDon, @ModelAttribute("giaohang") GiaoHang giaoHang,
            @RequestParam("hoadonId") int hoadonId, @RequestParam("giohangId") int giohangId,
            @RequestParam("soluongsp") int soluong, Model theModel,
            @RequestParam("tennguoidung") String tennguoidung) {
      
            khachHangService.saveKhachHang(khachHang);
            //GioHang gioHang = gioHangService.getGioHang(theId);

            hoaDonService.saveHoaDon(hoaDon, khachhangId);
            hoaDonService.updateGioHangCuaHoaDon(hoadonId, giohangId);
//        // luu giao hang
            giaoHangService.saveGiaoHang(giaoHang, hoadonId);
//        
            theModel.addAttribute("soluongsp", soluong);
            theModel.addAttribute("giohangId", giohangId);
      
        return "redirect:/";
    }
//--------------------------------------------------------------------------------------------------------------------------

    @GetMapping("/showFormForAddThanhToan")
    public String showFormForAddThanhToan(Model theModel, @RequestParam("giohangId") int theId,
            @RequestParam("soluongsp") int soluong, @RequestParam("tennguoidung") String tennguoidung) {
        if (tennguoidung.equals("0")) {
            // tạo 3 model object gửi cho muangay jsp
            KhachHang khachHang = new KhachHang();
            GiaoHang giaoHang = new GiaoHang();
            HoaDon hoaDon = new HoaDon();
            theModel.addAttribute("giaohang", giaoHang);
            theModel.addAttribute("hoadon", hoaDon);
            theModel.addAttribute("khachhang", khachHang);

            // trả về id tiếp theo của khachhang
            int khachhangId = khachHangService.NextIdKh();
            theModel.addAttribute("khachhangId", khachhangId);

            //trả về id tiếp theo của hoadon
            int hoadonId = hoaDonService.NextIdHD();
            theModel.addAttribute("hoadonId", hoadonId);

            // trả về  model object giỏ hàng cho muangay jsp
            GioHang gioHang = gioHangService.getGioHang(theId);
            theModel.addAttribute("giohangs", gioHang);
            theModel.addAttribute("giohangId", theId);
            theModel.addAttribute("tennguoidung", tennguoidung);
            if (soluong > 0) {
                double tonggia = sanPhamTrongGioHangService.TongGiaGioHang(theId);
                theModel.addAttribute("tonggia", tonggia);
                
            }
            return "muangay";
        } // da dang nhap thanh cong
        else {
            // tạo 3 model object gửi cho muangay jsp
            KhachHang khachHang = khachHangService.getKhachHangByName(tennguoidung);
            theModel.addAttribute("khachhang", khachHang);
            int idhk = khachHang.getMakh();
            System.out.println("---------------------khachhanb id" + idhk);      
            GiaoHang giaoHang = new GiaoHang();
            HoaDon hoaDon = new HoaDon();
            theModel.addAttribute("giaohang", giaoHang);
            theModel.addAttribute("hoadon", hoaDon);

            //tra ve id khach hang
            int khachhangId = khachHang.getMakh();
            theModel.addAttribute("khachhangId", khachhangId);
            //trả về id tiếp theo của hoadon
            int hoadonId = hoaDonService.NextIdHD();
            theModel.addAttribute("hoadonId", hoadonId);

            // trả về  model object giỏ hàng cho muangay jsp
            GioHang gioHang = gioHangService.getGioHang(theId);
            theModel.addAttribute("giohangs", gioHang);
            theModel.addAttribute("giohangId", theId);
            theModel.addAttribute("tennguoidung", tennguoidung);
            if (soluong > 0) {
                double tonggia = sanPhamTrongGioHangService.TongGiaGioHang(theId);
                theModel.addAttribute("tonggia", tonggia);
               
            }
             return "muangay";
        }
        
    }
//--------------------------------------------------------------------------------------------------------------------------
}
