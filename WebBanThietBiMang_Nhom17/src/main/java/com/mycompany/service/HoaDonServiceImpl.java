/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.service;

import com.mycompany.dao.HoaDonDao;
//import com.mycompany.entity.ChiTietHoaDon;
import com.mycompany.entity.GiaoHang;
import com.mycompany.entity.GioHang;
import com.mycompany.entity.HoaDon;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author MPH
 */
@Service
public class HoaDonServiceImpl implements HoaDonService{
    @Autowired
    private HoaDonDao hoaDonDao;
    
    @Override
    @Transactional
    public List<HoaDon> getHoaDons(int khachhangId) {
        return hoaDonDao.getHoaDons(khachhangId);
        //throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    @Transactional
    public HoaDon getHoaDon(int theId) {
        return hoaDonDao.getHoaDon(theId);
      //  throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }


   
    @Override
    @Transactional
    public void deleteHoaDon(int theId) {
        hoaDonDao.deleteHoaDon(theId);
      //  throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    @Transactional
    public List<HoaDon> searchHoaDon(String theSearchName) {
        return hoaDonDao.searchHoaDon(theSearchName);
      //  throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    @Transactional
    public GiaoHang getGiaohang(int theId) {
        return hoaDonDao.getGiaohang(theId);
       // throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    @Transactional
    public int NextIdHD() {
        return hoaDonDao.NextIdHD();
        //throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    @Transactional
    public void saveHoaDon(HoaDon hoaDon, int khachHangid) {
        hoaDonDao.saveHoaDon(hoaDon, khachHangid);
      //  throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
      @Transactional
    public void updateGioHangCuaHoaDon(int i, int i1) {
        hoaDonDao.updateGioHangCuaHoaDon(i, i1);
        //throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

   
    
}
