/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.service;

import com.mycompany.entity.GiaoHang;
import java.util.List;

/**
 *
 * @author MPH
 */

public interface GiaoHangService {
      public List<GiaoHang> getGiaoHangs(int id);
     public void updateGiaoHang(GiaoHang ttsp, int hoadonId);
      public void saveGiaoHang(GiaoHang giaoHang, int id);
      public GiaoHang getGiaoHang(int id);
    public void deleteGiaoHang(int theId);

    void saveGiaoHang(GiaoHang giaoHang);
}
