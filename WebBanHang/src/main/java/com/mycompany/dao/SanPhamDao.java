/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.dao;
import com.mycompany.entity.ThongTinSanPham;
import com.mycompany.entity.SanPham;
import java.io.InputStream;
import java.io.NotSerializableException;
import java.sql.SQLException;
import java.util.List;

/**
 *
 * @author MPH
 */
public interface SanPhamDao {
    public List<SanPham> getSanPhams();
    public SanPham getSanPham(int sanphamId);
    public ThongTinSanPham getThongTinSanPham(int sanphamId);
    public void saveSanPham(SanPham sanPham,InputStream inputStream) throws SQLException, NotSerializableException;
    public void deleteSanPham(int theId);
    public List<SanPham> searchSanPhams(String theSearchName);
}
