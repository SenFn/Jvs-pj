/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.dto;

import com.mycompany.entity.SanPham;
import com.mycompany.entity.ThongTinSanPham;
import java.util.List;

/**
 *
 * @author MPH
 */
public class SanPhamDTO {
      private SanPham sanham;
    private ThongTinSanPham thongTinSanPhams;

    public SanPham getSanham() {
        return sanham;
    }

    public void setSanham(SanPham sanham) {
        this.sanham = sanham;
    }

    public ThongTinSanPham getThongTinSanPhams() {
        return thongTinSanPhams;
    }

    public void setThongTinSanPhams(ThongTinSanPham thongTinSanPhams) {
        this.thongTinSanPhams = thongTinSanPhams;
    }
    
    
}
