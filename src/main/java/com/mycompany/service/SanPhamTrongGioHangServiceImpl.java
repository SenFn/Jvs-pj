/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.service;

import com.mycompany.dao.SanPhamTrongGioHangDao;
import com.mycompany.entity.SanPhamTrongGioHang;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author MPH
 */
@Service
public class SanPhamTrongGioHangServiceImpl implements SanPhamTrongGioHangService{
 @Autowired
 private SanPhamTrongGioHangDao sanPhamTrongGioHangDao;
    @Override
    @Transactional
    public void updateSanPhamTrongGioHang(SanPhamTrongGioHang SanPhamTrongGioHang, int gioHangId) {
       // throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
       sanPhamTrongGioHangDao.updateSanPhamTrongGioHang(SanPhamTrongGioHang, gioHangId);
    }

    @Override
     @Transactional
    public SanPhamTrongGioHang getSanPhamTrongGioHang(int id) {
      //  throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
      return sanPhamTrongGioHangDao.getSanPhamTrongGioHang(id);
    }

    @Override
     @Transactional
    public void saveSanPhamTrongGioHang(SanPhamTrongGioHang sanPhamTrongGioHang, int id) {
       // throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
       sanPhamTrongGioHangDao.saveSanPhamTrongGioHang(sanPhamTrongGioHang, id);
    }

    @Override
     @Transactional
    public void deleteSanPhamTrongGioHang(int theId) {
      //  throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
  sanPhamTrongGioHangDao.deleteSanPhamTrongGioHang(theId);
    }

    @Override
     @Transactional
    public int countGioHang(int giohangId) {
        return sanPhamTrongGioHangDao.countGioHang(giohangId);
    //    throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    @Transactional
    public double TongGiaGioHang(int i) {
       return sanPhamTrongGioHangDao.TongGiaGioHang(i);
        //throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
}
