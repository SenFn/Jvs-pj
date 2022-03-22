/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.dao;

import com.mycompany.entity.GiaoHang;
import com.mycompany.entity.KhachHang;
import com.mycompany.entity.ThongTinSanPham;
import java.util.List;

/**
 *
 * @author MPH
 */
public interface GiaoHangDao {
      public List<GiaoHang> getGiaoHangs(int id);
     public void updateGiaoHang(GiaoHang ttsp, int hoadonId);
     public GiaoHang getGiaoHang(int id);
    public void saveGiaoHang(GiaoHang giaoHang, int id);
    public void deleteGiaoHang(int theId);

    void saveGiaoHang(GiaoHang giaoHang);
}
