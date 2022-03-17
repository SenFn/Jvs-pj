/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.controller;

import com.mycompany.entity.GiaoHang;
import com.mycompany.entity.GioHang;
import com.mycompany.entity.SanPhamTrongGioHang;
import com.mycompany.entity.HoaDon;
import com.mycompany.entity.KhachHang;
import com.mycompany.service.GioHangService;
import com.mycompany.service.KhachHangService;
import com.mycompany.service.SanPhamTrongGioHangService;
import com.sun.org.apache.xerces.internal.impl.dv.util.Base64;
import java.io.IOException;
import java.sql.Blob;
import java.sql.SQLException;
import java.util.List;
import javax.sql.rowset.serial.SerialBlob;
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
 * @author s3n
 */
@Controller
@RequestMapping("/giohang")
public class GioHangController {

    @Autowired
    private SanPhamTrongGioHangService sanPhamTrongGioHangService;
    @Autowired
    private GioHangService gioHangService;
    @Autowired
    private KhachHangService khachHangService;
//--------------------------------------------------------------------------------------------------------------------------

    @PostMapping("/saveSanPhamGioHang")
    public String saveSanPhamGioHang(@ModelAttribute("sanphamtronggiohang") SanPhamTrongGioHang sanPhamTrongGioHang,
            @RequestParam("sanphamId") int theId, Model model, @RequestParam("giohangId") int giohangId,
            @RequestParam("tennguoidung") String tendangnhap,
            @RequestParam("img") String img) throws SQLException, IOException {
        int soluongsanpham = sanPhamTrongGioHangService.countGioHang(giohangId);
        model.addAttribute("soluongsanpham", soluongsanpham);
        String onclick = "click";
        model.addAttribute("onclick", onclick);
        model.addAttribute("sanphamId", theId);
        model.addAttribute("giohangId", giohangId);
        model.addAttribute("tennguoidung", tendangnhap);

        //  String img = senddata.getImggh();
        sanPhamTrongGioHang.setImggh(img);
        System.out.println("chuoi anh la______________________________________________________________" + img);
        sanPhamTrongGioHangService.saveSanPhamTrongGioHang(sanPhamTrongGioHang, giohangId);
        //    gioHangService.saveGioHang(gioHang);
        return "redirect:/thongtinsanpham/list";
    }
//--------------------------------------------------------------------------------------------------------------------------

    @PostMapping("/saveGioHang")
    public String saveGioHang(@ModelAttribute("giohang") GioHang gioHang,
            @RequestParam("sanphamId") int theId, Model model) {
        String onclick = "click";
        model.addAttribute("onclick", onclick);
        model.addAttribute("sanphamId", theId);
        //sanPhamTrongGioHangService.saveSanPhamTrongGioHang(sanPhamTrongGioHang, giohangId);
        gioHangService.saveGioHang(gioHang);
        return "redirect:/thongtinsanpham/list";
    }
//--------------------------------------------------------------------------------------------------------------------------

    @GetMapping("/deleteSanPhamTrongGio")
    public String deleteSanPhamTrongGio(@RequestParam("sanphamgiohangId") int theId, @RequestParam("tennguoidung") String tendangnhap,
            @RequestParam("giohangId") int giohangId, Model theModel) {
        sanPhamTrongGioHangService.deleteSanPhamTrongGioHang(theId);
        int soluongsanpham = sanPhamTrongGioHangService.countGioHang(giohangId);
        theModel.addAttribute("giohangId", giohangId);
        theModel.addAttribute("soluongsp", soluongsanpham);
        theModel.addAttribute("tennguoidung", tendangnhap);
        return "redirect:/giohang/list";
    }
//--------------------------------------------------------------------------------------------------------------------------

    @GetMapping("/congsoluong")
    public String showFormForUpdatecong(@RequestParam("sanphamgiohangId") int theId, @RequestParam("tennguoidung") String tendangnhap,
             @RequestParam("soluong") int soluong, @RequestParam("giohangId") int giohangId, Model theModel) {
        SanPhamTrongGioHang sanPhamTrongGioHang = gioHangService.getSanPhamTrongGioHang(theId);
        soluong += 1;
        theModel.addAttribute("soluongsp", soluong);
        gioHangService.updateSoLuongSanPham(sanPhamTrongGioHang, soluong);
        theModel.addAttribute("giohangId", giohangId);
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
        return "redirect:/giohang/list";
    }
//--------------------------------------------------------------------------------------------------------------------------

    @GetMapping("/list")
    public String listGioHang(Model theModel, @RequestParam("giohangId") int theId, @RequestParam("soluongsp") int soluong,
            @RequestParam("tennguoidung") String tendangnhap) {
        GioHang gioHang = gioHangService.getGioHang(theId);
        theModel.addAttribute("giohangs", gioHang);
        theModel.addAttribute("giohangId", theId);
        theModel.addAttribute("soluongsp", soluong);
        theModel.addAttribute("tennguoidung", tendangnhap);
        if (soluong > 0) {
            double tonggia = sanPhamTrongGioHangService.TongGiaGioHang(theId);
            theModel.addAttribute("tonggia", tonggia);
        }
        return "giohang";
    }
//--------------------------------------------------------------------------------------------------------------------------
    @GetMapping("/sanphamlist")
    public String GioHang(Model theModel, @RequestParam("hoadonId") int theId) {
        GioHang gioHang = gioHangService.getGioHanghd(theId);
        theModel.addAttribute("giohangs", gioHang);
        return "sanphamtronggiohang-list";
    }
}
//--------------------------------------------------------------------------------------------------------------------------
