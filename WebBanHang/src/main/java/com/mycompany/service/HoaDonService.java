/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.service;

//import com.mycompany.entity.ChiTietHoaDon;
import com.mycompany.entity.GiaoHang;
import com.mycompany.entity.GioHang;
import com.mycompany.entity.HoaDon;
import java.util.List;

/**
 *
 * @author MPH
 */
public interface HoaDonService {
     public int NextIdHD();
    public List<HoaDon> getHoaDons(int khachhangId);
    public HoaDon getHoaDon(int theId);
    public void updateGioHangCuaHoaDon(int hoadonId, int giohangId);
   // public List<ChiTietHoaDon> getChiTietHoaDonDaos(int Id);
    public void saveHoaDon(HoaDon hoaDon, int khachHangid) ;
    public void deleteHoaDon(int theId);
    public List<HoaDon> searchHoaDon(String theSearchName);
    public GiaoHang getGiaohang(int theId);
}
