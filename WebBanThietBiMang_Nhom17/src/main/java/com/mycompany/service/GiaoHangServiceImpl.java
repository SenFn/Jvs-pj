/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.service;

import com.mycompany.dao.GiaoHangDao;
import com.mycompany.entity.GiaoHang;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author MPH
 */
@Service
public class GiaoHangServiceImpl implements GiaoHangService{
    @Autowired
    private GiaoHangDao giaoHangDao;

    @Override
    @Transactional
    public void saveGiaoHang(GiaoHang giaoHang, int id) {
        giaoHangDao.saveGiaoHang(giaoHang,id);
        //throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    @Transactional
    public void deleteGiaoHang(int theId) {
        giaoHangDao.deleteGiaoHang(theId);
        //throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    @Transactional
    public void updateGiaoHang(GiaoHang gh, int string) {
        giaoHangDao.updateGiaoHang(gh, string);
       // throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    @Transactional
    public GiaoHang getGiaoHang(int string) {
        return giaoHangDao.getGiaoHang(string);
       // throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
     @Transactional
    public List<GiaoHang> getGiaoHangs(int id) {
        return giaoHangDao.getGiaoHangs(id);
       // throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
}
