/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.entity;

import java.util.ArrayList;
import java.util.List;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 *
 * @author s3n
 */
@Entity
@Table(name = "gio_hang")
public class GioHang {

    @Id
    @Column(name = "maghh")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int maghh;
    @OneToMany(fetch = FetchType.EAGER, cascade = CascadeType.ALL)
    @JoinColumn(name = "maghh")
    private List<SanPhamTrongGioHang> sanPhamTrongGioHangs;
    public GioHang() {

    }

    
    
    public GioHang( List<SanPhamTrongGioHang> sanPhamTrongGioHangs) {
       //his.tongtien = tongtien;
        this.sanPhamTrongGioHangs = sanPhamTrongGioHangs;
    }

    public int getMaghh() {
        return maghh;
    }

    public void setMaghh(int maghh) {
        this.maghh = maghh;
    }

   

    public List<SanPhamTrongGioHang> getSanPhamTrongGioHangs() {
        return sanPhamTrongGioHangs;
    }

    public SanPhamTrongGioHang getSanPhamTrongGioHang(int SanPhamTrongGioHangId) {
        if (sanPhamTrongGioHangs != null) {
            for (SanPhamTrongGioHang theSanPhamTrongGioHang : sanPhamTrongGioHangs) {
                if (theSanPhamTrongGioHang.getMaspgh() == SanPhamTrongGioHangId) {
                    return theSanPhamTrongGioHang;
                }
            }
        }
        return null;
    }

    public void setSanPhamTrongGioHangs(List<SanPhamTrongGioHang> sanPhamTrongGioHangs) {
        this.sanPhamTrongGioHangs = sanPhamTrongGioHangs;
    }

    public void addSanPhamTrongGioHang(SanPhamTrongGioHang sanPhamTrongGioHang) {
        if (sanPhamTrongGioHangs == null) {
            sanPhamTrongGioHangs = new ArrayList<>();
        }
        sanPhamTrongGioHangs.add(sanPhamTrongGioHang);
    }

}
