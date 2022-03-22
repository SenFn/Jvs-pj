/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.controller;

import com.mycompany.entity.GioHang;
import com.mycompany.entity.SanPhamTrongGioHang;
import com.mycompany.entity.SanPham;
import com.mycompany.entity.ThongTinSanPham;
import com.mycompany.service.DumpService;
import com.mycompany.service.SanPhamService;
import com.mycompany.service.SanPhamTrongGioHangService;
import com.mycompany.service.ThongTinSanPhamService;
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
@RequestMapping("/thongtinsanpham")
public class thongTinSanPhamController {

    @Autowired
    private SanPhamTrongGioHangService sanPhamTrongGioHangService;
    @Autowired
    private ThongTinSanPhamService thongTinSanPhamService;
    @Autowired
    private SanPhamService sanPhamService;
//--------------------------------------------------------------------------------------------------------------------------
    @PostMapping("/saveCard")
    public String saveThongTinSanPham(@ModelAttribute("thongtinsanpham") ThongTinSanPham thongTinSanPham,
            @RequestParam("sanphamId") int sanphamId, Model theModel) {
        thongTinSanPhamService.saveThongTinSanPham(thongTinSanPham, sanphamId);
        SanPham sanPham = sanPhamService.getSanPham(sanphamId);
        theModel.addAttribute("sanpham", sanPham);
        return "thongtinsanpham-list";
    }
//--------------------------------------------------------------------------------------------------------------------------
    @PostMapping("/updateThongTinSanPham")
    public String updateCreditCard(@ModelAttribute("update") ThongTinSanPham thongTinSanPham,
            @RequestParam("sanphamId") int sanphamId, Model theModel) {
        // creditCardService.updateCreditCard(theCard, personId);
        thongTinSanPhamService.updateThongTinSanPham(thongTinSanPham, sanphamId);
        SanPham sanPham = sanPhamService.getSanPham(sanphamId);
        //Person  Thepersons= personService.getPerson(personId);
        theModel.addAttribute("person", sanPham);
        return "thongtinsanpham-list";
    }
//--------------------------------------------------------------------------------------------------------------------------
    @GetMapping("/showFormForAdd")
    public String showFormForAdd(Model theModel, @RequestParam("sanphamId") int sanphamId) {
        // create model attribute to bind form data
        ThongTinSanPham thongTinSanPham = new ThongTinSanPham();
        theModel.addAttribute("thongtinsanpham", thongTinSanPham);
        theModel.addAttribute("sanphamId", sanphamId);
        theModel.addAttribute("isUpdate", false);
        return "thongtinsanpham-form";
    }
//--------------------------------------------------------------------------------------------------------------------------
    @GetMapping("/showFormForUpdate")
    public String showFormForUpdate(@RequestParam("sanphamId") int sanphamId,
            @RequestParam("thongtinsanphamId") int id,
            Model theModel) {
        // get the creditcard from our service
        ThongTinSanPham thongTinSanPham = thongTinSanPhamService.getThongTinSanPham(id);
        // set creditcard as a model attribute to pre-populate the form
        theModel.addAttribute("thongtinsanpham", thongTinSanPham);
        theModel.addAttribute("sanphamId", sanphamId);
        theModel.addAttribute("isUpdate", true);
        return "thongtinsanpham-form";
    }
//--------------------------------------------------------------------------------------------------------------------------
    @GetMapping("/delete")
    public String deleteCreditCard(@RequestParam("thongtinsanphamId") int theId, @RequestParam("sanphamId") int sanphamId, Model theModel) {
        // creditCardService.deleteCreditCard(theId);
        thongTinSanPhamService.deleteThongTinSanPham(theId);
        SanPham sanPham = sanPhamService.getSanPham(sanphamId);
        theModel.addAttribute("sanpham", sanPham);
        //return "redirect:/creditcard/list";
        return "thongtinsanpham-list";
    }
//--------------------------------------------------------------------------------------------------------------------------
    @GetMapping("/list")
    public String listThongTinSanPham(@RequestParam("sanphamId") int theId, Model theModel
//            ,@RequestParam("onclick") String onclick, @RequestParam("giohangId") int giohangId,
//             @RequestParam("tennguoidung") String tendangnhap
    ) {
        ThongTinSanPham thongTinSanPham = thongTinSanPhamService.getThongTinSanPham(theId);
        theModel.addAttribute("thongtinsanphams", thongTinSanPham);
        String tendangnhap = DumpService.getUserName();
        if(DumpService.isAnony()){
            tendangnhap = "0";
        }
        theModel.addAttribute("tennguoidung",tendangnhap);
        if(DumpService.CacheCardCheckProduct(DumpService.getSessionID(), theId) == true)
            theModel.addAttribute("onclick", "click");
        else
            theModel.addAttribute("onclick", "index");

        GioHang gioHang = DumpService.getCacheBySessionID(DumpService.getSessionID()).giohang;
        theModel.addAttribute("soluongsanpham", gioHang != null?gioHang.getSanPhamTrongGioHangs().size():0 );
//        theModel.addAttribute("onclick", "index");
//        if (onclick.equals("index")) {
//            int soluongsanpham = sanPhamTrongGioHangService.countGioHang(giohangId);
//            SanPhamTrongGioHang sanPhamTronggiohang = new SanPhamTrongGioHang();
//            theModel.addAttribute("sanphamtronggiohang", sanPhamTronggiohang);
//            theModel.addAttribute("giohangId", giohangId);
//            ThongTinSanPham thongTinSanPham = thongTinSanPhamService.getThongTinSanPham(theId);
//            theModel.addAttribute("soluongsanpham", soluongsanpham);
//            theModel.addAttribute("thongtinsanphams", thongTinSanPham);
//            theModel.addAttribute("tennguoidung",tendangnhap);
//        }
//        else {
//            int soluongsanpham = sanPhamTrongGioHangService.countGioHang(giohangId);
//            //model.addAttribute("soluongsanpham", soluongsanpham);
    //            theModel.addAttribute("giohangId", giohangId);
//            theModel.addAttribute("onclick", onclick);
//            theModel.addAttribute("soluongsanpham", soluongsanpham);
//            ThongTinSanPham thongTinSanPham = thongTinSanPhamService.getThongTinSanPham(theId);
//            theModel.addAttribute("thongtinsanphams", thongTinSanPham);
//
//        }

        return "chitietsanpham";
    }
//--------------------------------------------------------------------------------------------------------------------------
     @GetMapping("/thongtinlist")  
    public String listThongTinSanPham(Model theModel,@RequestParam("sanphamId") int theId) {    
       ThongTinSanPham thongTinSanPham = thongTinSanPhamService.getThongTinSanPham(theId);
        theModel.addAttribute("thongtinsanphams", thongTinSanPham);	
        return "thongtinsanpham-list";      
    }
}
//--------------------------------------------------------------------------------------------------------------------------
