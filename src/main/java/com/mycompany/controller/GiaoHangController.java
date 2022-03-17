/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.controller;

import com.mycompany.entity.GiaoHang;
import com.mycompany.entity.HoaDon;
import com.mycompany.service.GiaoHangService;
import com.mycompany.service.HoaDonService;
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
@RequestMapping("/giaohang")
public class GiaoHangController {

    @Autowired
    private GiaoHangService giaoHangService;
    @Autowired
    private HoaDonService hoaDonService;
//--------------------------------------------------------------------------------------------------------------------------
    @PostMapping("/saveGiaoHang")
    public String saveGiaoHang(@ModelAttribute("giaohang") GiaoHang giaoHang,
            @RequestParam("hoadonId") int hoadonId, Model theModel) {
        giaoHangService.saveGiaoHang(giaoHang, hoadonId);
        //creditCardService.saveCreditCard(theCard, personId);
        HoaDon hoaDon = hoaDonService.getHoaDon(hoadonId);
        //Person  Thepersons= personService.getPerson(personId);
        theModel.addAttribute("hoadon", hoaDon);
        //return "redirect:/creditcard/list";
        return "giaohang-list";
    }
//--------------------------------------------------------------------------------------------------------------------------
    @PostMapping("/updateGiaoHang")
    public String updateCreditCard(@ModelAttribute("giaohang") GiaoHang giaoHang,
            @RequestParam("hoadonId") int hoadonId, Model theModel) {
        giaoHangService.updateGiaoHang(giaoHang, hoadonId);
        HoaDon hoaDon = hoaDonService.getHoaDon(hoadonId);
        theModel.addAttribute("hoadon", hoaDon);
        return "giaohang-list";
    }
//
//--------------------------------------------------------------------------------------------------------------------------
    @GetMapping("/showFormForAdd")
    public String showFormForAdd(Model theModel, @RequestParam("hoadonId") int hoadonId) {
        // create model attribute to bind form data
        GiaoHang giaohang = new GiaoHang();
        //CreditCard theCard = new CreditCard();
        theModel.addAttribute("giaohang", giaohang);
        theModel.addAttribute("hoadonId", hoadonId);
        theModel.addAttribute("isUpdate", false);
        return "giaohang-form";
    }
//
//--------------------------------------------------------------------------------------------------------------------------
    @GetMapping("/showFormForUpdate")
    public String showFormForUpdate(@RequestParam("hoadonId") int hoadonId,
            @RequestParam("giaohangId") int giaohangId,
            Model theModel) {
        GiaoHang giaohang = giaoHangService.getGiaoHang(giaohangId);
        theModel.addAttribute("giaohang", giaohang);
        theModel.addAttribute("hoadon", hoadonId);
        theModel.addAttribute("isUpdate", true);
        return "giaohang-form";
    }
//--------------------------------------------------------------------------------------------------------------------------
    @GetMapping("/delete")
    public String deleteGiaoHang(@RequestParam("giaohangId") int theId, @RequestParam("hoadonId") int hoadonId, Model theModel) {
        giaoHangService.deleteGiaoHang(theId);
        HoaDon hoaDon = hoaDonService.getHoaDon(hoadonId);
        theModel.addAttribute("hoadon", hoaDon);
        //return "redirect:/creditcard/list";
        return "giaohang-list";
    }
//--------------------------------------------------------------------------------------------------------------------------
    
   ////////////////////////////////////////////danh sach giao hang
     @GetMapping("/list")  
    public String GiaoHang(Model theModel,@RequestParam("hoadonId") int theId) {    
          List<GiaoHang> giaoHang = giaoHangService.getGiaoHangs(theId);
        theModel.addAttribute("giaohangs", giaoHang);	
        return "giaohang-list";      
    }
}
//--------------------------------------------------------------------------------------------------------------------------