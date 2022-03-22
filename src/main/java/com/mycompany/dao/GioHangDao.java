/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.dao;

import com.mycompany.entity.GioHang;
import com.mycompany.entity.SanPhamTrongGioHang;

/**
 *
 * @author MPH
 */
public interface GioHangDao {
    ///public List<KhachHang> getKhachHangs();
    //  public GioHang getGioHang(int theId);
    //  public List<HoaDon> getHoaDons(int Id);
    public SanPhamTrongGioHang getSanPhamTrongGioHang(int id);
    public SanPhamTrongGioHang updateSoLuongSanPham(SanPhamTrongGioHang sanPhamTrongGioHang , int soluong);
    public GioHang getGioHang(int id);
    public GioHang getGioHanghd(int hoadonId);
//    public void updateGiaoHang(GioHang ttsp, int khachhangId);
//    public List<HoaDon> getSanPhamTrongGioHangs(int gioHangId);
    public GioHang saveGioHang(GioHang gioHang);
    public void deleteGioHang(int theId);

    void saveGioHang(GioHang gioHang, int mahd);

    //  public List<KhachHang> searchKhachHang(String theSearchName);
 
    
}
