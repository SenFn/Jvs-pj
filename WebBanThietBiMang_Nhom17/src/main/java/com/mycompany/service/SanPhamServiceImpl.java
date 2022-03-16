/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.service;

import com.mycompany.dao.SanPhamDao;
import com.mycompany.entity.SanPham;
import com.mycompany.entity.ThongTinSanPham;
import java.io.InputStream;
import java.io.NotSerializableException;
import java.sql.SQLException;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author MPH
 */
@Service
public class SanPhamServiceImpl implements SanPhamService{
    @Autowired
    private SanPhamDao sanPhamDao;
    @Override
    @Transactional
    public List<SanPham> getSanPhams() {
        //throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
        return sanPhamDao.getSanPhams();
    }

    @Override
    @Transactional
    public SanPham getSanPham(int sanphamId) {
        //throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
         return sanPhamDao.getSanPham(sanphamId);
    }

    @Override
    @Transactional
    public ThongTinSanPham getThongTinSanPham(int sanphamId) {
         return sanPhamDao.getThongTinSanPham(sanphamId);
        //throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    @Transactional
    public void saveSanPham(SanPham sanPham,InputStream inputStream) throws SQLException, NotSerializableException {
          sanPhamDao.saveSanPham(sanPham,inputStream);
        //throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    @Transactional
    public void deleteSanPham(int theId) {
       // throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
        sanPhamDao.deleteSanPham(theId);
    }

    @Override
    @Transactional
    public List<SanPham> searchSanPhams(String theSearchName) {
      return sanPhamDao.searchSanPhams(theSearchName);
        // throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
}
