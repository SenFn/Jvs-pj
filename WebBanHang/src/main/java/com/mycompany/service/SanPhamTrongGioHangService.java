/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.service;

import com.mycompany.entity.SanPhamTrongGioHang;

/**
 *
 * @author MPH
 */
public interface SanPhamTrongGioHangService {
     public double TongGiaGioHang(int giohangId);
    public int countGioHang(int giohangId);
          public void updateSanPhamTrongGioHang(SanPhamTrongGioHang SanPhamTrongGioHang, int gioHangId);
     public SanPhamTrongGioHang getSanPhamTrongGioHang(int id);
    public void saveSanPhamTrongGioHang(SanPhamTrongGioHang sanPhamTrongGioHang, int id);
    public void deleteSanPhamTrongGioHang(int theId);
}
