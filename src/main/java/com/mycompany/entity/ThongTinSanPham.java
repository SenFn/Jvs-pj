/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;
import javax.imageio.ImageIO;

/**
 *
 * @author MPH
 */
//create table thong_tin_san_pham(
//matt AS 'tt' + convert(varchar(10),id) PERSISTED primary key,
//img varbinary(max),
//ten_san_pham nvarchar(100),
//nha_cung_cap nvarchar(50),
//mo_ta nvarchar(500),
//bao_hanh nvarchar(200),
//id INT IDENTITY(1,1),
//masp varchar(12)
@Entity
@Table(name = "thong_tin_san_pham")
public class ThongTinSanPham {

    @Id
    @Column(name = "matt")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int matt;
    @Column(name = "ten_san_pham")
    private String tenSanPham;
    @Column(name = "img")
    private byte[] imgtt;
    @Column(name = "gia_san_pham")
    private double giaSanPham;
    @Column(name = "nha_cung_cap")
    private String nhaCungCap;
    @Column(name = "mo_ta")
    private String moTa;
    @Column(name = "bao_hanh")
    private String baoHanh;
//    @Column(name = "id")
//    @GeneratedValue(strategy = GenerationType.IDENTITY)
//    private int id;

    public ThongTinSanPham() {

    }

    public ThongTinSanPham(int matt, String tenSanPham, byte[] imgtt, double giaSanPham, String nhaCungCap, String moTa, String baoHanh) {
        this.matt = matt;
        this.tenSanPham = tenSanPham;
        this.imgtt = imgtt;
        this.giaSanPham = giaSanPham;
        this.nhaCungCap = nhaCungCap;
        this.moTa = moTa;
        this.baoHanh = baoHanh;
    }

    public ThongTinSanPham(String tenSanPham, byte[] imgtt, double giaSanPham, String nhaCungCap, String moTa, String baoHanh) {
        this.tenSanPham = tenSanPham;
        this.imgtt = imgtt;
        this.giaSanPham = giaSanPham;
        this.nhaCungCap = nhaCungCap;
        this.moTa = moTa;
        this.baoHanh = baoHanh;
    }

    public int getMatt() {
        return matt;
    }

    public void setMatt(int matt) {
        this.matt = matt;
    }
    
  

  

    public String getImgtt() throws SQLException, IOException {
        ByteArrayInputStream in = new ByteArrayInputStream(imgtt);
        BufferedImage image = ImageIO.read(in);
        ByteArrayOutputStream output = new ByteArrayOutputStream();
        ImageIO.write(image, "png", output);
        String imageAsBase64 = Base64.getEncoder().encodeToString(output.toByteArray());
        return imageAsBase64;
//        import java.awt.image.BufferedImage;
//import java.io.ByteArrayOutputStream;
//import java.io.IOException;
//import java.io.InputStream;
//import java.sql.Blob;
//import java.sql.SQLException;
//import java.util.ArrayList;
//import java.util.Base64;
//import java.util.List;
//import javax.imageio.ImageIO;
    }

    public void setImgtt(byte[] imgtt) {
        this.imgtt = imgtt;
    }

    public String getTenSanPham() {
        return tenSanPham;
    }

    public void setTenSanPham(String tenSanPham) {
        this.tenSanPham = tenSanPham;
    }

    public String getNhaCungCap() {
        return nhaCungCap;
    }

    public void setNhaCungCap(String nhaCungCap) {
        this.nhaCungCap = nhaCungCap;
    }

    public String getMoTa() {
        return moTa;
    }

    public void setMoTa(String moTa) {
        this.moTa = moTa;
    }

    public String getBaoHanh() {
        return baoHanh;
    }

    public void setBaoHanh(String baoHanh) {
        this.baoHanh = baoHanh;
    }

   
    public double getGiaSanPham() {
        return giaSanPham;
    }

}
