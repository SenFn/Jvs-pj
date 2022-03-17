/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.service;

import com.mycompany.entity.SanPhamTrongGioHang;
import com.mycompany.entity.HoaDon;
import com.mycompany.entity.KhachHang;
import java.util.List;

/**
 *
 * @author MPH
 */
public interface KhachHangService {
     public int NextIdKh();
      public KhachHang getKhachHangByName(String name);
     public List<KhachHang> getKhachHangs();
    public KhachHang getKhachHang(int theId);
    public List<HoaDon> getHoaDons(int Id);
    //public SanPhamTrongGioHang getGioHang(int Id);
    public void saveKhachHang(KhachHang khachHang);
    public void deleteKhachHang(int theId);
    public List<KhachHang> searchKhachHang(String theSearchName);
}
