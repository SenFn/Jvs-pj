/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.entity;

import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Base64;
import java.util.List;
import javax.imageio.ImageIO;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

/**
 *
 * @author MPH
 */
@Entity
@Table(name = "Sanpham")
public class SanPham {
    @Id
    @Column(name = "masp")
     @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int masp;
    @Column(name = "ten_san_pham")
    private String tenSanPham;
    @Column(name = "img")
    private byte[] imgSp;
    @Column(name = "loai_san_pham")
    private String loaiSanPham;
    @Column(name = "gia_san_pham")
    private double giaSanPham;
    @Column(name = "trang_thai")
    private int trangThai;
    @Column(name = "so_luong_trong_kho")
    private int soLuongTrongKho;
//    @Column(name = "id")
//    @GeneratedValue(strategy=GenerationType.IDENTITY)
//    private int id;
    
    
    
    @OneToOne(fetch = FetchType.EAGER,cascade = CascadeType.ALL)
    @JoinColumn(name = "masp")
    private ThongTinSanPham thongTinSanPhams;
    
    @OneToMany(fetch = FetchType.EAGER,cascade = CascadeType.ALL)
    @JoinColumn(name = "masp")
    private List<SanPhamTrongGioHang> sanPhamTrongGioHangs;
     public SanPham(){         
     }

    public SanPham(String tenSanPham, String loaiSanPham, double giaSanPham, int trangThai, int soLuongTrongKho) {
        this.tenSanPham = tenSanPham;
        this.loaiSanPham = loaiSanPham;
        this.giaSanPham = giaSanPham;
        this.trangThai = trangThai;
        this.soLuongTrongKho = soLuongTrongKho;
    }
     
    public SanPham(int masp, String tenSanPham, byte[] imgSp, String loaiSanPham, double giaSanPham, int trangThai, int soLuongTrongKho, ThongTinSanPham thongTinSanPhams, List<SanPhamTrongGioHang> sanPhamTrongGioHangs) {
        this.masp = masp;
        this.tenSanPham = tenSanPham;
        this.imgSp = imgSp;
        this.loaiSanPham = loaiSanPham;
        this.giaSanPham = giaSanPham;
        this.trangThai = trangThai;
        this.soLuongTrongKho = soLuongTrongKho;
        this.thongTinSanPhams = thongTinSanPhams;
        this.sanPhamTrongGioHangs = sanPhamTrongGioHangs;
    }

    public SanPham(String tenSanPham, byte[] imgSp, String loaiSanPham, double giaSanPham, int trangThai, int soLuongTrongKho, ThongTinSanPham thongTinSanPhams, List<SanPhamTrongGioHang> sanPhamTrongGioHangs) {
        this.tenSanPham = tenSanPham;
        this.imgSp = imgSp;
        this.loaiSanPham = loaiSanPham;
        this.giaSanPham = giaSanPham;
        this.trangThai = trangThai;
        this.soLuongTrongKho = soLuongTrongKho;
        this.thongTinSanPhams = thongTinSanPhams;
        this.sanPhamTrongGioHangs = sanPhamTrongGioHangs;
    }

    public SanPham(int masp, String tenSanPham, byte[] imgSp, String loaiSanPham, double giaSanPham, int trangThai, int soLuongTrongKho) {
        this.masp = masp;
        this.tenSanPham = tenSanPham;
        this.imgSp = imgSp;
        this.loaiSanPham = loaiSanPham;
        this.giaSanPham = giaSanPham;
        this.trangThai = trangThai;
        this.soLuongTrongKho = soLuongTrongKho;
    }

    public SanPham(String tenSanPham, byte[] imgSp, String loaiSanPham, double giaSanPham, int trangThai, int soLuongTrongKho) {
        this.tenSanPham = tenSanPham;
        this.imgSp = imgSp;
        this.loaiSanPham = loaiSanPham;
        this.giaSanPham = giaSanPham;
        this.trangThai = trangThai;
        this.soLuongTrongKho = soLuongTrongKho;
    }
     
   

  
    public String getTenSanPham() {
        return tenSanPham;
    }

    public void setTenSanPham(String tenSanPham) {
        this.tenSanPham = tenSanPham;
    }

    public String getImgSp() throws SQLException, IOException {
        ByteArrayInputStream in = new ByteArrayInputStream(imgSp);
        BufferedImage image = ImageIO.read(in);
        ByteArrayOutputStream output = new ByteArrayOutputStream();

        ImageIO.write(image, "png", output);
        String imageAsBase64 = Base64.getEncoder().encodeToString(output.toByteArray());
        return imageAsBase64;
       // return image;
    }

    public void setImgSp(byte[] imgSp) {
        this.imgSp = imgSp;
    }

    public String getLoaiSanPham() {
        return loaiSanPham;
    }

    public void setLoaiSanPham(String loaiSanPham) {
        this.loaiSanPham = loaiSanPham;
    }

    public double getGiaSanPham() {
        return giaSanPham;
    }

    public void setGiaSanPham(double giaSanPham) {
        this.giaSanPham = giaSanPham;
    }

    public int getTrangThai() {
        return trangThai;
    }

    public void setTrangThai(int trangThai) {
        this.trangThai = trangThai;
    }

    public int getSoLuongTrongKho() {
        return soLuongTrongKho;
    }

    public void setSoLuongTrongKho(int soLuongTrongKho) {
        this.soLuongTrongKho = soLuongTrongKho;
    }

    public int getMasp() {
        return masp;
    }

    public void setMasp(int masp) {
        this.masp = masp;
    }

    public List<SanPhamTrongGioHang> getSanPhamTrongGioHangs() {
        return sanPhamTrongGioHangs;
    }

    public void setSanPhamTrongGioHangs(List<SanPhamTrongGioHang> sanPhamTrongGioHangs) {
        this.sanPhamTrongGioHangs = sanPhamTrongGioHangs;
    }

 

   
    public ThongTinSanPham getThongTinSanPhams() {
        return thongTinSanPhams;
    }

    public void setThongTinSanPhams(ThongTinSanPham thongTinSanPhams) {
        this.thongTinSanPhams = thongTinSanPhams;
    }
//    public void addChiTietHoaDon(ChiTietHoaDon chiTietHoaDon) {
//        if (ChiTietHoaDons == null) {
//            ChiTietHoaDons = new ArrayList<>();
//        }
//       ChiTietHoaDons.add(chiTietHoaDon);
//    }
}
