/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.dao;

import com.mycompany.entity.SanPham;
import com.mycompany.entity.ThongTinSanPham;
import java.util.List;

/**
 *
 * @author MPH
 */
public interface ThongTinSanPhamDao {
    
   
    public ThongTinSanPham getThongTinSanPham(int thongtinsanphamId);
    public void saveThongTinSanPham(ThongTinSanPham thongTinSanPham, int id);
    public void deleteThongTinSanPham(int theId);
    public void updateThongTinSanPham(ThongTinSanPham thongTinSanPham, int sanphamId);
}
