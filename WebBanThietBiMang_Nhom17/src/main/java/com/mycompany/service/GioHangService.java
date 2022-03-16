/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.service;

import com.mycompany.entity.GioHang;
import com.mycompany.entity.SanPhamTrongGioHang;

/**
 *
 * @author MPH
 */
public interface GioHangService {
      public GioHang getGioHanghd(int hoadonId);
    public SanPhamTrongGioHang getSanPhamTrongGioHang(int id);
    public SanPhamTrongGioHang updateSoLuongSanPham(SanPhamTrongGioHang sanPhamTrongGioHang , int soluong);
    public GioHang getGioHang(int id);
      public void updateGiaoHang(GioHang ttsp, int khachhangId);
    public GioHang saveGioHang(GioHang gioHang);
    public void deleteGioHang(int theId);
}
