/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.entity;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 *
 * @author s3n
 */
@Entity
@Table(name = "hoa_don")
public class HoaDon {

    @Id
    @Column(name = "mahd")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int mahd;
//    @Column(name = "ten_khach_hang")
//    private String tenKhachHang;
    @Column(name = "ngay_mua")
    //@Temporal(TemporalType.DATE)    
    private Date ngayMua;
    @Column(name = "tong_gia_tien")
    private double tongGiaTien;
     @Column(name = "hinh_thuc_thanh_toan")
    private String hinhThucThanhToan;
    @OneToMany( cascade = CascadeType.ALL)
    @JoinColumn(name = "mahd")
    private List<GiaoHang> giaoHangs;
    @OneToMany( cascade = CascadeType.ALL)
    @JoinColumn(name = "mahd")
    private List<GioHang> gioHangs;

    public HoaDon() {
    }

    public HoaDon(int mahd, Date ngayMua, double tongGiaTien, String hinhThucThanhToan, List<GiaoHang> giaoHangs, List<GioHang> gioHangs) {
        this.mahd = mahd;
        this.ngayMua = ngayMua;
        this.tongGiaTien = tongGiaTien;
        this.hinhThucThanhToan = hinhThucThanhToan;
        this.giaoHangs = giaoHangs;
        this.gioHangs = gioHangs;
    }

    public HoaDon(Date ngayMua, double tongGiaTien, String hinhThucThanhToan, List<GiaoHang> giaoHangs, List<GioHang> gioHangs) {
        this.ngayMua = ngayMua;
        this.tongGiaTien = tongGiaTien;
        this.hinhThucThanhToan = hinhThucThanhToan;
        this.giaoHangs = giaoHangs;
        this.gioHangs = gioHangs;
    }

  
    
    public HoaDon(String tenKhachHang, Date ngayMua, double tongGiaTien, String hinhThucThanhToan) {
       // this.tenKhachHang = tenKhachHang;
        this.ngayMua = ngayMua;
        this.tongGiaTien = tongGiaTien;
        this.hinhThucThanhToan = hinhThucThanhToan;
    }

    public HoaDon(int mahd, String tenKhachHang, Date ngayMua, double tongGiaTien, String hinhThucThanhToan) {
        this.mahd = mahd;
       // this.tenKhachHang = tenKhachHang;
        this.ngayMua = ngayMua;
        this.tongGiaTien = tongGiaTien;
        this.hinhThucThanhToan = hinhThucThanhToan;
    }
    
    

    public String getHinhThucThanhToan() {
        return hinhThucThanhToan;
    }

    public void setHinhThucThanhToan(String hinhThucThanhToan) {
        this.hinhThucThanhToan = hinhThucThanhToan;
    }



    public int getMahd() {
        return mahd;
    }

    public void setMahd(int mahd) {
        this.mahd = mahd;
    }

//    public String getTenKhachHang() {
//        return tenKhachHang;
//    }
//
//    public void setTenKhachHang(String tenKhachHang) {
//        this.tenKhachHang = tenKhachHang;
//    }

    public Date getNgayMua() {
        return ngayMua;
    }

    public void setNgayMua(Date ngayMua) {
        this.ngayMua = ngayMua;
    }

    public double getTongGiaTien() {
        return tongGiaTien;
    }

    public void setTongGiaTien(double tongGiaTien) {
        this.tongGiaTien = tongGiaTien;
    }

    public List<GiaoHang> getGiaoHangs() {
        return giaoHangs;
    }

    public void setGiaoHangs(List<GiaoHang> giaoHangs) {
        this.giaoHangs = giaoHangs;
    }

    public List<GioHang> getGioHangs() {
        return gioHangs;
    }

    public void setGioHangs(List<GioHang> gioHangs) {
        this.gioHangs = gioHangs;
    }

    public void addGioHang(GioHang gioHang) {
        if (gioHangs == null) {
            gioHangs = new ArrayList<>();
        }
        gioHangs.add(gioHang);
    }
   public void addGiaoHang(GiaoHang giaoHang) {
        if (giaoHangs == null) {
            giaoHangs = new ArrayList<>();
        }
        giaoHangs.add(giaoHang);
    }
    
    

}
