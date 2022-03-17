/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.service;

import com.mycompany.dao.GioHangDao;
import com.mycompany.entity.GioHang;
import com.mycompany.entity.SanPhamTrongGioHang;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author MPH
 */
@Service
public class GioHangServiceImpl implements GioHangService{
    @Autowired
    private GioHangDao gioHangDao;
    @Override
    @Transactional
    public GioHang saveGioHang(GioHang gioHang) {
       return  gioHangDao.saveGioHang(gioHang);
       // throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    @Transactional
    public void deleteGioHang(int theId) {
    gioHangDao.deleteGioHang(theId);
// throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
     @Transactional
    public GioHang getGioHang(int id) {
        return gioHangDao.getGioHang(id);
        //throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
     @Transactional
    public void updateGiaoHang(GioHang gh, int string) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
     @Transactional
    public SanPhamTrongGioHang updateSoLuongSanPham(SanPhamTrongGioHang sptgh, int i) {
        return gioHangDao.updateSoLuongSanPham(sptgh, i);
       // throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    @Transactional
    public SanPhamTrongGioHang getSanPhamTrongGioHang(int i) {
       // throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
       return gioHangDao.getSanPhamTrongGioHang(i);
    }

    @Override
      @Transactional
    public GioHang getGioHanghd(int hoadonId) {
        return  gioHangDao.getGioHanghd(hoadonId);
       // throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
}
