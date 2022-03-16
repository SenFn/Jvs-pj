/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.dao;

import com.mycompany.entity.SanPhamTrongGioHang;
import com.mycompany.entity.HoaDon;
import com.mycompany.entity.KhachHang;
import java.math.BigDecimal;
import java.math.BigInteger;
import java.util.List;
import javax.transaction.Transactional;
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
public class KhachHangDaoImpl implements KhachHangDao{
   
    @Autowired
    SessionFactory sessionFactory;
    @Transactional
    @Override
    public List<KhachHang> getKhachHangs() {
       Session currentSession = sessionFactory.getCurrentSession();
            Query<KhachHang> theQuery = 
                currentSession.createQuery("from KhachHang", KhachHang.class);
            // execute query and get result list
            List<KhachHang> khachHang = theQuery.getResultList();
            return khachHang;
    }

    @Override
    public KhachHang getKhachHang(int id) {
         Session currentSession = sessionFactory.getCurrentSession();
        KhachHang khachHang = currentSession.get(KhachHang.class,id );
        return khachHang;
    }

    @Override
    public List<HoaDon> getHoaDons(int Id) {
        KhachHang khachHang = getKhachHang(Id);
        List<HoaDon> hoaDons = khachHang.getHoaDons();
        return hoaDons;
    }

    @Override
    public void saveKhachHang(KhachHang khachHang) {
        Session currentSession = sessionFactory.getCurrentSession();
        currentSession.saveOrUpdate(khachHang);
    }
    // trả về id tiếp theo của khách hàng
    @Override
    public int NextIdKh(){
       // BigDecimal ma;
        BigDecimal MaKh ;
          Session currentSession = sessionFactory.getCurrentSession();
          Query query = currentSession.createSQLQuery("SELECT IDENT_CURRENT('san_pham_trong_gio_hang')+1");
         MaKh =  (BigDecimal) query.uniqueResult();  
          int NextMaKh = Integer.parseInt(String.valueOf(MaKh));
       return NextMaKh;
    }

    @Override
    public void deleteKhachHang(int theId) {
            Session currentSession = sessionFactory.getCurrentSession();
            KhachHang khachhang = currentSession.get(KhachHang.class, theId);
            currentSession.delete(khachhang);
    }

    @Override
    public List<KhachHang> searchKhachHang(String theSearchName) {
        Session currentSession = sessionFactory.getCurrentSession();       
        Query theQuery = null;
        if (theSearchName != null && theSearchName.trim().length() > 0) {
            theQuery =currentSession.createQuery("from khach_hang where lower(ten_khach_hang) like :theName", KhachHang.class);
            
           theQuery.setParameter("theName", "%" + theSearchName.toLowerCase() + "%");
        }
        else {
            theQuery =currentSession.createQuery("from khach_hang", KhachHang.class);
        }        
        List<KhachHang> khackHang = theQuery.getResultList();                     
        return khackHang;
    }

    @Override
    public KhachHang getKhachHangByName(String name) {
       Session currentSession = sessionFactory.getCurrentSession();
       Query query = currentSession.createQuery("from khach_hang where tenKhachHang=:namekh");
       query.setParameter("namekh",name);
       KhachHang khachHang = (KhachHang) query.uniqueResult();
       return khachHang;
    }


    
}
