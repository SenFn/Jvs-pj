/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.service;

import com.mycompany.entity.ThongTinSanPham;

/**
 *
 * @author MPH
 */
public interface ThongTinSanPhamService {
  public ThongTinSanPham getThongTinSanPham(int thongtinsanphamId);
    public void saveThongTinSanPham(ThongTinSanPham thongTinSanPham, int id);
    public void deleteThongTinSanPham(int theId);
    public void updateThongTinSanPham(ThongTinSanPham thongTinSanPham, int sanphamId); 
}
