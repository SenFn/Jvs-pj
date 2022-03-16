/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.service;

import com.mycompany.dao.ThongTinSanPhamDao;
import com.mycompany.entity.ThongTinSanPham;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author MPH
 */
@Service
public class ThongTinSanPhamServiceImpl implements ThongTinSanPhamService{
    @Autowired
    private ThongTinSanPhamDao thongTinSanPhamDao;
    @Override
    @Transactional
    public void saveThongTinSanPham(ThongTinSanPham thongTinSanPham, int id) {
        thongTinSanPhamDao.saveThongTinSanPham(thongTinSanPham,id);
      // throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    @Transactional
    public void deleteThongTinSanPham(int theId) {
        thongTinSanPhamDao.deleteThongTinSanPham(theId);
        //throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    @Transactional
    public ThongTinSanPham getThongTinSanPham(int string) {
        return thongTinSanPhamDao.getThongTinSanPham(string);
       // throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    @Transactional
    public void updateThongTinSanPham(ThongTinSanPham ttsp, int string) {
        thongTinSanPhamDao.updateThongTinSanPham(ttsp, string);
       // throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
}
