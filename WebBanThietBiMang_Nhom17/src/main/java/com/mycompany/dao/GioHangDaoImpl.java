/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.dao;

import com.mycompany.entity.GiaoHang;
import com.mycompany.entity.GioHang;
import com.mycompany.entity.SanPhamTrongGioHang;
import com.mycompany.entity.KhachHang;
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
public class GioHangDaoImpl implements GioHangDao{
    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public GioHang saveGioHang(GioHang gioHang) {
       // throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
        Session currentSession = sessionFactory.getCurrentSession();
            currentSession.saveOrUpdate(gioHang);
            return gioHang;
            
    }
    @Override
    public GioHang getGioHang(int id) {
          Session currentSession = sessionFactory.getCurrentSession();
           GioHang gioHang = currentSession.get(GioHang.class, id);
         return gioHang ;
       // throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    @Override
    public void deleteGioHang(int theId) {
      //  throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
         Session currentSession = sessionFactory.getCurrentSession();
           GioHang gioHang = currentSession.get(GioHang.class, theId);
            currentSession.delete(gioHang);
    }
    @Override
    public SanPhamTrongGioHang updateSoLuongSanPham(SanPhamTrongGioHang sanPhamTrongGioHang , int soluong){
        //SanPhamTrongGioHang sanPhamTrongGioHang1= new SanPhamTrongGioHang();
         Session currentSession = sessionFactory.getCurrentSession();
         sanPhamTrongGioHang.setSoLuong(soluong);
        currentSession.update(sanPhamTrongGioHang);
        return sanPhamTrongGioHang;
         
    }
//     @Override
//    public GioHang updateGioHangVaoHoaDon(GioHang gioHang , int hoaDonId){
//        //SanPhamTrongGioHang sanPhamTrongGioHang1= new SanPhamTrongGioHang();
//         Session currentSession = sessionFactory.getCurrentSession();
//         gioHang.set
//        currentSession.update(sanPhamTrongGioHang);
//        return sanPhamTrongGioHang;
//         
//    }
   
     @Override
    public SanPhamTrongGioHang getSanPhamTrongGioHang(int id){
         Session currentSession = sessionFactory.getCurrentSession();
         SanPhamTrongGioHang sanPhamTrongGioHang = currentSession.get(SanPhamTrongGioHang.class, id);
         return sanPhamTrongGioHang;
    }
     @Override
    public GioHang getGioHanghd(int hoadonId) {
         Session currentSession = sessionFactory.getCurrentSession();
       Query query = currentSession.createQuery("from GioHang where mahd=:namekh");
       query.setParameter("namekh",hoadonId);
       GioHang gioHang = (GioHang) query.uniqueResult();
       return gioHang;
       // throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
}
