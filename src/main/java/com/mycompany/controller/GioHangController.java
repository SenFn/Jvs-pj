/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.controller;

import com.mycompany.entity.*;
import com.mycompany.service.*;
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

    @Autowired
    private ThongTinSanPhamService thongTinSanPhamService;
//--------------------------------------------------------------------------------------------------------------------------

    @PostMapping("/saveSanPhamGioHang")
    public String saveSanPhamGioHang(Model model,
            @ModelAttribute("sanphamtronggiohang") SanPhamTrongGioHang sanPhamTrongGioHang,
            @RequestParam("sanphamId") int theId
//            @RequestParam("giohangId") int giohangId,
//            @RequestParam("tennguoidung") String tendangnhap,
//            @RequestParam("img") String img
    ) throws SQLException, IOException {
//        int soluongsanpham = sanPhamTrongGioHangService.countGioHang(giohangId);
        model.addAttribute("soluongsanpham", 1);
//        String onclick = "click";
//        model.addAttribute("onclick", onclick);
        model.addAttribute("sanphamId", theId);
        ThongTinSanPham thongtin = thongTinSanPhamService.getThongTinSanPham(theId);
        sanPhamTrongGioHang.setMasp(theId);
        sanPhamTrongGioHang.setTenSanPham(thongtin.getTenSanPham());
        sanPhamTrongGioHang.setImggh(thongtin.getImgtt());
        sanPhamTrongGioHang.setGiaSanPham(thongtin.getGiaSanPham());
        sanPhamTrongGioHang.setSoLuong(1);
        GioHang gioHang = DumpService.getCacheBySessionID(DumpService.getSessionID()).giohang;
        sanPhamTrongGioHang.setMaspgh(gioHang != null?gioHang.getSanPhamTrongGioHangs().size():0 );
//        sanPhamTrongGioHang.setTenSanPham()
        GioHang giohang = DumpService.CacheUpdateCard(DumpService.getSessionID(),sanPhamTrongGioHang);
//        model.addAttribute("giohangId", giohangId);
//        model.addAttribute("tennguoidung", tendangnhap);

        //  String img = senddata.getImggh();
//        sanPhamTrongGioHang.setImggh(img);
//        System.out.println("chuoi anh la______________________________________________________________" + img);
//        sanPhamTrongGioHangService.saveSanPhamTrongGioHang(sanPhamTrongGioHang, giohangId);
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
    public String deleteSanPhamTrongGio(@RequestParam("sanphamgiohangId") int theId,
//            @RequestParam("tennguoidung") String tendangnhap,
//            @RequestParam("giohangId") int giohangId,
                                        Model theModel) {
//        sanPhamTrongGioHangService.deleteSanPhamTrongGioHang(theId);
        DumpService.getCacheBySessionID(DumpService.getSessionID()).giohang.removeIndex(theId);
        return listGioHang(theModel);
//        int soluongsanpham = sanPhamTrongGioHangService.countGioHang(giohangId);
//        theModel.addAttribute("giohangId", giohangId);
//        theModel.addAttribute("soluongsp", soluongsanpham);
//        theModel.addAttribute("tennguoidung", tendangnhap);
//        return "redirect:/giohang/list";
    }
//--------------------------------------------------------------------------------------------------------------------------

    @GetMapping("/congsoluong")
    public String showFormForUpdatecong(@RequestParam("masp") int theId,
//                                        @RequestParam("tennguoidung") String tendangnhap,
//             @RequestParam("soluong") int soluong, @RequestParam("giohangId") int giohangId,
                                        Model theModel) throws SQLException, IOException {
//        SanPhamTrongGioHang sanPhamTrongGioHang = gioHangService.getSanPhamTrongGioHang(theId);
//        soluong += 1;
//        theModel.addAttribute("soluongsp", soluong);
//        gioHangService.updateSoLuongSanPham(sanPhamTrongGioHang, soluong);
//        theModel.addAttribute("giohangId", giohangId);
//        theModel.addAttribute("tennguoidung", tendangnhap);
//        return "redirect:/giohang/list";
        SanPhamTrongGioHang sanPhamTrongGioHang = new SanPhamTrongGioHang();
        GioHang gioHang = DumpService.getCacheBySessionID(DumpService.getSessionID()).giohang;

        ThongTinSanPham thongtin = thongTinSanPhamService.getThongTinSanPham(theId);
        sanPhamTrongGioHang.setMasp(theId);
        sanPhamTrongGioHang.setTenSanPham(thongtin.getTenSanPham());
        sanPhamTrongGioHang.setImggh(thongtin.getImgtt());
        sanPhamTrongGioHang.setGiaSanPham(thongtin.getGiaSanPham());
        sanPhamTrongGioHang.setSoLuong(1);
        sanPhamTrongGioHang.setMaspgh(gioHang != null?gioHang.getSanPhamTrongGioHangs().size():0 );
//        sanPhamTrongGioHang.setTenSanPham()
        GioHang giohang = DumpService.CacheUpdateCard(DumpService.getSessionID(),sanPhamTrongGioHang);
        return listGioHang(theModel);

    }
//--------------------------------------------------------------------------------------------------------------------------

    @GetMapping("/trusoluong")
    public String showFormForUpdatetru(@RequestParam("masp") int theId,
//                                       @RequestParam("tennguoidung") String tendangnhap,
//            @RequestParam("soluong") int soluong, @RequestParam("giohangId") int giohangId,
                                       Model theModel) throws SQLException, IOException {
//        SanPhamTrongGioHang sanPhamTrongGioHang = gioHangService.getSanPhamTrongGioHang(theId);
//        soluong -= 1;
//        theModel.addAttribute("soluongsp", soluong);
//        gioHangService.updateSoLuongSanPham(sanPhamTrongGioHang, soluong);
//        theModel.addAttribute("giohangId", giohangId);
//        theModel.addAttribute("tennguoidung", tendangnhap);
//        return "redirect:/giohang/list";

        SanPhamTrongGioHang sanPhamTrongGioHang = new SanPhamTrongGioHang();
        GioHang gioHang = DumpService.getCacheBySessionID(DumpService.getSessionID()).giohang;

        ThongTinSanPham thongtin = thongTinSanPhamService.getThongTinSanPham(theId);
        sanPhamTrongGioHang.setMasp(theId);
        sanPhamTrongGioHang.setTenSanPham(thongtin.getTenSanPham());
        sanPhamTrongGioHang.setImggh(thongtin.getImgtt());
        sanPhamTrongGioHang.setGiaSanPham(thongtin.getGiaSanPham());
        sanPhamTrongGioHang.setSoLuong(-1);
        sanPhamTrongGioHang.setMaspgh(gioHang != null?gioHang.getSanPhamTrongGioHangs().size():0 );
//        sanPhamTrongGioHang.setTenSanPham()
        GioHang giohang = DumpService.CacheUpdateCard(DumpService.getSessionID(),sanPhamTrongGioHang);
        return listGioHang(theModel);
    }
//--------------------------------------------------------------------------------------------------------------------------

    @GetMapping("/list")
    public String listGioHang(Model theModel
//            , @RequestParam("giohangId") int theId, @RequestParam("soluongsp") int soluong,
//            @RequestParam("tennguoidung") String tendangnhap
    ) {
//        GioHang gioHang = gioHangService.getGioHang(theId);
//        theModel.addAttribute("giohangs", gioHang);
//        theModel.addAttribute("giohangId", theId);
//        theModel.addAttribute("soluongsp", soluong);
//        theModel.addAttribute("tennguoidung", tendangnhap);
//        if (soluong > 0) {
//            double tonggia = sanPhamTrongGioHangService.TongGiaGioHang(theId);
//            theModel.addAttribute("tonggia", tonggia);
//        }
        //check is user or anony
        String name = DumpService.getUserName();
        int id = -1;
        if(DumpService.isAnony()){
            name = "0";
        }

        theModel.addAttribute("tennguoidung", name);
        GioHang giohang = DumpService.getCacheBySessionID(DumpService.getSessionID()).giohang;
        theModel.addAttribute("giohangs", giohang);
        theModel.addAttribute("soluongsp", giohang != null?giohang.getSanPhamTrongGioHangs().size():0 );
        theModel.addAttribute("tennguoidung", DumpService.getUserName());

        long price = 0;
        for(int i=0;i< giohang.getSanPhamTrongGioHangs().size();i++){
            SanPhamTrongGioHang sp =  giohang.getSanPhamTrongGioHangs().get(i);
            price += sp.getGiaSanPham()*sp.getSoLuong();
        }
        theModel.addAttribute("tonggia",price);
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
