/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.controller;

import com.mycompany.entity.HoaDon;
import com.mycompany.entity.KhachHang;
import com.mycompany.service.KhachHangService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author MPH
 */
public class ChiTietHoaDonController {

    @Autowired
    private KhachHangService khachHangService;
//--------------------------------------------------------------------------------------------------------------------------

    @GetMapping("/list")
    public String ListKhachHang(Model model) {
        List<KhachHang> khahcHang = khachHangService.getKhachHangs();
        model.addAttribute("khachhangs", khahcHang);
        return "khachhang-list";
    }
//--------------------------------------------------------------------------------------------------------------------------
    @PostMapping("/saveKhachHang")
    public String saveKhachHang(@ModelAttribute("khachhang") KhachHang khachHang) {
        //  ThongTinSanPham thongTinSanPham = null;
        List<HoaDon> hoaDon = null;
        if (khachHang.getMakh() != 0) {
            hoaDon = khachHangService.getHoaDons(khachHang.getMakh());
            //  thongTinSanPham = sanPhamService.getThongTinSanPham(sanPham.getMasp());
        }
        khachHang.setHoaDons(hoaDon);
        khachHangService.saveKhachHang(khachHang);
        //sanPham.setThongTinSanPhams(thongTinSanPham);
        //  sanPhamService.saveSanPham(sanPham);
        return "redirect:/khachhang/list";
    }
//--------------------------------------------------------------------------------------------------------------------------
    @GetMapping("/showFormForUpdate")
    public String showFormForUpdate(@RequestParam("khachhangId") int theId,
            Model theModel) {
        //SanPham thePerson = sanPhamService.getSanPham(theId);
        KhachHang khachHang = khachHangService.getKhachHang(theId);
        theModel.addAttribute("khachhang", khachHang);
        return "khachhang-form";
    }
//--------------------------------------------------------------------------------------------------------------------------
    @GetMapping("/showFormForAdd")
    public String showFormForAdd(Model theModel) {
        // create model attribute to bind form data
        KhachHang khachHang = new KhachHang();
        theModel.addAttribute("khachhang", khachHang);
        //theModel.addAttribute("update", false);
        return "khachhang-form";
    }
//    
//--------------------------------------------------------------------------------------------------------------------------
    @GetMapping("/delete")
    public String deleteKhachHang(@RequestParam("sanphamId") int theId) {
        khachHangService.deleteKhachHang(theId);
        return "redirect:/khachhang/list";
    }
//    
//--------------------------------------------------------------------------------------------------------------------------
    @GetMapping("/search")
    public String searchKhachHang(@RequestParam("theSearchName") String theSearchName,
            Model theModel) {
        List<KhachHang> khachHang = khachHangService.searchKhachHang(theSearchName);
        theModel.addAttribute("khachhangs", khachHang);
        return "khachhang-list";
    }
}
//--------------------------------------------------------------------------------------------------------------------------