/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.service;

import com.mycompany.dao.KhachHangDao;
import com.mycompany.entity.SanPhamTrongGioHang;
import com.mycompany.entity.HoaDon;
import com.mycompany.entity.KhachHang;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author MPH
 */

@Service
public class KhachHangServiceImpl implements KhachHangService {

    @Autowired
    private KhachHangDao khachHangDao;

    @Override
    @Transactional
    public List<KhachHang> getKhachHangs() {
        return khachHangDao.getKhachHangs();
        //  throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    @Transactional
    public KhachHang getKhachHang(int theId) {
        return khachHangDao.getKhachHang(theId);
        //  throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    @Transactional
    public List<HoaDon> getHoaDons(int Id) {
        return khachHangDao.getHoaDons(Id);
        //  throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

//    @Override
//    @Transactional
//    public SanPhamTrongGioHang getGioHang(int Id) {
//        
//       return khachHangDao.getGioHang(Id);
//      //  throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
//    }
    @Override
    @Transactional
    public void saveKhachHang(KhachHang khachHang) {
        khachHangDao.saveKhachHang(khachHang);
        // throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    @Transactional
    public void deleteKhachHang(int theId) {
        khachHangDao.deleteKhachHang(theId);
        //throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    @Transactional
    public List<KhachHang> searchKhachHang(String theSearchName) {
        return khachHangDao.searchKhachHang(theSearchName);
        //  throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    @Transactional
    public int NextIdKh() {
        return khachHangDao.NextIdKh();
        // throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    @Transactional
    public KhachHang getKhachHangByName(String string) {
        return khachHangDao.getKhachHangByName(string);
        // throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}
