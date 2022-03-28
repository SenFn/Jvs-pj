/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.dao;


import static com.mchange.v2.ser.SerializableUtils.toByteArray;
import com.mycompany.entity.SanPham;
import com.mycompany.entity.ThongTinSanPham;
import java.io.InputStream;

import java.nio.charset.Charset;
import java.sql.SQLException;
import java.util.List;

import javax.transaction.Transactional;
import org.apache.commons.io.IOUtils;

//import org.hibernate.Query;
import org.codehaus.plexus.util.Base64;
import  org.hibernate.query.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.EnableTransactionManagement;

/**
 *
 * @author MPH
 */
@Repository
@EnableTransactionManagement
public class SanPhamDaoimpl implements SanPhamDao{
    @Autowired
    private SessionFactory sessionFactory;
    
     
    @Transactional
    @Override
    public List<SanPham> getSanPhams() {
        Session currentSession = sessionFactory.getCurrentSession();
        Query<SanPham> theQuery = currentSession.createQuery("from SanPham",SanPham.class);
        List<SanPham> sanPham = theQuery.getResultList();
        return sanPham;
    }

    @Override
    public SanPham getSanPham(int sanphamId) {
        Session currentSession = sessionFactory.getCurrentSession();
        SanPham sanPham = currentSession.get(SanPham.class, sanphamId);
        return sanPham;
    }

    @Override
    public ThongTinSanPham getThongTinSanPham(int sanphamId) {
      SanPham sanPham = getSanPham(sanphamId);
      ThongTinSanPham thongTinSanPham = sanPham.getThongTinSanPhams();
      return thongTinSanPham;
    }

    @Override
    public void saveSanPham(SanPham sanPham,InputStream inputStream)  {
         try {
         Session currentSession = sessionFactory.getCurrentSession();
            if(inputStream!=null)
            {
                byte[] bytes = IOUtils.toByteArray(inputStream);
                sanPham.setImgSp(bytes);
                sanPham.getThongTinSanPhams().setImgtt(bytes);
                currentSession.saveOrUpdate(sanPham);
                if(sanPham.getMasp() != sanPham.getThongTinSanPhams().getId()){
                    sanPham.getThongTinSanPhams().setId(sanPham.getMasp());
                    saveSanPham(sanPham,null);
                }
            }else {
                String imgString = sanPham.getThongTinSanPhams().getImgtt();
                byte[] img = Base64.decodeBase64(new String(imgString).getBytes("UTF-8"));
                sanPham.setImgSp(img);
                currentSession.saveOrUpdate(sanPham);
            }

           } catch (Exception e) {
            e.printStackTrace();
        }
         
    }
 
//        try {
//            Session session = sessionFactory.getCurrentSession();
//            if (inputStream != null) {
//                byte[] bytes = IOUtils.toByteArray(inputStream);
//                
//                //Blob blob = Hibernate.getLobCreator(session).createBlob(bytes);
//                xeMay.setHinhAnh(blob);
//                
//            }
//            sessionFactory.getCurrentSession().save(xeMay);
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
    @Override
    public void deleteSanPham(int theId) {
       Session currentSession = sessionFactory.getCurrentSession();
       SanPham sanPham = currentSession.get(SanPham.class, theId);
       currentSession.delete(sanPham);
    }

    @Override
    public List<SanPham> searchSanPhams(String theSearchName) {
        Session currentSession = sessionFactory.getCurrentSession();    
       Query theQuery = null;
        if (theSearchName != null && theSearchName.trim().length() > 0) {
            theQuery =currentSession.createQuery("from SanPham where lower(ten_san_pham) like :theName", SanPham.class);
       
           theQuery.setParameter("theName", "%" + theSearchName.toLowerCase() + "%");
        }
        else {
            // theSearchName is empty ... so just get all customers
            theQuery =currentSession.createQuery("from SanPham", SanPham.class);            
        }
        
        // execute query and get result list
        List<SanPham> sanPham = theQuery.getResultList();
                
        // return the results        
        return sanPham;
    }
    
}
