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
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
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

        //get list new sp index 12
        List<SanPham> sanPhamIndex = new ArrayList<>();
        for(int i = sanPham.size() -1; i > sanPham.size() - 13;i--){
            sanPhamIndex.add(sanPham.get(i));
        }
        model.addAttribute("sanphams", sanPhamIndex);

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
    public String kh(Model model) {
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
        return "lienhe";
    }

    @GetMapping("/gioithieu")
    public String gth() {
        return "gioithieu";
    }
//    
//--------------------------------------------------------------------------------------------------------------------------

    @GetMapping("/homeadmin")
    public String showHomePage(Model model) {
        //check is user or anony
        String name = DumpService.getUserName();
        if(DumpService.isAnony()){
            name = " Admin ";
        }

        model.addAttribute("tennguoidung", name);
        return "homeadmin";
    }

    //sort string name to alphabet "abcde*uck this project"
    public List<SanPham> sortByName(List<SanPham> input){
        Collections.sort(input, new Comparator() {
            @Override
            public int compare(Object sp1, Object sp2) {
                //use instanceof to verify the references are indeed of the type in question
                return ((SanPham)sp1).getTenSanPham()
                        .compareTo(((SanPham)sp2).getTenSanPham());
            }
        });

        return input;
    }

    //price increase
    public List<SanPham> sortByPriceI(List<SanPham> input){
        Collections.sort(input, new Comparator() {
            @Override
            public int compare(Object sp1, Object sp2) {
                //use instanceof to verify the references are indeed of the type in question
                return (new Double(((SanPham)sp1).getGiaSanPham()))
                        .compareTo(((SanPham)sp2).getGiaSanPham());
            }
        });

        return input;
    }

    //price decrease
    public List<SanPham> sortByPriceD(List<SanPham> input){
        Collections.sort(input, new Comparator() {
            @Override
            public int compare(Object sp1, Object sp2) {
                //use instanceof to verify the references are indeed of the type in question
                return (new Double(((SanPham)sp2).getGiaSanPham()))
                        .compareTo(((SanPham)sp1).getGiaSanPham());
            }
        });

        return input;
    }

    @GetMapping("/sanpham")
    public String showSanpham(Model model, @RequestParam("type") String type, @RequestParam(value = "orderBy", required = false) String sort ) {
        //get list sanpham
        List<SanPham> sanPham = sanPhamService.getSanPhams();

        if(type.equals("router")){
            List<SanPham> sanPhamType = new ArrayList<>();
            for(int i=0;i<sanPham.size();i++){
                if(sanPham.get(i).getLoaiSanPham().equals("router Wifi"))
                    sanPhamType.add(sanPham.get(i));
            }
            sanPham = sanPhamType;
        }else if(type.equals("hub")){
            List<SanPham> sanPhamType = new ArrayList<>();
            for(int i=0;i<sanPham.size();i++){
                if(sanPham.get(i).getLoaiSanPham().equals("hub"))
                    sanPhamType.add(sanPham.get(i));
            }
            sanPham = sanPhamType;
        }else if(type.equals("other")){
            List<SanPham> sanPhamType = new ArrayList<>();
            for(int i=0;i<sanPham.size();i++){
                if(sanPham.get(i).getLoaiSanPham().equals("other") || sanPham.get(i).getLoaiSanPham().equals("router Wifi") != true || !sanPham.get(i).getLoaiSanPham().equals("hub")  != true)
                    sanPhamType.add(sanPham.get(i));
            }
            sanPham = sanPhamType;
        }

        if(sort != null){
            switch (sort){
                case "name":
                    sanPham = sortByName(sanPham);
                    break;
                case "priceI":
                    sanPham = sortByPriceI(sanPham);
                    break;
                case "priceD":
                    sanPham = sortByPriceD(sanPham);
                    break;
                default:
                    break;
            }
        }


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
        model.addAttribute("type", type);
        // trả về số lượng sản phẩm
        int soluongsanpham = gioHang != null?gioHang.getSanPhamTrongGioHangs().size():0;

        model.addAttribute("soluongsanpham", soluongsanpham);
        return "sanpham";
    }
//--------------------------------------------------------------------------------------------------------------------------

    @GetMapping("/search")
    public String searchPersons(@RequestParam(value = "theSearchName", required = false) String theSearchName,
                                @RequestParam(value = "orderBy", required = false) String sort ,
                                    Model theModel) {
        if(theSearchName == null){
            showSanpham(theModel, null,"all");
        }
        List<SanPham> sanPham = sanPhamService.searchSanPhams(theSearchName);

        if(sort != null){
            switch (sort){
                case "name":
                    sanPham = sortByName(sanPham);
                    break;
                case "priceI":
                    sanPham = sortByPriceI(sanPham);
                    break;
                case "priceD":
                    sanPham = sortByPriceD(sanPham);
                    break;
                default:
                    break;
            }
        }

        theModel.addAttribute("sanphams", sanPham);

        theModel.addAttribute("searchString", theSearchName);
        //check is user or anony
        String name = DumpService.getUserName();
        if(DumpService.isAnony()){
            name = "0";
        }
        theModel.addAttribute("tennguoidung", name);
        theModel.addAttribute("searchString", theSearchName);
     //   int soluongsanpham = sanPhamTrongGioHangService.countGioHang(giohangId);
    //    theModel.addAttribute("soluongsanpham", soluongsanpham);
       // theModel.addAttribute("giohangId", giohangId);
       // theModel.addAttribute("tennguoidung", name);
        return "sanpham";
    }
}
//--------------------------------------------------------------------------------------------------------------------------
