/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.controller;

import com.mycompany.entity.SanPham;
import com.mycompany.entity.ThongTinSanPham;
import com.mycompany.service.SanPhamService;
import java.io.IOException;
import java.io.InputStream;
import java.sql.SQLException;
import java.util.List;
import javax.servlet.http.Part;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

/**
 *
 * @author MPH
 */
@Controller
@RequestMapping("/sanpham")
public class SanPhamController {
    @Autowired
    private SanPhamService sanPhamService;
 //--------------------------------------------------------------------------------------------------------------------------   
    @GetMapping("/list")
    public String ListSanPham(Model model) {
        List<SanPham> sanPham = sanPhamService.getSanPhams();
        model.addAttribute("sanphams", sanPham);
        return "sanpham-list";
    }
//--------------------------------------------------------------------------------------------------------------------------    
//     @RequestMapping(value="/user", method = RequestMethod.POST)
//    public String savePerson(@RequestBody ("sanpham") SanPham sanPham ,@RequestParam("hinhanh") Part filePart) throws IOException, SQLException {
//       ThongTinSanPham thongTinSanPham = null;
//       InputStream inputStream = null;
//        if (sanPham.getMasp()!= 0   ){
//            thongTinSanPham = sanPhamService.getThongTinSanPham(sanPham.getMasp());
//        }  
//          if (filePart != null) {
//            // obtains input stream of the upload file
//            inputStream = filePart.getInputStream();
//           
//        }
//        sanPham.setThongTinSanPhams(thongTinSanPham);
//        sanPhamService.saveSanPham(sanPham,inputStream);
//        return "redirect:/sanpham/list";
//    }
    @RequestMapping(value = "/saveSanPham", method = {RequestMethod.GET,RequestMethod.POST})
    public String savePerson(@RequestParam("file") MultipartFile file,
             @RequestParam("tenSanPham") String tensanpham, @RequestParam("loaiSanPham") String loaiSanPham, @RequestParam("giaSanPham") double giaSanPham,
             @RequestParam("trangThai") int trangThai, @RequestParam("soLuongTrongKho") int soLuongTrongKho) throws IOException, SQLException {
        ThongTinSanPham thongTinSanPham = null;
        SanPham sanPham = new SanPham(tensanpham, loaiSanPham, giaSanPham, trangThai, soLuongTrongKho);
        InputStream inputStream = null;
        if (sanPham.getMasp() != 0) {
            thongTinSanPham = sanPhamService.getThongTinSanPham(sanPham.getMasp());
        }
          if (file != null) {
            // obtains input stream of the upload file
            inputStream = file.getInputStream();
           
        }
        sanPham.setThongTinSanPhams(thongTinSanPham);
        sanPhamService.saveSanPham(sanPham, inputStream);
        return "redirect:/sanpham/list";
    }
 //--------------------------------------------------------------------------------------------------------------------------   
    @GetMapping("/showFormForUpdate")
    public String showFormForUpdate(@RequestParam("sanphamId") int theId,
                    Model theModel) {
        SanPham sanPham = sanPhamService.getSanPham(theId);
           theModel.addAttribute("sanpham", sanPham);
        return "sanpham-form";    }
//--------------------------------------------------------------------------------------------------------------------------
    
     @GetMapping("/showFormForAdd")
    public String showFormForAdd(Model theModel) {
        // create model attribute to bind form data
        SanPham sanPham = new SanPham();
        theModel.addAttribute("sanpham", sanPham);
        //theModel.addAttribute("update", false);
        return "sanpham-form";    }  
  //--------------------------------------------------------------------------------------------------------------------------  
    @GetMapping("/delete")
    public String deletePerson(@RequestParam("sanphamId") int theId) {
            sanPhamService.deleteSanPham(theId);
            return "redirect:/sanpham/list";
    }
 //--------------------------------------------------------------------------------------------------------------------------   
   @GetMapping("/search")
    public String searchPersons(@RequestParam("theSearchName") String theSearchName,
                                    Model theModel) {
        List<SanPham> sanPham = sanPhamService.searchSanPhams(theSearchName);
       theModel.addAttribute("sanphams", sanPham);
        return "sanpham-list"; 
    }
//-------------------------------------------------------------------------------------------------------------------------- 
    
}
