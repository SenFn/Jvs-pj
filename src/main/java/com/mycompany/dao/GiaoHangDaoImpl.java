/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.dao;

import com.mycompany.entity.GiaoHang;
import com.mycompany.entity.HoaDon;

import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.EnableTransactionManagement;

/**
 *
 * @author MPH
 */
@Repository
@EnableTransactionManagement
public class GiaoHangDaoImpl implements GiaoHangDao{
    @Autowired
    SessionFactory sessionFactory;
    @Override
    public void saveGiaoHang(GiaoHang giaoHang, int id) {
        //throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
        Session currentSession = sessionFactory.getCurrentSession();
        HoaDon hoaDon = currentSession.get(HoaDon.class, id);
        hoaDon.addGiaoHang(giaoHang);
        currentSession.saveOrUpdate(giaoHang);
    }

    @Override
    public void deleteGiaoHang(int theId) {
       // throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
     // get the current hibernate session
            Session currentSession = sessionFactory.getCurrentSession();
           GiaoHang giaoHang = currentSession.get(GiaoHang.class, theId);
            currentSession.delete(giaoHang);
    }

    @Override
    public void saveGiaoHang(GiaoHang giaoHang) {
        Session currentSession = sessionFactory.getCurrentSession();
        currentSession.saveOrUpdate(giaoHang);
    }

    @Override
    public GiaoHang getGiaoHang(int id) {
          Session currentSession = sessionFactory.getCurrentSession();
           GiaoHang giaoHang = currentSession.get(GiaoHang.class, id);
         return giaoHang ;
       // throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
      @Override
    public List<GiaoHang> getGiaoHangs(int id) {
          Session currentSession = sessionFactory.getCurrentSession();
           Query<GiaoHang> theQuery = 
                currentSession.createQuery("from GiaoHang where mahd ="+id, GiaoHang.class);
            // execute query and get result list
            List<GiaoHang> giaoHang = theQuery.getResultList();
           
         return giaoHang ;
       // throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
     @Override
    public void updateGiaoHang(GiaoHang ttsp, int hoadonId) {
//         Session currentSession = sessionFactory.getCurrentSession();
//          HoaDon hoaDon = currentSession.get(HoaDon.class,hoadonId);
//          List<GiaoHang> giaoHang = hoaDon.getGiaoHangs();
//        setValue(giaoHang, ttsp);
//         currentSession.saveOrUpdate(ttsp);
      //  throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
     private void setValue(GiaoHang the, GiaoHang temp)
    {
        the.setCongTyShip(temp.getCongTyShip());
       // the.setSoDienThoaiShip(temp.getSoDienThoaiShip());
        the.setDiaChiGiaoHang(temp.getDiaChiGiaoHang());

        
    }
}
