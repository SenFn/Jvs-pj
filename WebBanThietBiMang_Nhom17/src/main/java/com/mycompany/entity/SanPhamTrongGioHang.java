/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.entity;

import com.sun.org.apache.xerces.internal.impl.dv.util.Base64;
import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.sql.Blob;
import java.sql.SQLException;
import javax.imageio.ImageIO;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.sql.rowset.serial.SerialBlob;

/**
 *
 * @author MPH
 */
//create table gio_hang(
//maghh AS 'ghh' + convert(varchar(10),id) PERSISTED primary key,
//ten_san_pham nvarchar(100),
//img varbinary(max),
//loai_san_pham varchar(50),
//gia_san_pham double precision,
//trang_thai int,
//id INT IDENTITY(1,1),
//masp varchar(12)
//)
@Entity
@Table(name = "san_pham_trong_gio_hang")
public class SanPhamTrongGioHang {
    @Id
    @Column(name = "maspgh")
     @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int maspgh;
     @Column(name = "masp")
    private int masp;
    @Column(name = "ten_san_pham")
    private String tenSanPham;
    @Column(name = "img")
    private  byte[] imggh;
    @Column(name = "gia_san_pham")
    private double giaSanPham;
    @Column(name = "so_luong")
    private int soLuong;

    public SanPhamTrongGioHang(){
       
    }

    public SanPhamTrongGioHang(int masp, String tenSanPham,  byte[] imggh, double giaSanPham, int soLuong) {
        this.masp = masp;
        this.tenSanPham = tenSanPham;
        this.imggh = imggh;
        this.giaSanPham = giaSanPham;
        this.soLuong = soLuong;
    }

  

    public SanPhamTrongGioHang(String tenSanPham,  byte[] imggh, String loaiSanPham, double giaSanPham, int soLuong, int trangThai) {
        this.tenSanPham = tenSanPham;
        this.imggh = imggh;
        //this.loaiSanPham = loaiSanPham;
        this.giaSanPham = giaSanPham;
        this.soLuong = soLuong;
        //this.trangThai = trangThai;
    }

    public int getMaspgh() {
        return maspgh;
    }

    public void setMaspgh(int maspgh) {
        this.maspgh = maspgh;
    }

   

    public String getTenSanPham() {
        return tenSanPham;
    }

    public void setTenSanPham(String tenSanPham) {
        this.tenSanPham = tenSanPham;
    }

    public  String getImggh() throws IOException {
        ByteArrayInputStream in = new ByteArrayInputStream(imggh);
        BufferedImage image = ImageIO.read(in);
        ByteArrayOutputStream output = new ByteArrayOutputStream();
        ImageIO.write(image, "png", output);
        String imageAsBase64 = java.util.Base64.getEncoder().encodeToString(output.toByteArray());
        return imageAsBase64;
    }

    public void setImggh(String imggh) {       
        byte[] decodedByte = Base64.decode(imggh);
        this.imggh = decodedByte;
    }

   

//    public String getLoaiSanPham() {
//        return loaiSanPham;
//    }
//
//    public void setLoaiSanPham(String loaiSanPham) {
//        this.loaiSanPham = loaiSanPham;
//    }

    public double getGiaSanPham() {
        return giaSanPham;
    }

    public void setGiaSanPham(double giaSanPham) {
        this.giaSanPham = giaSanPham;
    }

    public int getSoLuong() {
        return soLuong;
    }

    public void setSoLuong(int soLuong) {
        this.soLuong = soLuong;
    }

    public int getMasp() {
        return masp;
    }

//    public int getTrangThai() {
    public void setMasp(int masp) {
        this.masp = masp;
    }

//        return trangThai;
//    }
//
//    public void setTrangThai(int trangThai) {
//        this.trangThai = trangThai;
//    }
  

    
}
