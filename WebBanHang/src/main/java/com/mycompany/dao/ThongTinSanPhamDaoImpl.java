/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.dao;

import com.mycompany.entity.SanPham;
import com.mycompany.entity.ThongTinSanPham;
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
public class ThongTinSanPhamDaoImpl implements ThongTinSanPhamDao{
    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public void saveThongTinSanPham(ThongTinSanPham thongTinSanPham, int id) {
        Session currentSession = sessionFactory.getCurrentSession();
        SanPham sanPham  = currentSession.get(SanPham.class, id);
        sanPham.setThongTinSanPhams(thongTinSanPham);
         currentSession.saveOrUpdate(thongTinSanPham);
    }

    @Override
    public void deleteThongTinSanPham(int theId) {
      //  throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
       Session currentSession = sessionFactory.getCurrentSession();
        ThongTinSanPham thongTinSanPham = currentSession.get(ThongTinSanPham.class, theId);
       currentSession.delete(thongTinSanPham);
    
    }

    @Override
    public ThongTinSanPham getThongTinSanPham(int id) {

         Session currentSession = sessionFactory.getCurrentSession();
         Query thequery =  currentSession.createQuery("from ThongTinSanPham where masp=:idsp");
        thequery.setParameter("idsp",id);
         ThongTinSanPham thongTinSanPham = (ThongTinSanPham) thequery.uniqueResult();
         return thongTinSanPham ;
       // throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
//    @Override
//    public ThongTinSanPham getThongTinSanPham(int id) {
////           Query<CreditCard> theQuery;
////        theQuery = currentSession.createQuery("from credit_card where id =" +PersonId, CreditCard.class);
////            // execute query and get result list
////            List<CreditCard> creditCards = theQuery.getResultList();
////            return  creditCards;
//         Session currentSession = sessionFactory.getCurrentSession();
//         Query<ThongTinSanPham> thequery =  currentSession.createQuery("from ThongTinSanPham where masp='" +id+"'", ThongTinSanPham.class);
//       
//         ThongTinSanPham thongTinSanPham = thequery.getSingleResult();
//         return thongTinSanPham ;
//       // throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
//    }

    @Override
    public void updateThongTinSanPham(ThongTinSanPham ttsp, int sanphamId) {
         Session currentSession = sessionFactory.getCurrentSession();
       SanPham sanPham= currentSession.get(SanPham.class, sanphamId);
       ThongTinSanPham thongTinSanPham = sanPham.getThongTinSanPhams();      
        setValue(thongTinSanPham, ttsp);
         currentSession.saveOrUpdate(ttsp);
      //  throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
     private void setValue(ThongTinSanPham the, ThongTinSanPham temp)
    {
        //the.setNumber(temp.getNumber());
       //the.setImgtt(temp.getImgtt());
       the.setTenSanPham(temp.getTenSanPham());
       the.setNhaCungCap(temp.getTenSanPham());
       the.setMoTa(temp.getMoTa());
       the.setBaoHanh(temp.getBaoHanh());
    }
}
