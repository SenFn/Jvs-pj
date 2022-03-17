    
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.controller;

//import com.mycompany.entity.ChiTietHoaDon;
import com.mycompany.entity.GiaoHang;
import com.mycompany.entity.GioHang;
import com.mycompany.entity.HoaDon;
import com.mycompany.entity.KhachHang;
//import com.mycompany.service.ChiTietHoaDonService;
import com.mycompany.service.GioHangService;
import com.mycompany.service.HoaDonService;
import com.mycompany.service.KhachHangService;
import com.mycompany.service.SanPhamService;
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
@RequestMapping("/hoadon")
public class HoaDonController {

    @Autowired
    private HoaDonService hoaDonService;
    //  @Autowired
    //  private ChiTietHoaDonService chiTietHoaDonService;
    @Autowired
    private KhachHangService khachHangService;
//--------------------------------------------------------------------------------------------------------------------------
    @GetMapping("/list")
    public String ListHoaDon(Model model,@RequestParam("khachhangId") int theId) {
        List<HoaDon> hoaDon = hoaDonService.getHoaDons(theId);
        model.addAttribute("hoadons", hoaDon);
        return "hoadon-list";
    }
//--------------------------------------------------------------------------------------------------------------------------
    @GetMapping("/showFormForUpdate")
    public String showFormForUpdate(@RequestParam("hoadonId") int theId,
            Model theModel) {
        //SanPham thePerson = sanPhamService.getSanPham(theId);
        HoaDon hoaDon = hoaDonService.getHoaDon(theId);
        hoaDonService.getHoaDon(theId);
        theModel.addAttribute("hoadon", hoaDon);
        return "hoadon-form";
    }
//
//    
//--------------------------------------------------------------------------------------------------------------------------
    @GetMapping("/showFormForAdd")
    public String showFormForAdd(Model theModel) {
        // create model attribute to bind form data
        HoaDon hoaDon = new HoaDon();
        theModel.addAttribute("hoadon", hoaDon);
        //theModel.addAttribute("update", false);
        return "hoadon-form";
    }
////    
//--------------------------------------------------------------------------------------------------------------------------
    @GetMapping("/delete")
    public String deletehoadon(@RequestParam("hoadonId") int theId) {
        hoaDonService.deleteHoaDon(theId);
        return "redirect:/hoadon/list";
    }
////    
//--------------------------------------------------------------------------------------------------------------------------
    @GetMapping("/search")
    public String searchHoaDon(@RequestParam("theSearchName") String theSearchName,
            Model theModel) {
        List<HoaDon> hoaDon = hoaDonService.searchHoaDon(theSearchName);
        theModel.addAttribute("khachhangs", hoaDon);
        return "hoadon-list";
    }
}
